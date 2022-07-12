using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using ToDoList.Domain.DTO.Response;
using ToDoList.Domain.DTO.Request;
using ToDoList.Domain.Shared.Static;
using ToDoList.Service.Interfaces;

namespace ToDoList.Api.MiddleWare
{
    public class ApplicationMiddleware
    {
        private readonly RequestDelegate _next;
        public ApplicationMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task InvokeAsync(HttpContext httpContext, IAPILogService _APILogService)
        {
            var addAPILogDTO = new AddAPILogDTO();

            //Copy a pointer to the original response body stream
            var originalBodyStream = httpContext.Response.Body;

            try
            {
                using (var responseBodyStream = new MemoryStream())
                {
                    if (AppSettingConfigurations.AppSettings.EnableAPILog)
                    {
                        httpContext.Request.EnableBuffering();
                        //First, get the incoming request
                        addAPILogDTO.APIParams = await FormatRequestBody(httpContext.Request);
                        httpContext.Request.Body.Seek(0, SeekOrigin.Begin);


                        //Read API URL
                        string host = httpContext.Request.Host.ToString();
                        string prefix = host.Contains("localhost") ? "" : "/api";

                        addAPILogDTO.APIUrl = httpContext.Request.Scheme + "://" + httpContext.Request.Host + prefix + httpContext.Request.Path;

                        //Read Authorization Header
                        addAPILogDTO.Headers = httpContext.Request.Headers["Authorization"];

                        // Read Method
                        addAPILogDTO.Method = httpContext.Request.Method;
                        addAPILogDTO.APILogId = (await _APILogService.AddAPILog(addAPILogDTO)).KeyId;
                    }

                    httpContext.Response.Body = responseBodyStream;

                    await _next(httpContext);

                    //Format the response from the server
                    var response = FormatResponse(httpContext.Response, httpContext);

                    //Copy the contents of the new memory stream (which contains the response) to the original stream, which is then returned to the client.
                    await responseBodyStream.CopyToAsync(originalBodyStream);

                    await _APILogService.UpdateAPILog(new UpdateAPILogDTO() { APILogId = addAPILogDTO.APILogId, Success = true });
                }
            }
            catch (Exception ex)
            {
                httpContext.Response.Body = originalBodyStream;
                await HandleExceptionAsync(httpContext, ex, addAPILogDTO, _APILogService);
            }
        }
        private Task HandleExceptionAsync(HttpContext context, Exception exception, AddAPILogDTO addAPILogDTO, IAPILogService _APILogService)
        {
            HttpStatusCode statusCode = (exception as WebException != null &&
            ((HttpWebResponse)(exception as WebException).Response) != null) ?
            ((HttpWebResponse)(exception as WebException).Response).StatusCode
            : GetErrorCodes.GetErrorCode(exception.GetType());
            context.Response.StatusCode = (int)statusCode;
            context.Response.ContentType = "application/json";

            switch (AppSettingConfigurations.AppSettings.ErrorLoggingType.ToLower())
            {
                case "both":
                    {
                        LogExceptionInDB(exception, addAPILogDTO, _APILogService);
                        PostMessage(exception, addAPILogDTO);
                        break;
                    }
                case "db":
                    {
                        LogExceptionInDB(exception, addAPILogDTO, _APILogService);
                        break;
                    }
                case "slack":
                    {
                        PostMessage(exception, addAPILogDTO);
                        break;
                    }
                default:
                    break;
            }

            return context.Response.WriteAsync(new ErrorDetailDTO()
            {
                StatusCode = context.Response.StatusCode,
                Message = $"Message={exception.Message}"
            }.ToString());
        }
        private void LogExceptionInDB(Exception exception, AddAPILogDTO addAPILogDTO, IAPILogService _APILogService)
        {
            var updateAPILogDTO = new UpdateAPILogDTO();
            updateAPILogDTO.ExceptionMsg = exception.Message;
            updateAPILogDTO.ExceptionType = exception.GetType().Name;
            updateAPILogDTO.ExceptionSource = GenerateExceptionMessage(exception, addAPILogDTO);
            updateAPILogDTO.APILogId = addAPILogDTO.APILogId;
            _APILogService.UpdateAPILog(updateAPILogDTO);
        }
        private void PostMessage(Exception exception, AddAPILogDTO addAPILogDTO)
        {
            Payload payload = new Payload()
            {
                Channel = null,
                Username = null,
                Text = GenerateExceptionMessage(exception, addAPILogDTO)
            };
            string payloadJson = JsonConvert.SerializeObject(payload);

            using (WebClient client = new WebClient())
            {
                NameValueCollection data = new NameValueCollection();
                data["payload"] = payloadJson;

                var response = client.UploadValues(AppSettingConfigurations.AppSettings.SlackErrorLogPath, "POST", data);

                Encoding _encoding = new UTF8Encoding();
                //The response text is usually "ok"
                string responseText = _encoding.GetString(response);
            }
        }
        public string GenerateExceptionMessage(Exception exception, AddAPILogDTO addAPILogDTO)
        {
            return "APIURL : " + addAPILogDTO.APIUrl + System.Environment.NewLine + "APIParams : " + addAPILogDTO.APIParams + System.Environment.NewLine + "Method : " + addAPILogDTO.Method + System.Environment.NewLine +
            "Error Message : " + exception.Message + System.Environment.NewLine + "Inner Exception : " + exception.InnerException + System.Environment.NewLine +
            "Source : " + exception.Source + System.Environment.NewLine + "StackTrace : " + exception.StackTrace;
        }
        private async Task<string> FormatResponse(HttpResponse response, HttpContext httpContext)
        {
            //We need to read the response stream from the beginning...
            response.Body.Seek(0, SeekOrigin.Begin);

            //...and copy it into a string
            string text = await new StreamReader(response.Body).ReadToEndAsync();

            //We need to reset the reader for the response so that the client can read it.
            response.Body.Seek(0, SeekOrigin.Begin);

            SpResponseDTO SpResponseDTO = JsonConvert.DeserializeObject<SpResponseDTO>(text);
            if (SpResponseDTO != null && SpResponseDTO.ResponseCode != 200)
            {
                response.StatusCode = 500;
            }

            //Return the string for the response, including the status code (e.g. 200, 404, 401, etc.)
            return $"{response.StatusCode}: {text}";
        }
        private async Task<string> FormatRequestBody(HttpRequest request)
        {
            var body = request.Body;

            //We now need to read the request stream. First, we create a new byte[] with the same length as the request stream...
            var buffer = new byte[Convert.ToInt32(request.ContentLength)];

            //...Then we copy the entire request stream into the new buffer.
            await request.Body.ReadAsync(buffer, 0, buffer.Length);

            //We convert the byte[] into a string using UTF8 encoding...
            var bodyAsText = Encoding.UTF8.GetString(buffer);

            //..and finally, assign the read body back to the request body, which is allowed because of EnableRewind()
            request.Body = body;

            return bodyAsText;
        }
    }
}
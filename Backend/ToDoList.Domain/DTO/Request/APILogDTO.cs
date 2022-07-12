using Newtonsoft.Json;
using System.Text.Json;

namespace ToDoList.Domain.DTO.Request
{
    public class AddAPILogDTO
    {
        public string APIUrl { get; set; }
        public string APIParams { get; set; }
        public string Headers { get; set; }
        public string Method { get; set; }
        public int APILogId { get; set; }
    }

    public class UpdateAPILogDTO
    {
        public int APILogId { get; set; }
        public bool Success { get; set; }
        public string ExceptionMsg { get; set; }
        public string ExceptionType { get; set; }
        public string ExceptionSource { get; set; }
    }

    public class Payload
    {
        [JsonProperty("channel")]
        public string Channel { get; set; }

        [JsonProperty("username")]
        public string Username { get; set; }

        [JsonProperty("text")]
        public string Text { get; set; }
    }

    public class ErrorDetailDTO
    {
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public override string ToString()
        {
            return System.Text.Json.JsonSerializer.Serialize(this);
        }
    }
}
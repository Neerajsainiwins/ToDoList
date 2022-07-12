using Microsoft.AspNetCore.Builder;

namespace ToDoList.Api.MiddleWare
{
    public static class MiddlewareExtension
    {
        public static void ConfigureCustomApplicationMiddleware(this IApplicationBuilder app)
        {
            app.UseMiddleware<ApplicationMiddleware>();
        }
    }
}
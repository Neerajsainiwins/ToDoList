using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using ToDoList.Api.Controllers;
using ToDoList.Api.MiddleWare;
using ToDoList.Domain.Shared.Static;
using ToDoList.Repository.Interfaces;
using ToDoList.Repository.Repositories;
using ToDoList.Service.Interfaces;
using ToDoList.Service.Services;

namespace ToDoList.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        private IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        { 
            var appSettingsSection = Configuration.GetSection("AppSettings");
            var appSettings = appSettingsSection.Get<AppSettings>();
            
            // Set all appsetting configuration in static object 
            AppSettingConfigurations.AppSettings = appSettings;

            // Configure jwt authentication
            var key = Encoding.ASCII.GetBytes(appSettings.Secret);


            services.AddCors();
            services.AddControllers();
            if (appSettings.EnableSwagger)
            {
                // Register the Swagger generator, defining 1 or more Swagger documents
                services.AddSwaggerGen(c =>
                {
                    c.SwaggerDoc("v1",
                        new OpenApiInfo
                        {
                            Title = "ToDoList.Api",
                            Version = "v1"
                        });
                });
            }

            // Dependencies of Services
            services.AddTransient<IAPILogService, APILogService>();
            services.AddTransient<IGlobalCodeService, GlobalCodeService>();
            services.AddTransient<IToDoListService, ToDoListService>();

            // Dependencies of Repositories
            services.AddTransient<IAPILogRepository, APILogRepository>();
            services.AddTransient<IGlobalCodeRepository, GlobalCodeRepository>();
            services.AddTransient<IToDoListRepository, ToDoListRepository>();
        


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseStaticFiles();
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "ToDoList.Api v1"));

            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseCors(x => x
           .AllowAnyOrigin()
           .AllowAnyMethod()
           .AllowAnyHeader());

            app.ConfigureCustomApplicationMiddleware();

            // app.UseMiddleware<JwtMiddleware>();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}

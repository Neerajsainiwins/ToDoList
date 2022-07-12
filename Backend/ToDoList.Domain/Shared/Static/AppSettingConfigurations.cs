namespace ToDoList.Domain.Shared.Static
{
    public class AppSettingConfigurations
    {
        public static AppSettings AppSettings { get; set; }
    }

   public class AppSettings
    {
        public string Secret { get; set; }
        public string Timeout { get; set; }
        public bool EnableAPILog { get; set; }
        public string ErrorLoggingType { get; set; }
        public string SlackErrorLogPath { get; set; }
        public bool EnableSwagger { get; set; }

    }
}
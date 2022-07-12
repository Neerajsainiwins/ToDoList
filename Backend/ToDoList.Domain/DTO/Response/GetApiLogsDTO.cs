using System;

namespace ToDoList.Domain.DTO.Response
{
    public class GetApiLogsDTO
    {
        public int APILogId { get; set; }   
        public int ErrorLogId { get; set; } 
        public string APIUrl { get; set; }
        public string APIParams { get; set; }
        public string Headers { get; set; } 
        public string  Method { get; set; }
        public bool Success { get; set; }   
        public DateTime StartDateTime { get; set; } 
        public DateTime EndDateTime { get; set; }
    }
}
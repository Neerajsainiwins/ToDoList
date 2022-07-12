using System.ComponentModel.DataAnnotations;

namespace ToDoList.Domain.DTO.Request
{
    public class DeleteToDoListDTO
    {
        public int ToDoListId { get; set; }
        public string ActionPerformedBy { get; set; }
    }
}
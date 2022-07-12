using System.ComponentModel.DataAnnotations;

namespace ToDoList.Domain.DTO.Request
{
    public class AddToDoListDTO
    {
        public int? ToDoListId { get; set; }
        public int ColourId { get; set; }
        public string Text { get; set; }
        public string ActionPerformedBy{ get; set; }
    }
}
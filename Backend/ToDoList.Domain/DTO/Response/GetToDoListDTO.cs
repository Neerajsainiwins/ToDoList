namespace ToDoList.Domain.DTO.Response
{
    public class GetToDoListDTO
    {
        public int ToDoListId { get; set; }
        public int ColourId { get; set; }
        public string CodeName { get; set; }
        public string Text { get; set; }
        public bool IsActive { get; set; }
    }
    public class ToDoListSearchDTO : SearchDTO
    {
        public int ToDoListId { get; set; }
        public int ColourId { get; set; }


    }
}
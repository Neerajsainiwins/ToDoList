namespace ToDoList.Domain.DTO.Response
{
    public class GlobalCodeCategoriesDTO
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string AllowAddDelete { get; set; }
        public string AllowCodeNameEdit { get; set; }
        public string Description { get; set; }
    }
}
namespace ToDoList.Domain.DTO.Response
{
    public class GlobalCodesDTO
    {
        public int GlobalCodeId { get; set; }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CodeName { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }

    }

    public class GlobalSearchModel
    {
        public string CategoryName { get; set; }
        public int GlobalCodeId { get; set; }

    }
}
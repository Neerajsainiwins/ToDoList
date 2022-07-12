using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Domain.DTO.Request;
using ToDoList.Domain.DTO.Response;

namespace ToDoList.Service.Interfaces
{
    public interface IToDoListService
    {
        Task<SpResponseDTO> ToDoListAsync(AddToDoListDTO addToDoListDTO);
        Task<SpResponseDTO> DeleteToDoListAsync(DeleteToDoListDTO deleteToDoListDTO);
        Task<IEnumerable<GetToDoListDTO>> GetToDoListAsync(ToDoListSearchDTO toDoListSearchDTO);

    }
}
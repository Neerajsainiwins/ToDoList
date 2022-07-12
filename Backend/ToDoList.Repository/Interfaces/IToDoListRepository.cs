using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Domain.DTO.Request;
using ToDoList.Domain.DTO.Response;

namespace ToDoList.Repository.Interfaces
{
    public interface IToDoListRepository
    {
        Task<SpResponseDTO> ToDoListAsync(AddToDoListDTO addToDoListDTO);
        Task<IEnumerable<GetToDoListDTO>> GetToDoListAsync(ToDoListSearchDTO toDoListSearchDTO);
        Task<SpResponseDTO> DeleteToDoListAsync(DeleteToDoListDTO deleteToDoListDTO);
    }
}
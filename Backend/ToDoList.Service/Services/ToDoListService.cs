using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Domain.DTO.Request;
using ToDoList.Domain.DTO.Response;
using ToDoList.Repository.Interfaces;
using ToDoList.Service.Interfaces;

namespace ToDoList.Service.Services
{
    public class ToDoListService : IToDoListService
    {
        private readonly IToDoListRepository _ToDoListRepository;
        public ToDoListService(IToDoListRepository toDoListRepository)
        {
            _ToDoListRepository = toDoListRepository;
        }

        public async Task<SpResponseDTO> ToDoListAsync(AddToDoListDTO addToDoListDTO)
        {
            return await _ToDoListRepository.ToDoListAsync(addToDoListDTO);
        }

        public async Task<SpResponseDTO> DeleteToDoListAsync(DeleteToDoListDTO deleteToDoListDTO)
        {
            return await _ToDoListRepository.DeleteToDoListAsync(deleteToDoListDTO);
        }

        public async Task<IEnumerable<GetToDoListDTO>> GetToDoListAsync(ToDoListSearchDTO toDoListSearchDTO)
        {
            return await _ToDoListRepository.GetToDoListAsync(toDoListSearchDTO);
        }
    }
}
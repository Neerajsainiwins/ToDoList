using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Data.ToDoListGenericRepository;
using Microsoft.Extensions.Configuration;
using ToDoList.Domain.DTO.Request;
using ToDoList.Domain.DTO.Response;
using ToDoList.Repository.Interfaces;

namespace ToDoList.Repository.Repositories
{
    public class ToDoListRepository : GenericRepository, IToDoListRepository
    {
        public ToDoListRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public async Task<SpResponseDTO> ToDoListAsync(AddToDoListDTO addToDoListDTO)

        => await CommandAsync<SpResponseDTO>("sp_AddToDoList", addToDoListDTO);



        public async Task<SpResponseDTO> DeleteToDoListAsync(DeleteToDoListDTO deleteToDoListDTO)

        => await CommandAsync<SpResponseDTO>("sp_DeleteToDoList", deleteToDoListDTO);


        public async Task<IEnumerable<GetToDoListDTO>> GetToDoListAsync(ToDoListSearchDTO toDoListSearchDTO)

        => await CollectionsAsync<GetToDoListDTO>("sp_GetToDoLists", toDoListSearchDTO);


    }
}
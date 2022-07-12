using System.Threading.Tasks;
using ToDoList.Domain.DTO.Response;
using ToDoList.Domain.DTO.Request;
using System.Collections.Generic;

namespace ToDoList.Repository.Interfaces
{
    public interface IAPILogRepository
    {
        Task<SpResponseDTO> AddAPILog(AddAPILogDTO addAPILogDTO);
        Task<SpResponseDTO> UpdateAPILog(UpdateAPILogDTO updateAPILogDTO);
        Task<IEnumerable<GetApiLogsDTO>> GetApiLogsAsync();

    }
}
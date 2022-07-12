using System.Threading.Tasks;
using ToDoList.Domain.DTO.Response;
using ToDoList.Domain.DTO.Request;
using System.Collections.Generic;

namespace ToDoList.Service.Interfaces
{
    public interface IAPILogService
    {
        Task<SpResponseDTO> AddAPILog(AddAPILogDTO addAPILogDTO);
        Task<SpResponseDTO> UpdateAPILog(UpdateAPILogDTO updateAPILogDTO);
        Task<IEnumerable<GetApiLogsDTO>> GetAPILogsAsync();

    }
}
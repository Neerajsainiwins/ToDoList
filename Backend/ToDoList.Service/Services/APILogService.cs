using System.Threading.Tasks;
using ToDoList.Domain.DTO.Response;
using ToDoList.Domain.DTO.Request;
using ToDoList.Repository.Interfaces;
using ToDoList.Service.Interfaces;
using System.Collections.Generic;

namespace ToDoList.Service.Services
{
    public class APILogService : IAPILogService
    {
        private readonly IAPILogRepository _apiLogRepository;
        public APILogService(IAPILogRepository apiLogRepository)
        {
            _apiLogRepository = apiLogRepository;
        }
        public async Task<SpResponseDTO> AddAPILog(AddAPILogDTO addAPILogDTO)

        => await _apiLogRepository.AddAPILog(addAPILogDTO);

        public async Task<SpResponseDTO> UpdateAPILog(UpdateAPILogDTO updateAPILogDTO)

        => await _apiLogRepository.UpdateAPILog(updateAPILogDTO);

        public async Task<IEnumerable<GetApiLogsDTO>> GetAPILogsAsync()

        => await _apiLogRepository.GetApiLogsAsync();

    }
}
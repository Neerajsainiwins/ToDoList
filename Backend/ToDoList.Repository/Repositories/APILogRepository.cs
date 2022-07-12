using System;
using System.Threading.Tasks;
using ToDoList.Data.ToDoListGenericRepository;
using Microsoft.Extensions.Configuration;
using ToDoList.Domain.DTO.Response;
using ToDoList.Domain.DTO.Request;
using ToDoList.Repository.Interfaces;
using System.Collections.Generic;

namespace ToDoList.Repository.Repositories
{
    public class APILogRepository : GenericRepository, IAPILogRepository
    {
        public APILogRepository(IConfiguration configuration) : base(configuration)
        {

        }
        public async Task<SpResponseDTO> AddAPILog(AddAPILogDTO addAPILogDTO)

        => await CommandAsync<SpResponseDTO>("sp_AddAPILog", addAPILogDTO);


        public async Task<SpResponseDTO> UpdateAPILog(UpdateAPILogDTO updateAPILogDTO)


         => await CommandAsync<SpResponseDTO>("sp_UpdateAPILog", updateAPILogDTO);


        public async Task<IEnumerable<GetApiLogsDTO>> GetApiLogsAsync()

         => await CollectionsAsync<GetApiLogsDTO>("sp_GetAPILogs");


    }
}
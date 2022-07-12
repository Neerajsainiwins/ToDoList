using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Domain.DTO.Response;
using ToDoList.Repository.Interfaces;
using ToDoList.Service.Interfaces;

namespace ToDoList.Service.Services
{
    public class GlobalCodeService : IGlobalCodeService
    {
        private readonly IGlobalCodeRepository _globalCodeRepository;
        public GlobalCodeService(IGlobalCodeRepository globalCodeRepository)
        {
            _globalCodeRepository = globalCodeRepository;
        }

        public async Task<IEnumerable<GlobalCodeCategoriesDTO>> GlobalCodeCategoriesAsync()

        => await _globalCodeRepository.GlobalCodeCategoriesAsync();

        public async Task<IEnumerable<GlobalCodesDTO>> GlobalCodeListAnync(GlobalSearchModel globalSearchModel)

         => await _globalCodeRepository.GlobalCodeListAnync(globalSearchModel);


    }
}
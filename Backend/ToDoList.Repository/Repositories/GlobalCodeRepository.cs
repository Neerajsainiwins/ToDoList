using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Data.ToDoListGenericRepository;
using Microsoft.Extensions.Configuration;
using ToDoList.Domain.DTO.Response;
using ToDoList.Repository.Interfaces;

namespace ToDoList.Repository.Repositories
{
    public class GlobalCodeRepository : GenericRepository, IGlobalCodeRepository
    {
        public GlobalCodeRepository(IConfiguration configuration) : base(configuration)
        {

        }

        public async Task<IEnumerable<GlobalCodeCategoriesDTO>> GlobalCodeCategoriesAsync()

        => await CollectionsAsync<GlobalCodeCategoriesDTO>("sp_GetGlobalCodeCategories");


        public async Task<IEnumerable<GlobalCodesDTO>> GlobalCodeListAnync(GlobalSearchModel globalSearchModel)

        => await CollectionsAsync<GlobalCodesDTO>("sp_GetGlobalCodes", globalSearchModel);

    }
}
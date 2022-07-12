using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Domain.DTO.Response;

namespace ToDoList.Repository.Interfaces
{
    public interface IGlobalCodeRepository
    {
        Task<IEnumerable<GlobalCodesDTO>> GlobalCodeListAnync(GlobalSearchModel globalSearchModel);
        Task<IEnumerable<GlobalCodeCategoriesDTO>> GlobalCodeCategoriesAsync();

    }
}
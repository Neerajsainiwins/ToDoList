using System.Collections.Generic;
using System.Threading.Tasks;
using ToDoList.Domain.DTO.Response;

namespace ToDoList.Service.Interfaces
{
    public interface IGlobalCodeService
     {
        Task<IEnumerable<GlobalCodesDTO>> GlobalCodeListAnync(GlobalSearchModel globalSearchModel);
        Task<IEnumerable<GlobalCodeCategoriesDTO>> GlobalCodeCategoriesAsync();        
    
    }
}
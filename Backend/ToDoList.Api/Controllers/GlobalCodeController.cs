using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ToDoList.Domain.DTO.Response;
using ToDoList.Service.Interfaces;

namespace ToDoList.Api.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class GlobalCodeController : ControllerBase
    {
        private readonly IGlobalCodeService _globalCodeService;
        public GlobalCodeController(IGlobalCodeService globalCodeService)
        {
            _globalCodeService = globalCodeService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAsync([FromQuery] GlobalSearchModel globalSearchModel)
        {
            IEnumerable<GlobalCodesDTO> collection = await _globalCodeService.GlobalCodeListAnync(globalSearchModel);
            return Ok(collection);

        }

        [HttpGet("Category")]
        public async Task<IActionResult> GetCategoryAsync()
        {
            try
            {

                IEnumerable<GlobalCodeCategoriesDTO> collection = await _globalCodeService.GlobalCodeCategoriesAsync();
                return Ok(collection);
            }

            catch (Exception ex)
            {
                throw ex;

            }


        }

    }
}
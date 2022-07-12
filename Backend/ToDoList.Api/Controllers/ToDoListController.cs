using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ToDoList.Domain.DTO.Request;
using ToDoList.Domain.DTO.Response;
using ToDoList.Service.Interfaces;

namespace ToDoList.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ToDoListController : ControllerBase
    {
        private readonly IToDoListService _ToDoListService;
        public ToDoListController(IToDoListService toDoListService)
        {
            _ToDoListService = toDoListService;
        }

        [HttpPost("AddToDoList")]
        public async Task<IActionResult> ToDoListAsync([FromBody] AddToDoListDTO addToDoListDTO)
        {
            SpResponseDTO AddToDoList = await _ToDoListService.ToDoListAsync(addToDoListDTO);
            return Ok(AddToDoList);
        }

        [HttpGet("GetToDoList")]
        public async Task<IActionResult> GetToDoListAsync([FromQuery] ToDoListSearchDTO toDoListSearchDTO)
        {
            IEnumerable<GetToDoListDTO> ToDoListGet = await _ToDoListService.GetToDoListAsync(toDoListSearchDTO);
            return Ok(ToDoListGet);
        }

        [HttpDelete("DeletedToDoList")]
        public async Task<IActionResult> DeleteToDoListAsync([FromQuery] DeleteToDoListDTO deleteToDoListDTO)
        {
            SpResponseDTO ToDoListDeleted = await _ToDoListService.DeleteToDoListAsync(deleteToDoListDTO);
            return Ok(ToDoListDeleted);
        }

    }
}



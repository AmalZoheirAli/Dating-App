using System.Threading.Tasks;
using DatingApp.API.Data;
using DatingApp.API.Dtos;
using DatingApp.API.Models;
using Microsoft.AspNetCore.Mvc;

namespace DatingApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController:ControllerBase
    {
        private readonly IAuthRepository _repo;
        public AuthController(IAuthRepository repo)
        {
            _repo=repo;
        }
        [HttpPost("Register")]
        public async Task<IActionResult> Register(UserForRegisterForDto userForRegisterForDto)
        {
            userForRegisterForDto.UserName=userForRegisterForDto.UserName.ToLower();
            if(await _repo.UserExistsAsync(userForRegisterForDto.UserName))
                return BadRequest("user name arleady exist");
            var userToCretae=new User(){
                UserName=userForRegisterForDto.UserName
            };
            var CreatedUser=await _repo.RegisterAsync(userToCretae,userForRegisterForDto.Password);
            return StatusCode(201);
        }
    }
}
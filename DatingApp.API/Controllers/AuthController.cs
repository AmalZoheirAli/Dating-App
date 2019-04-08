using System.Threading.Tasks;
using DatingApp.API.Data;
using DatingApp.API.Dtos;
using DatingApp.API.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.IdentityModel.Tokens.Jwt;

namespace DatingApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController:ControllerBase
    {
        private readonly IAuthRepository _repo;

         private readonly IConfiguration _config ;

        public AuthController(IAuthRepository repo,IConfiguration config)
        {
            _repo=repo;
            _config = config;
        }
        [HttpPost("register")]
        public async Task<IActionResult> Register(UserForRegisterForDto userForRegisterForDto)
        {
            if(!ModelState.IsValid)
                return BadRequest(ModelState);

            userForRegisterForDto.UserName=userForRegisterForDto.UserName.ToLower();
            if(await _repo.UserExistsAsync(userForRegisterForDto.UserName))
                return BadRequest("user name arleady exist");
            
            var userToCretae=new User(){
                UserName=userForRegisterForDto.UserName
            };
            
            var CreatedUser=await _repo.RegisterAsync(userToCretae,userForRegisterForDto.Password);
            return StatusCode(201);
        } 
        [HttpPost("login")]
        public async Task<IActionResult> Login(UserForRegisterForDto userForRegisterForDto){
            var userFromRepo=await _repo.Loggin(userForRegisterForDto.UserName.ToLower(),userForRegisterForDto.Password);
            
            if(userForRegisterForDto==null)
                return Unauthorized();
            
            var claims=new[]
            {
                new Claim(ClaimTypes.NameIdentifier,userFromRepo.Id.ToString()),
                new Claim(ClaimTypes.Name,userFromRepo.UserName)
            };

            var key=new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetSection("AppSettings:Token").Value));

            var creds=new SigningCredentials(key,SecurityAlgorithms.HmacSha512Signature);

            var tokenDescription=new SecurityTokenDescriptor(){
                Subject=new ClaimsIdentity(claims),
                Expires=DateTime.Now.AddDays(1),
                SigningCredentials=creds
            };

            var tokenHandeler=new JwtSecurityTokenHandler();

            var token=tokenHandeler.CreateToken(tokenDescription);

            return Ok(new {
                token=tokenHandeler.WriteToken(token)
            });
        }
    }
}
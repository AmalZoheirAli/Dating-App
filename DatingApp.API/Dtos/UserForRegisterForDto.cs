using System.ComponentModel.DataAnnotations;

namespace DatingApp.API.Dtos
{
    public class UserForRegisterForDto
    {
        [Required]
       public string UserName { get; set; }
       [Required]
       [StringLength(8,MinimumLength=4,ErrorMessage="you must specify passwoed between 4 and 8")]
        public string Password { get; set; }
    }
}
using System.Collections.Generic;
using System.Threading.Tasks;
using DatingApp.API.Models;
using Microsoft.EntityFrameworkCore;

namespace DatingApp.API.Data
{
    public class DatingRepository:IDatingRepository
    {
        private readonly DataContext _context;
        public DatingRepository(DataContext context)
        {
            this._context = context;

        }
        public void Add<T>(T entity) where T : class
        {
            _context.Add(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            _context.Remove(entity);
        }

        // -- Note the use of .Include() this makes sure that we map the relationship required.
    

        public async Task<IEnumerable<User>> GetUsers()
        {
            var users = await  _context.Users.Include( p => p.photos).ToListAsync();
            return users;
        }
        public async Task<User> GetUser(int id){
             var user =  await _context.Users.Include( p => p.photos).FirstOrDefaultAsync( u => u.Id == id );
             return user;
        }
        public async Task<bool> SaveAll()
        {
            return await _context.SaveChangesAsync() > 0;
        }
}
}
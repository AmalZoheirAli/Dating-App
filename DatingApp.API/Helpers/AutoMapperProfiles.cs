using System;
using System.Linq;
using AutoMapper;
using DatingApp.API.Dtos;
using DatingApp.API.Models;

namespace DatingApp.API.Helpers
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<User,UserForListDto>().
            ForMember(dest=>dest.PhotoURL,opt=>{
                opt.MapFrom(src=>src.photos.FirstOrDefault(p=>p.IsMain).Url);
            }).
            ForMember(dest=>dest.Age,opt=>{
                opt.ResolveUsing(src=>src.DateOfBirth.CalaculateAge());
                });
            CreateMap<User,UserForDetailedDto>().
            ForMember(dest=>dest.PhotoURL,opt=>{
                opt.MapFrom(src=>src.photos.FirstOrDefault(p=>p.IsMain).Url);
            }).
            ForMember(dest=>dest.Age,opt=>{
                opt.ResolveUsing(src=>src.DateOfBirth.CalaculateAge());
                });
            CreateMap<Photo,PhotoForDetailedDto>();
        }
    }
}
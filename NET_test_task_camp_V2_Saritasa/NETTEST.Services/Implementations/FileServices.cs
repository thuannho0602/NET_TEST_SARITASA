using NETTEST.DataAccess;
using NETTEST.Entity.Files;
using NETTEST.Model.Files;
using NETTEST.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace NETTEST.Services.Implementations
{
    public class FileServices : IFileServices
    {
        private IFileRepository _fileRepository;
        private ApplicationDbContext _appContext;
        public FileServices(IFileRepository fileRepository,ApplicationDbContext appContext)
        {
            _fileRepository = fileRepository;
            _appContext = appContext;
        }

        //Create New Item In File

        public async Task<FileCreateResponse> CreateFile(FileCreateRequest fileCreateRequest)
        {
            if(fileCreateRequest.ID== 0)
            {
                var file = new Files
                {
                    Name = fileCreateRequest.Name,
                    LinkFile = fileCreateRequest.LinkFile,
                    CreateBy = fileCreateRequest.CreateBy,
                    CreateDate = fileCreateRequest.CreateDate,
                    UpdatedBy = fileCreateRequest.UpdatedBy,
                    UpdateDate = fileCreateRequest.UpdateDate,
                };
                _fileRepository.Add(file);
                _fileRepository.SaveChanges();

                var fileResponse=new FileCreateResponse{
                    ID=file.ID,
                    Name=file.Name,
                    LinkFile = file.LinkFile,
                    CreateBy = file.CreateBy,
                    CreateDate = file.CreateDate,
                    UpdatedBy = file.UpdatedBy,
                    UpdateDate = file.UpdateDate,
                }; 
                return await Task.FromResult(fileResponse);
            }
            else
            {
                return new FileCreateResponse();
            }
        }

        // Used to delete File ID
        public Task<bool> Delete(int id)
        {
            var file = _fileRepository.FindByCondition(c => c.ID == id).FirstOrDefault();
            if (file != null)
            {
                _fileRepository.Remove(file);
                _fileRepository.SaveChanges();
            }
            return Task.FromResult(false);
        }

       // Get All Item In File

        public async Task<List<FileGetResponse>> GetAll()
        {
            var listfile = _fileRepository.FindAll().Select(c => new FileGetResponse
            {
                ID = c.ID,
                Name = c.Name,
                LinkFile = c.LinkFile,
                CreateBy = c.CreateBy,
                CreateDate = c.CreateDate,
                UpdatedBy = c.UpdatedBy,
                UpdateDate = c.UpdateDate,
            }).ToList();
            return await Task.FromResult(listfile);
        }


        //Get the Id in the File's Item
        public async Task<FileGetResponse> GetById(int id)
        {
            var menu = _fileRepository.FindByCondition(c=>c.ID==id).Select(c => new FileGetResponse
            {
                ID = c.ID,
                Name=c.Name,
                LinkFile = c.LinkFile,
                CreateBy = c.CreateBy,
                CreateDate = c.CreateDate,
                UpdatedBy = c.UpdatedBy,
                UpdateDate = c.UpdateDate,
            }).FirstOrDefault();
            return await Task.FromResult(menu);
        }

        //Update Id By File
        public async Task<FileUpdateResponse> UpdateFile(int Id,FileUpdateRequest fileUpdateRequest)
        {
            if (Id > 0)
            {
                var file = _fileRepository.FindByCondition(c => c.ID == Id).FirstOrDefault();
                if (file != null)
                {
                    var fiLes = new Files
                    {
                        ID = Id,
                        Name= fileUpdateRequest.Name,
                        LinkFile = fileUpdateRequest.LinkFile,
                        CreateBy = fileUpdateRequest.CreateBy,
                        CreateDate= fileUpdateRequest.CreateDate,
                        UpdatedBy= fileUpdateRequest.UpdatedBy,
                        UpdateDate= fileUpdateRequest.UpdateDate,
                    };
                    _fileRepository.Update(fiLes);
                    _fileRepository.SaveChanges();

                    var fileResponse = new FileUpdateResponse
                    {
                        ID = Id,
                        Name = fiLes.Name,
                        LinkFile = fiLes.LinkFile,
                        CreateBy = fiLes.CreateBy,
                        CreateDate = fiLes.CreateDate,
                        UpdatedBy = fiLes.UpdatedBy,
                        UpdateDate = fiLes.UpdateDate,
                    };
                    return await Task.FromResult(fileResponse);
                }
                return new FileUpdateResponse();
            }
            else
            {
                return new FileUpdateResponse();
            }
        }
    }
}

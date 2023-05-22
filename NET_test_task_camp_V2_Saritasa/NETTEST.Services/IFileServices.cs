using NETTEST.Model.Files;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NETTEST.Services
{
    public interface IFileServices
    {
        
        Task<List<FileGetResponse>> GetAll();
        Task<FileGetResponse> GetById(int id);
        Task<FileCreateResponse> CreateFile(FileCreateRequest fileCreateRequest);
        Task<FileUpdateResponse> UpdateFile(int Id,FileUpdateRequest fileUpdateRequest);
        Task <bool>Delete(int id);
    }
}

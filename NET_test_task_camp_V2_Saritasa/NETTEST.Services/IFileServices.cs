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
        Task<List<FileGetResponse>> GetById(int id);
        Task<List<FileCreateResponse>> CreateFile(FileCreateRequest fileCreateRequest);
        Task<List<FileUpdateResponse>> UpdateFile(FileUpdateRequest fileUpdateRequest);
        Task <bool>Delete(int id);
    }
}

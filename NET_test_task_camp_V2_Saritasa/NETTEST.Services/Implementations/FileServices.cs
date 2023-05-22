using NETTEST.Model.Files;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NETTEST.Services.Implementations
{
    public class FileServices : IFileServices
    {
        private IFileRepository iFileRepository;
        public Task<FileCreateResponse> CreateFile(FileCreateRequest fileCreateRequest)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<FileGetResponse>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task<FileGetResponse> GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<FileUpdateResponse> UpdateFile(FileUpdateRequest fileUpdateRequest)
        {
            throw new NotImplementedException();
        }
    }
}

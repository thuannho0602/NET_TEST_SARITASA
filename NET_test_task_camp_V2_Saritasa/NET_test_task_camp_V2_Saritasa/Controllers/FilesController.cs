using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NETTEST.Model.Files;
using NETTEST.Services;

namespace NET_test_task_camp_V2_Saritasa.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FilesController : BaseController
    {
        private readonly IFileServices _fileServices;

        public FilesController(IFileServices fileServices)
        {
            _fileServices = fileServices;
        }

        // method HTTP GetALL Files
        [HttpGet]
        public async Task<IEnumerable<FileGetResponse>> GetAll()
        {
            return await _fileServices.GetAll();
        }

        //method HTTP GetById{Id} Files
        [HttpGet("{Id}")]
        public async Task<FileGetResponse> GetById(int Id)
        {
            return await _fileServices.GetById(Id);
        }

        //method HTTP Potst Create File
        [HttpPost]
        public async Task<FileCreateResponse> CreateFile(FileCreateRequest fileCreateRequest)
        {
            return await _fileServices.CreateFile(fileCreateRequest);
        }

        //method HTTP Put {ID}  UPdate file {Id}
        [HttpPut("{Id}")]
        public async Task<FileUpdateResponse> UpdateFile(int Id, FileUpdateRequest fileUpdateRequest)
        {
            return await _fileServices.UpdateFile(Id, fileUpdateRequest);
        }

        //method HTTP Delete {ID}  Delete file
        [HttpDelete("{Id}")]
        public async Task<bool> DeleteFile(int Id)
        {
            return await _fileServices.Delete(Id);
        }
    }
}

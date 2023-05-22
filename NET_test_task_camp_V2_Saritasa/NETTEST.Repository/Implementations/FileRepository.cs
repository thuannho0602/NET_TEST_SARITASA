using NETTEST.DataAccess;
using NETTEST.Entity.Files;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NETTEST.Repository.Implementations
{
    public class FileRepository : RepositoryBase<Files, ApplicationDbContext>, IFileRepository
    {
        public FileRepository(ApplicationDbContext context) : base(context)
        {

        }
    }
}

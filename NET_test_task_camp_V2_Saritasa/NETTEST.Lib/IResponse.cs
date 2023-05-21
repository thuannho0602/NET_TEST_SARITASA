using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace NETTEST.Lib
{
    public interface IResponse
    {
        [JsonIgnore]
        int StatusCode { get; set; }
    }
}

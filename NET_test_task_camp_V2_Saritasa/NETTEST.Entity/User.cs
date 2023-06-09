﻿using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace NETTEST.Entity
{
    // Create Table User
    [Table("User")]
    public class User:IdentityUser<Guid>
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
       
        
        public string DateOfBirth { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }

        [NotMapped]
        public string FullName
        {
            get
            {
                return $"{FirstName} {LastName}".Trim();
            }
        }
    }
}

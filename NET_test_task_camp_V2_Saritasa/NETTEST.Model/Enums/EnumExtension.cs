using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace NETTEST.Model.Enums
{
    public static class EnumExtension
    {
        public static string ToDescription(this Enum en)
        {
            Type type=en.GetType();
            MemberInfo[] menInfo= type.GetMember(en.ToString());
            if(menInfo !=null &&menInfo.Length > 0)
            {
                object[] attrs = menInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (attrs != null && attrs.Length > 0)
                {
                    return ((DescriptionAttribute)attrs[0]).Description;
                }
            }
            return en.ToString();
        }
    }
}

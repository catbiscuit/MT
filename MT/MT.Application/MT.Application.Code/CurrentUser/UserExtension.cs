using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Application.Code.CurrentUser
{
    /// <summary>
    /// 当前登录用户扩展类
    /// </summary>
    public class UserExtension
    {
        /// <summary>
        /// GUID主键
        /// </summary>
        public System.Guid F_ID { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string F_UserName { get; set; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string F_LoginName { get; set; }
    }
}

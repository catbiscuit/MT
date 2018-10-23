using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Application.Code.CurrentUser
{
    /// <summary>
    /// 当前登录用户回话接口
    /// </summary>
    public interface IUserProvider
    {
        /// <summary>
        /// 写入登录信息
        /// </summary>
        /// <param name="user"></param>
        void AddCurrent(UserExtension user);
        /// <summary>
        /// 获取当前登录信息
        /// </summary>
        /// <returns></returns>
        UserExtension Current();
        /// <summary>
        /// 删除当前登录用户信息
        /// </summary>
        void RemoveCurrent();
        /// <summary>
        /// 检测登录是否过期
        /// </summary>
        /// <returns></returns>
        bool IsOverdue();
    }
}

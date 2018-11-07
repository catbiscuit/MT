using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MT.Utility.Common;

namespace MT.Application.Code.CurrentUser
{
    /// <summary>
    /// 当前登录用户回话
    /// </summary>
    public class UserProvider : IUserProvider
    {
        /// <summary>
        /// 秘钥
        /// </summary>
        private string LoginUserKey = Config.GetValue("LoginUserKey");
        /// <summary>
        /// 登录提供者模式：Session Cookie
        /// </summary>
        private string LoginProvider = Config.GetValue("LoginProvider");

        /// <summary>
        /// 当前提供者
        /// </summary>
        public static IUserProvider Provider
        {
            get { return new UserProvider(); }
        }

        /// <summary>
        /// 写入登录信息
        /// </summary>
        /// <param name="user"></param>
        public virtual void AddCurrent(UserExtension user)
        {
            try
            {
                if (LoginProvider == "Cookie")
                {
                    WebHelper.WriteCookie(LoginUserKey, DESEncrypt.Encrypt(user.ToJson()), 720);
                }
                else
                {
                    WebHelper.WriteSession(LoginUserKey, DESEncrypt.Encrypt(user.ToJson()));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// 获取当前登录信息
        /// </summary>
        /// <returns></returns>
        public virtual UserExtension Current()
        {
            try
            {
                UserExtension user = new UserExtension();
                if (LoginProvider == "Cookie")
                {
                    user = DESEncrypt.Decrypt(WebHelper.GetCookie(LoginUserKey).ToString()).ToObject<UserExtension>();
                }
                else
                {
                    user = DESEncrypt.Decrypt(WebHelper.GetSession(LoginUserKey).ToString()).ToObject<UserExtension>();
                }
                return user;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /// <summary>
        /// 删除当前登录用户信息
        /// </summary>
        public virtual void RemoveCurrent()
        {
            try
            {
                if (LoginProvider == "Cookie")
                {
                    WebHelper.RemoveCookie(LoginUserKey.Trim());
                }
                else
                {
                    WebHelper.RemoveSession(LoginUserKey.Trim());
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 检测是否登录
        /// </summary>
        /// <returns></returns>
        public bool IsOverdue()
        {
            try
            {
                string sUserStr = string.Empty;//保存Cookie或Session信息的字符串
                if (LoginProvider == "Cookie")
                {
                    sUserStr = WebHelper.GetCookie(LoginUserKey).ToString();
                }
                else
                {
                    sUserStr = WebHelper.GetSession(LoginUserKey).ToString();
                }
                return sUserStr.IsEmpty();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}

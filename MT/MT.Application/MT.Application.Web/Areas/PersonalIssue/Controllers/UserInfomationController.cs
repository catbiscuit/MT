using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MT.Application.Web.Areas.PersonalIssue.Controllers
{
    /// <summary>
    /// 用户信息
    /// </summary>
    public class UserInfomationController : Controller
    {
        #region 视图
        /// <summary>
        /// 个人主页
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 用户信息
        /// </summary>
        /// <returns></returns>
        public ActionResult UserInfo()
        {
            return View();
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <returns></returns>
        public ActionResult ChangePwd()
        {
            return View();
        }
        #endregion
    }
}
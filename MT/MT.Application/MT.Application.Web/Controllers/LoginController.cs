using MT.Business.IBLL.SystemManage;
using MT.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.Enums;
using MT.Utility.Common.Attributes;

namespace MT.Application.Web.Controllers
{
    /// <summary>
    /// 系统登录控制器
    /// </summary>
    public class LoginController : Controller
    {
        private readonly IT_LogBLL _iT_LogBLL;
        private readonly IT_UserBLL _iT_UserBLL;

        public LoginController(IT_LogBLL iT_LogBLL
            , IT_UserBLL iT_UserBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
            this._iT_UserBLL = iT_UserBLL;
        }

        /// <summary>
        /// 显示登录页面
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 登录逻辑
        /// </summary>
        /// <param name="loginname"></param>
        /// <param name="loginpassword"></param>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult CheckLogin(string loginname, string loginpassword)
        {
            T_Log logModel = new T_Log();
            logModel.F_ID = Guid.NewGuid();
            logModel.F_ControllerName = "Login";
            logModel.F_ActionName = "CheckLogin";
            logModel.F_LogType = ((int)(LogType.Login)).ToString();
            logModel.F_LogTypeName = EnumAttribute.GetDescription(LogType.Login);
            try
            {
                T_User user = _iT_UserBLL.CheckLogin(loginname, loginpassword);
                if (user != null)
                {
                    logModel.F_Title = "登录日志";
                    logModel.F_Content = "登录成功";
                    logModel.F_WriteTime = DateTime.Now;
                    logModel.F_isValid = 1;
                    logModel.F_UserName = user.F_UserName;
                    logModel.F_LoginName = user.F_LoginName;
                    _iT_LogBLL.Insert(logModel);
                }
                return Content("{\"success\":\"1\",\"message\":\"登录成功\"}");
            }
            catch (Exception ex)
            {
                return Content("{\"success\":\"0\",\"message\":\"" + ex.Message.ToString() + "\"}");
            }
        }
    }
}
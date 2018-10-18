using MT.Business.IBLL.SystemManage;
using MT.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MT.Application.Web.Controllers
{
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

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CheckLogin(string loginname, string loginpassword)
        {
            try
            {
                T_User user = _iT_UserBLL.CheckLogin(loginname, loginpassword);
                return Content("{\"success\":\"1\",\"message\":\"登录成功\"}");
            }
            catch (Exception ex)
            {
                return Content("{\"success\":\"0\",\"message\":\"" + ex.Message.ToString() + "\"}");
            }
        }
    }
}
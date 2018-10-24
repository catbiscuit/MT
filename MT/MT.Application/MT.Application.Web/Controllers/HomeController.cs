using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.Enums;
using MT.Business.IBLL.SystemManage;
using MT.Business.Model;

namespace MT.Application.Web.Controllers
{
    /// <summary>
    /// 首页
    /// </summary>
    [HandlerLogin(LoginMode.Enforce)]
    public class HomeController : MvcControllerBase
    {
        private readonly IT_LogBLL _iT_LogBLL;
        private readonly IT_UserBLL _iT_UserBLL;
        private readonly IT_UserRoleBLL _iT_UserRoleBLL;
        private readonly IT_RoleBLL _iT_RoleBLL;

        public HomeController(IT_LogBLL iT_LogBLL
            , IT_UserBLL iT_UserBLL
            , IT_UserRoleBLL iT_UserRoleBLL
            , IT_RoleBLL iT_RoleBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
            this._iT_UserBLL = iT_UserBLL;
            this._iT_UserRoleBLL = iT_UserRoleBLL;
            this._iT_RoleBLL = iT_RoleBLL;
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
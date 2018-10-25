using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.Enums;
namespace MT.Application.Web.Areas.SystemManage.Controllers
{
    public class LogController : Controller
    {
        #region 视图
        /// <summary>
        /// 日志管理
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [HandlerAuthorize(PermissionMode.Enforce)]
        public ActionResult Index()
        {
            return View();
        }
        #endregion
    }
}
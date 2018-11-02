using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MT.Application.Web.Areas.PersonalIssue.Controllers
{
    /// <summary>
    /// 通知消息
    /// </summary>
    public class NotificationMessageController : Controller
    {
        #region 视图
        public ActionResult Index()
        {
            return View();
        } 
        #endregion
    }
}
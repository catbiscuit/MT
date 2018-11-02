using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MT.Application.Web.Areas.PersonnelManage.Controllers
{
    /// <summary>
    /// 人事档案
    /// </summary>
    public class PersonnelArchivesController : Controller
    {
        #region 视图
        public ActionResult Index()
        {
            return View();
        }
        #endregion
    }
}
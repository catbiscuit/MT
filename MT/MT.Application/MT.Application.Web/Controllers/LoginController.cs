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

        public LoginController(IT_LogBLL iT_LogBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
        }

        public ActionResult Index()
        {
            T_Log model2 = new T_Log();
            model2 = _iT_LogBLL.GetModelByCondition(x => x.F_isValid > 0);
            model2.F_isValid++;

            return View();
        }
    }
}
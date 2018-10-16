using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Business.IBLL.SystemManage;
using MT.Business.Model;

namespace MT.Application.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IT_LogBLL _iT_LogBLL;

        public HomeController(IT_LogBLL iT_LogBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
        }

        public ActionResult Index()
        {
            List<T_Log> lst = new List<T_Log>();
            T_Log model = new T_Log();
            model.F_ID = Guid.NewGuid();
            model.F_WriteTime = DateTime.Now;
            lst.Add(model);

            T_Log model1 = new T_Log();
            model1.F_ID = Guid.Parse("1485CCEF-63E7-4074-96F8-3B2049E925DE");
            model1.F_WriteTime = DateTime.Now;
            lst.Add(model1);

            //int i = _iT_LogBLL.Insert(lst);

            T_Log model2 = new T_Log();
            model2 = _iT_LogBLL.GetModelByCondition(x => x.F_isValid > 0);
            model2.F_isValid++;
            _iT_LogBLL.Update();

            return View();
        }
    }
}
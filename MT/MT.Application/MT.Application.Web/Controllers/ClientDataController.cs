using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MT.Application.Web.Controllers
{
    /// <summary>
    /// 客户端数据(字典)
    /// </summary>
    /// <returns></returns>
    public class ClientDataController : Controller
    {
        /// <summary>
        /// 获取日志类别字典
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetLogType()
        {
            return View();
        }
    }
}
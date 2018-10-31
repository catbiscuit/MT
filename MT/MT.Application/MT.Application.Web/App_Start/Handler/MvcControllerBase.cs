﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.CurrentUser;
using MT.Application.Code.Enums;
using MT.Utility.WebControl;
using MT.Utility.Common.Extension;
using System.Data;

namespace MT.Application.Web
{
    /// <summary>
    /// 控制器基类
    /// </summary>
    [HandlerLogin(LoginMode.Enforce)]
    public class MvcControllerBase : Controller
    {
        #region Index页面获取数据的参数
        /// <summary>
        /// 总记录数(MvcControllerBase统一变量)
        /// </summary>
        public int iTotalNumberUnify = 0;
        /// <summary>
        /// 查询的数据(MvcControllerBase统一变量)
        /// </summary>
        public DataTable dtResultUnify = null;
        #endregion
        /// <summary>
        /// 返回成功消息
        /// </summary>
        /// <param name="message">消息</param>
        /// <returns></returns>
        protected virtual ActionResult Success(string message)
        {
            return Content(new AjaxResult { type = ResultType.success, message = message }.ToJson());
        }
        /// <summary>
        /// 返回成功消息
        /// </summary>
        /// <param name="message">消息</param>
        /// <param name="data">数据</param>
        /// <returns></returns>
        protected virtual ActionResult Success(string message, object data)
        {
            return Content(new AjaxResult { type = ResultType.success, message = message, resultdata = data }.ToJson());
        }
        /// <summary>
        /// 返回失败消息
        /// </summary>
        /// <param name="message">消息</param>
        /// <returns></returns>
        protected virtual ActionResult Error(string message)
        {
            return Content(new AjaxResult { type = ResultType.error, message = message }.ToJson());
        }
    }
}
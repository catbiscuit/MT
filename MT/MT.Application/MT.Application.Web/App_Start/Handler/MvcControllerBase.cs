using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.CurrentUser;
using MT.Application.Code.Enums;
using MT.Utility.WebControl;
using MT.Utility.Common;
using System.Data;

namespace MT.Application.Web
{
    /// <summary>
    /// 控制器基类
    /// </summary>
    [HandlerLogin(LoginMode.Enforce)]
    public class MvcControllerBase : Controller
    {
        #region Index页面获取数据的参数和方法
        /// <summary>
        /// 总记录数(MvcControllerBase统一变量)
        /// </summary>
        public int iTotalNumberUnify = 0;
        /// <summary>
        /// 查询的数据(MvcControllerBase统一变量)
        /// </summary>
        public DataTable dtResultUnify = null;
        #endregion

        #region 公共属性
        /// <summary>
        /// 当前登录用户信息
        /// </summary>
        public UserExtension userExtension = UserProvider.Provider.Current();
        #endregion

        /// <summary>
        /// 返回成功消息
        /// </summary>
        /// <param name="message">消息</param>
        /// <returns></returns>
        protected virtual ActionResult Success(string message)
        {
            return Content(new AjaxResult { code = (int)ResultType.success, codeType = ResultType.success.ToString(), msg = message }.ToJson());
        }
        /// <summary>
        /// 返回成功消息
        /// </summary>
        /// <param name="message">消息</param>
        /// <param name="data">数据</param>
        /// <returns></returns>
        protected virtual ActionResult Success(string message, object data)
        {
            return Content(new AjaxResult { code = (int)ResultType.success, codeType = ResultType.success.ToString(), msg = message, data = data }.ToJson());
        }
        /// <summary>
        /// 返回失败消息
        /// </summary>
        /// <param name="message">消息</param>
        /// <returns></returns>
        protected virtual ActionResult Error(string message)
        {
            return Content(new AjaxResult { code = (int)ResultType.error, codeType = ResultType.error.ToString(), msg = message }.ToJson());
        }
        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="iTotalNumberUnify">总记录数</param>
        /// <param name="dtResultUnify">数据表格</param>
        /// <returns></returns>
        protected virtual ActionResult ReturnData(int iTotalNumberUnify, DataTable dtResultUnify)
        {
            return Content(new AjaxResult { code = (int)ResultType.data, codeType = ResultType.data.ToString(), count = iTotalNumberUnify, data = dtResultUnify }.ToJson());
        }
        /// <summary>
        /// 返回退出消息
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        protected virtual ActionResult LogOut(string message)
        {
            return Content(new { code = "1001" }.ToJson());
        }
    }
}
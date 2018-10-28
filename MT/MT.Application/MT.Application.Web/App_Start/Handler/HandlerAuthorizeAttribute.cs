using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.CurrentUser;
using MT.Application.Code.Enums;

namespace MT.Application.Web
{
    /// <summary>
    /// (权限认证+安全)拦截组件
    /// </summary>
    public class HandlerAuthorizeAttribute : ActionFilterAttribute
    {
        private PermissionMode _customMode;        
        /// <summary>
        /// 默认构造
        /// </summary>
        /// <param name="Mode"></param>
        public HandlerAuthorizeAttribute(PermissionMode Mode)
        {
            this._customMode = Mode;            
        }

        /// <summary>
        /// 权限认证
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //是否忽略
            if (_customMode == PermissionMode.Ignore)
            {
                return;
            }
        }
    }
}
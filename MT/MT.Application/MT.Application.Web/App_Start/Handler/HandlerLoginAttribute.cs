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
    /// 登录认证
    /// </summary>
    public class HandlerLoginAttribute : AuthorizeAttribute
    {
        private LoginMode _customMode;
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="Model">认证模式</param>
        public HandlerLoginAttribute(LoginMode Mode)
        {
            _customMode = Mode;
        }

        /// <summary>
        /// 响应前执行登录验证，查看当前用户是否有效
        /// </summary>
        /// <param name="filterContext">身份信息上下文</param>
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            //登录拦截是否忽略
            if (_customMode == LoginMode.Ignore)
            {
                return;
            }
            if (UserProvider.Provider.IsOverdue())
            {
                filterContext.Result = new RedirectResult("~/Login/Index");
                return;
            }
        }
    }
}
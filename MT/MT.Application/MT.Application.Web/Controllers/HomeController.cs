using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.CurrentUser;
using MT.Application.Code.Enums;
using MT.Business.IBLL.SystemManage;
using MT.Business.Model;
using MT.Utility.Common.SqlHelper;
using MT.Utility.Common.Extension;

namespace MT.Application.Web.Controllers
{
    /// <summary>
    /// 首页
    /// </summary>
    [HandlerLogin(LoginMode.Enforce)]
    public class HomeController : MvcControllerBase
    {
        private readonly IT_LogBLL _iT_LogBLL;
        private readonly IT_UserBLL _iT_UserBLL;
        private readonly IT_UserRoleBLL _iT_UserRoleBLL;
        private readonly IT_RoleBLL _iT_RoleBLL;

        public HomeController(IT_LogBLL iT_LogBLL
            , IT_UserBLL iT_UserBLL
            , IT_UserRoleBLL iT_UserRoleBLL
            , IT_RoleBLL iT_RoleBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
            this._iT_UserBLL = iT_UserBLL;
            this._iT_UserRoleBLL = iT_UserRoleBLL;
            this._iT_RoleBLL = iT_RoleBLL;
        }

        #region 视图
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region 获取数据
        /// <summary>
        /// 获取权限信息
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetPermissions()
        {
            UserExtension user = UserProvider.Provider.Current();
            StringBuilder sbSql = new StringBuilder();
            sbSql.Append(" select c.* ");
            sbSql.Append(" from T_UserRole a ");
            sbSql.Append(" join T_RoleMenu b on a.F_RoleID=b.F_RoleID ");
            sbSql.Append(" left join T_Menu c on b.F_MenuID=c.F_ID ");
            sbSql.Append(" where a.F_UserID=@UserID ");
            sbSql.Append(" order by c.F_Level,c.F_ParentID,c.F_Sort  ");
            SqlParameter[] parameters =
            {
                new SqlParameter("@UserID", SqlDbType.UniqueIdentifier),
            };
            parameters[0].Value = user == null ? default(Guid) : user.F_ID;
            DataSet dsResult = DbHelperSQL.Query(sbSql.ToString(), parameters);
            if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
            {
                return Content(dsResult.Tables[0].ToJson());
            }
            else
            {
                return Content(new DataTable().ToJson());
            }
        }
        #endregion
    }
}
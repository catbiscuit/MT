using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Utility.Common.SqlHelper;
using MT.Utility.Common.Extension;
using System.Text;

namespace MT.Application.Web.Areas.SystemManage.Controllers
{
    /// <summary>
    /// 基础数据管理
    /// </summary>
    public class BaseDataManageController : MvcControllerBase
    {
        #region 视图
        public ActionResult Index()
        {
            ViewBag.Title = "基础数据管理";
            return View();
        }
        #endregion

        #region 获取数据
        /// <summary>
        /// 获取字典数据
        /// </summary>
        /// <returns></returns>
        public ActionResult GetDataItemList(int page, int limit, string ordersort)
        {
            string sqlWhere = string.Empty;
            string orderSort = "F_Sort asc";
            int StartIndex = (page - 1) * limit + 1;
            int EndIndex = StartIndex + limit - 1;

            if (!string.IsNullOrEmpty(ordersort))
            {
                orderSort = ordersort;
            }
            sqlWhere = GetWhere();

            SqlParameter[] sqlParameters =
            {                
                new SqlParameter("@sqlWhere",sqlWhere), 
                new SqlParameter("@orderSort",orderSort), 
                new SqlParameter("@StartIndex",StartIndex), 
                new SqlParameter("@EndIndex",EndIndex)
            };

            DataSet dsResult = DbHelperSQL.RunProcedure("Proc_GetDataItemList", sqlParameters, "dt");
            if (dsResult != null && dsResult.Tables != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
            {
                dtResultUnify = dsResult.Tables[0];
                iTotalNumberUnify = int.Parse(dtResultUnify.Rows[0]["TotalNumber"].ToString());
            }
            else
            {
                dtResultUnify = new DataTable();
                iTotalNumberUnify = 0;
            }

            var JsonData = new
            {
                code = 0,
                msg = "",
                count = iTotalNumberUnify,
                data = dtResultUnify
            };

            return Content(JsonData.ToJson());
        }

        /// <summary>
        /// 获取查询条件
        /// </summary>
        /// <returns></returns>
        protected string GetWhere()
        {
            try
            {
                StringBuilder sbWhere = new StringBuilder();
                if (Request.QueryString["F_ItemCode"] != null && !string.IsNullOrEmpty(Request.QueryString["F_ItemCode"].ToString()))
                {
                    sbWhere.AppendFormat(" and (F_ItemCode like '%{0}%' or F_ItemName like '%{0}%' or F_HelpCode like '%{0}%') ", Request.QueryString["F_ItemCode"].ToString());
                }
                if (Request.QueryString["F_AddUserName"] != null && !string.IsNullOrEmpty(Request.QueryString["F_AddUserName"].ToString()))
                {
                    sbWhere.AppendFormat(" and F_AddUserName like '%{0}%' ) ", Request.QueryString["F_AddUserName"].ToString());
                }

                return sbWhere.ToString();
            }
            catch
            {
                return "";
            }
        }
        #endregion
    }
}
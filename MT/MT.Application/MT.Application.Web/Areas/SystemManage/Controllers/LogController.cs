﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.Enums;
using MT.Business.IBLL.SystemManage;
using MT.Utility.Common;
namespace MT.Application.Web.Areas.SystemManage.Controllers
{
    public class LogController : MvcControllerBase
    {
        #region 引用
        private readonly IT_LogBLL _iT_LogBLL;

        public LogController(IT_LogBLL iT_LogBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
        }
        #endregion

        #region 视图
        /// <summary>
        /// 日志管理
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [HandlerAuthorize(PermissionMode.Enforce)]
        public ActionResult Index()
        {
            return View();
        }
        #endregion

        #region 获取数据
        [HttpGet]
        public ActionResult GetPageListJson(int page, int limit)
        {
            string sTableName = "T_Log";
            string sqlWhere = string.Empty;
            string orderSort = "F_WriteTime desc";
            int StartIndex = (page - 1) * limit + 1;
            int EndIndex = StartIndex + limit - 1;

            sqlWhere = GetWhere();

            SqlParameter[] sqlParameters =
            {                
                new SqlParameter("@tableName",sTableName), 
                new SqlParameter("@sqlWhere",sqlWhere), 
                new SqlParameter("@orderSort",orderSort), 
                new SqlParameter("@StartIndex",StartIndex), 
                new SqlParameter("@EndIndex",EndIndex)
            };

            DataSet dsResult = DbHelperSQL.RunProcedure("proc_GetPageDataList", sqlParameters, "dt");
            if (dsResult != null && dsResult.Tables != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
            {
                dtResultUnify = dsResult.Tables[0];
                iTotalNumberUnify = int.Parse(dtResultUnify.Rows[0]["TotalRows"].ToString());
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

                sbWhere.AppendFormat(" and F_isValid='{0}' ", (int)F_isValid.Normal);//正常的数据

                if (Request.Params["F_LoginName"] != null && !string.IsNullOrEmpty(Request.Params["F_LoginName"].ToString()))
                {
                    sbWhere.AppendFormat(" and F_LoginName like '%{0}%' ", Request.Params["F_LoginName"].ToString());
                }
                if (Request.Params["F_LogType"] != null && !string.IsNullOrEmpty(Request.Params["F_LogType"].ToString()))
                {
                    sbWhere.AppendFormat(" and F_LogType like '%{0}%' ", Request.Params["F_LogType"].ToString());
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
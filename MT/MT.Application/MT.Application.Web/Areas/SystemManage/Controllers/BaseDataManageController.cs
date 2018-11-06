﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Utility.Common.SqlHelper;
using MT.Utility.Common.Extension;
using System.Text;
using MT.Business.Model;
using MT.Business.IBLL.SystemManage;
using MT.Application.Code.Enums;

namespace MT.Application.Web.Areas.SystemManage.Controllers
{
    /// <summary>
    /// 基础数据管理
    /// </summary>
    [HandlerLogin(LoginMode.Enforce)]
    public class BaseDataManageController : MvcControllerBase
    {
        private readonly IT_DataItemBLL _iT_DataItemBLL;
        #region 字段、属性
        public BaseDataManageController(IT_DataItemBLL iT_DataItemBLL)
        {
            this._iT_DataItemBLL = iT_DataItemBLL;
        }
        #endregion

        #region 视图
        public ActionResult Index()
        {
            ViewBag.Title = "基础数据管理";
            return View();
        }
        /// <summary>
        /// 表单
        /// </summary>
        /// <returns></returns>
        public ActionResult Form()
        {
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

        #region 提交数据
        /// <summary>
        /// 修改 是否启用 字段
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult UpdateF_isEnable(Guid F_ID, bool? IsChecked)
        {
            try
            {
                if (F_ID == default(Guid))
                {
                    return Error("修改失败,未获取到记录,请刷新页面重试！");
                }
                if (IsChecked == null)
                {
                    return Error("修改失败,未获取到状态,请刷新页面重试！");
                }
                T_DataItem T_DataItemModel = _iT_DataItemBLL.GetModelByCondition(x => x.F_ID == F_ID);
                T_DataItemModel.F_isEnable = IsChecked == true ? 1 : 0;
                if (_iT_DataItemBLL.Update() > 0)
                {
                    return Success(T_DataItemModel.F_isEnable.ToString());
                }
                else
                {
                    return Error("修改失败,请刷新页面重试！");
                }
            }
            catch (Exception ex)
            {
                return Error("修改失败," + ex.Message.ToString());
            }
        }
        #endregion
    }
}
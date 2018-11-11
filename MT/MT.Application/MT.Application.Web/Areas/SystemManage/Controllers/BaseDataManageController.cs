using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Utility.Common;
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

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="F_IDValue"></param>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult GetForm(string F_IDValue)
        {
            MT.Business.Model.T_DataItem model = null;
            Guid F_ID = default(Guid);
            if (string.IsNullOrEmpty(F_IDValue))
            {
                model = new T_DataItem();
                return Error("主键为空,获取记录失败!");
            }
            if (Guid.TryParse(F_IDValue, out F_ID) == false)
            {
                model = new T_DataItem();
                return Error("主键格式错误,获取记录失败!");
            }

            model = _iT_DataItemBLL.GetModelByCondition(x => x.F_ID == F_ID);
            return Success(model.ToJson());
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
                T_DataItemModel.F_UpdateTime = DateTime.Now;
                T_DataItemModel.F_UpdateUserID = userExtension.F_ID;
                T_DataItemModel.F_UpdateUserName = userExtension.F_UserName;
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

        /// <summary>
        /// 保存表单
        /// </summary>
        /// <param name="F_IDValue">主键(区别Insert和Update)</param>
        /// <param name="model">实体</param>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult SaveForm(string F_IDValue, T_DataItem model)
        {
            try
            {
                if (string.IsNullOrEmpty(F_IDValue))//Add
                {
                    model.F_ID = Guid.NewGuid();
                    model.F_AddTime = DateTime.Now;
                    model.F_AddUserID = userExtension.F_ID;
                    model.F_AddUserName = userExtension.F_UserName;
                    model.F_isValid = 1;
                    if (_iT_DataItemBLL.Insert(model) > 0)
                    {
                        return Success("添加成功!");
                    }
                    else
                    {
                        return Error("添加失败!");
                    }
                }
                else//Update
                {
                    Guid F_ID = Guid.Parse(F_IDValue);
                    T_DataItem T_DataItemModel = _iT_DataItemBLL.GetModelByCondition(x => x.F_ID == F_ID);
                    T_DataItemModel.F_ItemName = model.F_ItemName;
                    T_DataItemModel.F_HelpCode = model.F_HelpCode;
                    T_DataItemModel.F_Sort = model.F_Sort;
                    T_DataItemModel.F_isEnable = model.F_isEnable;
                    T_DataItemModel.F_Remark = model.F_Remark;
                    T_DataItemModel.F_UpdateTime = DateTime.Now;
                    T_DataItemModel.F_UpdateUserID = userExtension.F_ID;
                    T_DataItemModel.F_UpdateUserName = userExtension.F_UserName;
                    if (_iT_DataItemBLL.Update() > 0)
                    {
                        return Success("修改成功!");
                    }
                    else
                    {
                        return Error("修改失败!");
                    }
                }
            }
            catch (Exception ex)
            {
                return Error("保存失败," + ex.Message.ToString());
            }
        }

        /// <summary>
        /// 逻辑删除
        /// </summary>
        /// <param name="F_IDValue">主键(区别Insert和Update)</param>        
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult RemoveForm(string F_IDValue)
        {
            MT.Business.Model.T_DataItem model = null;
            Guid F_ID = default(Guid);
            if (string.IsNullOrEmpty(F_IDValue))
            {
                model = new T_DataItem();
                return Error("主键为空,获取记录失败!");
            }
            if (Guid.TryParse(F_IDValue, out F_ID) == false)
            {
                model = new T_DataItem();
                return Error("主键格式错误,获取记录失败!");
            }
            model = _iT_DataItemBLL.GetModelByCondition(x => x.F_ID == F_ID);
            model.F_isValid = 0;
            if (_iT_DataItemBLL.Update() > 0)
            {
                return Success("修改成功!");
            }
            else
            {
                return Error("修改失败!");
            }
        }
        #endregion
    }
}
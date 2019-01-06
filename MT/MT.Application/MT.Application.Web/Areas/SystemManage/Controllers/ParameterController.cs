using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using MT.Application.Code.Enums;
using MT.Business.IBLL.SystemManage;
using MT.Business.Model;
using MT.Utility.Common;
using MT.Utility.Office;
using MT.Utility.WebControl;

namespace MT.Application.Web.Areas.SystemManage.Controllers
{
    /// <summary>
    /// 功能:
    /// 创建日期：2019/1/6    
    /// </summary>  
    [HandlerLogin(LoginMode.Enforce)]
    public class ParameterController : MvcControllerBase
    {
        #region 字段、属性
        private readonly IT_ParameterBLL _iT_ParameterBLL;
        public ParameterController(IT_ParameterBLL iT_ParameterBLL)
        {
            this._iT_ParameterBLL = iT_ParameterBLL;
        }
        #endregion

        #region 视图
        public ActionResult Index()
        {
            var l = App_Code.CodeHelper.GetT_ParameterList();
            return View();
        }
        public ActionResult Form()
        {
            return View();
        }
        #endregion

        #region 获取数据
        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult GetDataList(int page, int limit)
        {
            try
            {
                string sTableName = "T_Parameter";
                string sqlWhere = string.Empty;
                string orderSort = "F_Sort asc";
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

                return ReturnData(iTotalNumberUnify, dtResultUnify);
            }
            catch (Exception ex)
            {
                return Error("获取失败," + ex.Message.ToString());
            }
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

                if (Request.Params["F_ItemCode"] != null && !string.IsNullOrEmpty(Request.Params["F_ItemCode"].ToString()))
                {
                    sbWhere.AppendFormat(" and (F_ItemCode like '%{0}%' or F_ItemName like '%{0}%' or F_HelpCode like '%{0}%') ", Request.Params["F_ItemCode"].ToString());
                }
                if (Request.Params["F_AddUserName"] != null && !string.IsNullOrEmpty(Request.Params["F_AddUserName"].ToString()))
                {
                    sbWhere.AppendFormat(" and F_AddUserName like '%{0}%' ", Request.Params["F_AddUserName"].ToString());
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
            T_Parameter model = null;
            try
            {
                Guid F_ID = default(Guid);
                if (string.IsNullOrEmpty(F_IDValue))
                {
                    model = new T_Parameter();
                    return Error("主键为空,获取记录失败!");
                }
                if (Guid.TryParse(F_IDValue, out F_ID) == false)
                {
                    model = new T_Parameter();
                    return Error("主键格式错误,获取记录失败!");
                }

                model = _iT_ParameterBLL.GetModelByCondition(x => x.F_ID == F_ID);

                if (model != null)
                {
                    return Success(model.ToJson());
                }
                else
                {
                    return Error("获取失败,未能获取到该条数据!");
                }
            }
            catch (Exception ex)
            {
                return Error("获取失败," + ex.Message.ToString());
            }
        }
        #endregion

        #region 提交数据
        /// <summary>
        /// 保存表单
        /// </summary>
        /// <param name="FormType">页面类型(ADD添加 UPDATE更新)</param>
        /// <param name="F_IDValue">所修改记录的主键</param>
        /// <param name="model">实体</param>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult SaveForm(string FormType, string F_IDValue, T_Parameter model)
        {
            try
            {
                switch (FormType.ToUpper())
                {
                    case "ADD":
                        #region 新增
                        model.F_ID = Guid.NewGuid();
                        model.F_AddTime = DateTime.Now;
                        model.F_AddUserID = userExtension.F_ID;
                        model.F_AddUserName = userExtension.F_UserName;
                        model.F_isValid = 1;
                        if (_iT_ParameterBLL.Insert(model) > 0)
                        {
                            return Success("添加成功!");
                        }
                        else
                        {
                            return Error("添加失败!");
                        }
                        #endregion
                        break;
                    case "UPDATE":
                        #region 修改
                        Guid F_ID = Guid.Parse(F_IDValue);
                        T_Parameter T_ParameterModel = _iT_ParameterBLL.GetModelByCondition(x => x.F_ID == F_ID);
                        T_ParameterModel.F_Code = model.F_Code;
                        T_ParameterModel.F_Name = model.F_Name;
                        T_ParameterModel.F_Value = model.F_Value;
                        T_ParameterModel.F_Explain = model.F_Explain;
                        T_ParameterModel.F_Sort = model.F_Sort;
                        T_ParameterModel.F_Remark = model.F_Remark;
                        T_ParameterModel.F_UpdateTime = DateTime.Now;
                        T_ParameterModel.F_UpdateUserID = userExtension.F_ID;
                        T_ParameterModel.F_UpdateUserName = userExtension.F_UserName;
                        if (_iT_ParameterBLL.Update() > 0)
                        {
                            return Success("修改成功!");
                        }
                        else
                        {
                            return Error("修改失败!");
                        }
                        #endregion
                        break;
                    default:
                        return Error("页面类型参数错误!");
                        break;
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
        /// <param name="F_IDValue">主键</param>        
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult RemoveForm(string F_IDValue)
        {
            try
            {
                T_Parameter model = null;
                Guid F_ID = default(Guid);
                if (string.IsNullOrEmpty(F_IDValue))
                {
                    return Error("主键为空,获取记录失败!");
                }
                if (Guid.TryParse(F_IDValue, out F_ID) == false)
                {
                    return Error("主键格式错误,获取记录失败!");
                }

                model = _iT_ParameterBLL.GetModelByCondition(x => x.F_ID == F_ID);
                model.F_isValid = (int)F_isValid.Delete;

                if (_iT_ParameterBLL.Update() > 0)
                {
                    return Success("删除成功!");
                }
                else
                {
                    return Error("删除失败!");
                }
            }
            catch (Exception ex)
            {
                return Error("删除失败," + ex.Message.ToString());
            }
        }
        /// <summary>
        /// 批量逻辑删除
        /// </summary>
        /// <param name="F_IDValue">主键</param>        
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult BatchRemoveForm(string F_IDValue)
        {
            try
            {
                T_Parameter model = null;
                List<string> lstF_ID = F_IDValue.Split(',').ToList();

                foreach (string item in lstF_ID)
                {
                    var F_ID = Guid.Parse(item);
                    model = _iT_ParameterBLL.GetModelByCondition(x => x.F_ID == F_ID);
                    model.F_isValid = (int)F_isValid.Delete;
                }

                if (_iT_ParameterBLL.Update() > 0)
                {
                    return Success("删除成功!");
                }
                else
                {
                    return Error("删除失败!");
                }
            }
            catch (Exception ex)
            {
                return Error("删除失败," + ex.Message.ToString());
            }
        }
        #endregion
    }
}
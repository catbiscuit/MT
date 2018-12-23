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
    /// 基础数据管理
    /// </summary>
    [HandlerLogin(LoginMode.Enforce)]
    public class DataItemController : MvcControllerBase
    {
        #region 字段、属性
        private readonly IT_DataItemBLL _iT_DataItemBLL;
        public DataItemController(IT_DataItemBLL iT_DataItemBLL)
        {
            this._iT_DataItemBLL = iT_DataItemBLL;
        }
        #endregion

        #region 视图
        public ActionResult Index()
        {
            return View();
        }
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
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult GetDataItemList(int page, int limit)
        {
            try
            {
                string sTableName = "T_DataItem";
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
            T_DataItem model = null;
            try
            {
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
        /// <summary>
        /// 导出列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public void ExportList()
        {
            try
            {
                string sTableName = "T_DataItem";
                string sqlWhere = string.Empty;
                string orderSort = "F_Sort asc";
                int StartIndex = 1;
                int EndIndex = int.MaxValue;

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
                string sExcelTitle = "基础数据管理列表";
                string sFileName = string.Format("{0}_{1}.xls", sExcelTitle, DateTime.Now.ToString("yyyyMMddHHmmss"));                

                //设置导出格式
                ExcelConfig excelconfig = new ExcelConfig();
                excelconfig.Title = sExcelTitle;
                excelconfig.TitleFont = "微软雅黑";
                excelconfig.TitlePoint = 15;
                excelconfig.FileName = sFileName;
                excelconfig.IsAllSizeColumn = true;
                //表头
                excelconfig.ColumnEntity = new List<ColumnEntity>() 
                {
                    new ColumnEntity(){Column="F_ItemCode",ExcelColumn="项目编码",Alignment="center"},
                    new ColumnEntity(){Column="F_ItemName",ExcelColumn="项目名称",Alignment="center"},
                    new ColumnEntity(){Column="F_Remark",ExcelColumn="备注",Alignment="center"}
                };
                //行数据                
                DataTable rowData = dsResult.Tables[0];

                ExcelHelper.ExcelDownload(rowData, excelconfig);
            }
            catch (Exception)
            { }
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
        /// <param name="FormType">页面类型(ADD添加 UPDATE更新)</param>
        /// <param name="F_IDValue">所修改记录的主键</param>
        /// <param name="model">实体</param>
        /// <returns></returns>
        [HttpPost]
        [HandlerAjaxOnly]
        public ActionResult SaveForm(string FormType, string F_IDValue, T_DataItem model)
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
                        if (_iT_DataItemBLL.Insert(model) > 0)
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
                T_DataItem model = null;
                Guid F_ID = default(Guid);
                if (string.IsNullOrEmpty(F_IDValue))
                {
                    return Error("主键为空,获取记录失败!");
                }
                if (Guid.TryParse(F_IDValue, out F_ID) == false)
                {
                    return Error("主键格式错误,获取记录失败!");
                }

                model = _iT_DataItemBLL.GetModelByCondition(x => x.F_ID == F_ID);
                model.F_isValid = (int)F_isValid.Delete;

                if (_iT_DataItemBLL.Update() > 0)
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
                T_DataItem model = null;
                List<string> lstF_ID = F_IDValue.Split(',').ToList();

                foreach (string item in lstF_ID)
                {
                    var F_ID = Guid.Parse(item);
                    model = _iT_DataItemBLL.GetModelByCondition(x => x.F_ID == F_ID);
                    model.F_isValid = (int)F_isValid.Delete;
                }

                if (_iT_DataItemBLL.Update() > 0)
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
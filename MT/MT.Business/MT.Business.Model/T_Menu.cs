//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MT.Business.Model
{
    using System;
    using System.Collections.Generic;
    
    /// <summary>
    /// 
    /// </summary>
    public partial class T_Menu
    {
    	/// <summary>
    	/// 主键
    	/// </summary>
        public System.Guid F_ID { get; set; }
    	/// <summary>
    	/// 菜单名称
    	/// </summary>
        public string F_MenuName { get; set; }
    	/// <summary>
    	/// 
    	/// </summary>
        public string F_Link { get; set; }
    	/// <summary>
    	/// 父级菜单编码
    	/// </summary>
        public Nullable<System.Guid> F_ParentID { get; set; }
    	/// <summary>
    	/// 菜单级别
    	/// </summary>
        public Nullable<int> F_Level { get; set; }
    	/// <summary>
    	/// 排序
    	/// </summary>
        public Nullable<int> F_Sort { get; set; }
    	/// <summary>
    	/// 数据状态
    	/// </summary>
        public Nullable<int> F_isValid { get; set; }
    	/// <summary>
    	/// 备注
    	/// </summary>
        public string F_Remark { get; set; }
    	/// <summary>
    	/// 
    	/// </summary>
        public Nullable<int> F_isPage { get; set; }
    	/// <summary>
    	/// 
    	/// </summary>
        public string F_Icon { get; set; }
    }
}

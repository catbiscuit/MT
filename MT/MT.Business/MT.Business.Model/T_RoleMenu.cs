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
    public partial class T_RoleMenu
    {
    	/// <summary>
    	/// 主键
    	/// </summary>
        public System.Guid F_ID { get; set; }
    	/// <summary>
    	/// 角色ID
    	/// </summary>
        public Nullable<System.Guid> F_RoleID { get; set; }
    	/// <summary>
    	/// 菜单ID
    	/// </summary>
        public Nullable<System.Guid> F_MenuID { get; set; }
    }
}
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
    public partial class T_User
    {
    	/// <summary>
    	/// GUID主键
    	/// </summary>
        public System.Guid F_ID { get; set; }
    	/// <summary>
    	/// 姓名
    	/// </summary>
        public string F_UserName { get; set; }
    	/// <summary>
    	/// 登录名
    	/// </summary>
        public string F_LoginName { get; set; }
    	/// <summary>
    	/// 密码
    	/// </summary>
        public string F_Password { get; set; }
    	/// <summary>
    	/// 数据状态
    	/// </summary>
        public Nullable<int> F_isValid { get; set; }
    	/// <summary>
    	/// 备注
    	/// </summary>
        public string F_Remark { get; set; }
    }
}
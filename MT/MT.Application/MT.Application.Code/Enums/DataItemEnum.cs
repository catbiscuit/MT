using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Application.Code.Enums
{
    /*
     * 2018-11-12 19:42:23
     * 常用的枚举，对应T_DataItem表和T_DataItemDetail
     * */

    /// <summary>
    /// 数据状态
    /// </summary>
    public enum F_isValid
    {
        /// <summary>
        /// 已删除
        /// </summary>
        [Description("已删除")]
        Delete = 0,
        /// <summary>
        /// 正常
        /// </summary>
        [Description("正常")]
        Normal = 1
    }
}

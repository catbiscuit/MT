using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Utility.WebControl
{
    /// <summary>
    /// 表示Ajax操作结果 
    /// </summary>
    public class AjaxResult
    {
        /// <summary>
        /// 获取 ajax结果类型编码
        /// </summary>
        public int code { get; set; }

        /// <summary>
        /// 获取 ajax结果类型名称
        /// </summary>
        public string codeType { get; set; }

        /// <summary>
        /// 获取 消息内容
        /// </summary>
        public string msg { get; set; }

        /// <summary>
        /// 获取 数据的条数
        /// </summary>
        public int count { get; set; }

        /// <summary>
        /// 获取 返回数据
        /// </summary>
        public object data { get; set; }
    }
    /// <summary>
    /// 表示 ajax 操作结果类型的枚举
    /// </summary>
    public enum ResultType
    {
        /// <summary>
        /// 数据结果类型(LayUI表格获取数据时code=0)
        /// </summary>
        data = 0,

        /// <summary>
        /// 成功结果类型(执行操作成功或获取单个实体数据)
        /// </summary>
        success = 1,

        /// <summary>
        /// 警告结果类型(执行成功但存在隐患)
        /// </summary>
        warning = 2,

        /// <summary>
        /// 异常结果类型(执行操作失败或获取数据失败)
        /// </summary>
        error = 3
    }
}

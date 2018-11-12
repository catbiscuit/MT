using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Business.Model;
using MT.Utility.WebControl;

namespace MT.Business.IBLL.SystemManage
{
    /// <summary>
    /// 功能: 实体类 ()    
    /// 创建日期：2018/11/3    
    /// </summary>  
    public interface IT_DataItemBLL
    {
        int Insert(T_DataItem entity);
        int Delete(T_DataItem entity);
        int Update();
        T_DataItem GetModelByCondition(Expression<Func<T_DataItem, bool>> condition);

    }
}

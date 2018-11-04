using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Business.Model;

namespace MT.Business.IBLL.SystemManage
{
    /// <summary>
    /// 功能: 实体类 ()    
    /// 创建日期：2018/11/3    
    /// </summary>  
    public interface IT_DataItemDetailBLL
    {
        int Insert(T_DataItemDetail entity);
        int Delete(T_DataItemDetail entity);
        int Update();        
        T_DataItemDetail GetModelByCondition(Expression<Func<T_DataItemDetail,bool>> condition);
    }
}

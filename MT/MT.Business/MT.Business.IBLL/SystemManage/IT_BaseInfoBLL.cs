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
    /// 功能: 实体类 (基础信息表)    
    /// 创建日期：2018/10/17    
    /// </summary>  
    public interface IT_BaseInfoBLL
    {
        int Insert(T_BaseInfo entity);
        int Delete(T_BaseInfo entity);
        int Update();        
        T_BaseInfo GetModelByCondition(Expression<Func<T_BaseInfo,bool>> condition);
    }
}

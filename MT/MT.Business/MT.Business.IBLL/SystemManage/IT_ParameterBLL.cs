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
    /// 创建日期：2019/1/6    
    /// </summary>  
    public interface IT_ParameterBLL
    {        
        int Insert(T_Parameter entity);
        int Delete(T_Parameter entity);
        int Update();        
        T_Parameter GetModelByCondition(Expression<Func<T_Parameter,bool>> condition);
    }
}

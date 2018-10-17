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
    /// 创建日期：2018/10/17    
    /// </summary>  
    public interface IT_UserRoleBLL
    {
        int Insert(T_UserRole entity);
        int Delete(T_UserRole entity);
        int Update();        
        T_UserRole GetModelByCondition(Expression<Func<T_UserRole,bool>> condition);
    }
}

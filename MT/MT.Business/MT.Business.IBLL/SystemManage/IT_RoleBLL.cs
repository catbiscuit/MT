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
    public interface IT_RoleBLL
    {
        int Insert(T_Role entity);
        int Delete(T_Role entity);
        int Update();        
        T_Role GetModelByCondition(Expression<Func<T_Role,bool>> condition);
    }
}

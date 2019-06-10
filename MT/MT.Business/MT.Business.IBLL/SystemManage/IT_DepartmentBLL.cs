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
    /// 创建日期：2019/2/28    
    /// </summary>  
    public interface IT_DepartmentBLL
    {
        int Insert(T_Department entity);
        int Delete(T_Department entity);
        int Update();        
        T_Department GetModelByCondition(Expression<Func<T_Department,bool>> condition);
    }
}

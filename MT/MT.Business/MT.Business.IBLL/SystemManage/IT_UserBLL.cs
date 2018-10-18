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
    public interface IT_UserBLL
    {
        int Insert(T_User entity);
        int Delete(T_User entity);
        int Update();
        T_User GetModelByCondition(Expression<Func<T_User, bool>> condition);

        int Add(T_User user, List<T_UserRole> lstUserrole);

        T_User CheckLogin(string loginname, string loginpassword);
    }
}

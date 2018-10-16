using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Business.Model;

namespace MT.Business.IBLL.SystemManage
{
    public interface IT_LogBLL
    {
        int Insert(T_Log entity);
        int Delete(T_Log entity);
        int Update();
        int Insert(List<T_Log> lstEntity);

        T_Log GetModelByCondition(Expression<Func<T_Log, bool>> condition);
    }
}

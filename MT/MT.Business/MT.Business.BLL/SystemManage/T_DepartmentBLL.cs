using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Business.IBLL.SystemManage;
using MT.Business.IDAL.SystemManage;
using MT.Business.Model;
using MT.Data.Base;
using MT.Data.Base.IBaseInterface;

namespace MT.Business.BLL.SystemManage
{
    /// <summary>
    /// 功能: 实体类 ()    
    /// 创建日期：2019/2/28    
    /// </summary>  
    public class T_DepartmentBLL : IT_DepartmentBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_DepartmentDAL _iT_DepartmentDAL;
        
        public T_DepartmentBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_DepartmentDAL iT_DepartmentDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_DepartmentDAL = iT_DepartmentDAL;
        }

        public int Insert(T_Department entity)
        {
            _iT_DepartmentDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_Department entity)
        {
            _iT_DepartmentDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_Department GetModelByCondition(Expression<Func<T_Department, bool>> condition)
        {
            return _iT_DepartmentDAL.GetModelByCondition(condition);
        }
    }
}

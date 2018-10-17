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

namespace MT.Business.IDAL.SystemManage
{
    /// <summary>
    /// 功能: 实体类 ()    
    /// 创建日期：2018/10/17    
    /// </summary>  
    public class T_UserRoleBLL : IT_UserRoleBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_UserRoleDAL _iT_UserRoleDAL;
        
        public T_UserRoleBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_UserRoleDAL iT_UserRoleDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_UserRoleDAL = iT_UserRoleDAL;
        }

        public int Insert(T_UserRole entity)
        {
            _iT_UserRoleDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_UserRole entity)
        {
            _iT_UserRoleDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_UserRole GetModelByCondition(Expression<Func<T_UserRole, bool>> condition)
        {
            return _iT_UserRoleDAL.GetModelByCondition(condition);
        }
    }
}

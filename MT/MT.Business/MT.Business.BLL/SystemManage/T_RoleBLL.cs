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
    public class T_RoleBLL : IT_RoleBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_RoleDAL _iT_RoleDAL;
        
        public T_RoleBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_RoleDAL iT_RoleDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_RoleDAL = iT_RoleDAL;
        }

        public int Insert(T_Role entity)
        {
            _iT_RoleDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_Role entity)
        {
            _iT_RoleDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_Role GetModelByCondition(Expression<Func<T_Role, bool>> condition)
        {
            return _iT_RoleDAL.GetModelByCondition(condition);
        }
    }
}

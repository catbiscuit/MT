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
    public class T_UserBLL : IT_UserBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_UserDAL _iT_UserDAL;
        private IT_UserRoleDAL _iT_UserRoleDAL;

        public T_UserBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_UserDAL iT_UserDAL
            , IT_UserRoleDAL iT_UserRoleDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_UserDAL = iT_UserDAL;
            this._iT_UserRoleDAL = iT_UserRoleDAL;
        }

        public int Insert(T_User entity)
        {
            _iT_UserDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_User entity)
        {
            _iT_UserDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_User GetModelByCondition(Expression<Func<T_User, bool>> condition)
        {
            return _iT_UserDAL.GetModelByCondition(condition);
        }


        public int Add(T_User user, List<T_UserRole> lstUserrole)
        {
            _iT_UserDAL.Insert(user);
            foreach (var item in lstUserrole)
            {
                _iT_UserRoleDAL.Insert(item);
            }
            return _iUnitOfWork.Commit();
        }
    }
}

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
using MT.Utility.Common.Security;

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


        public T_User CheckLogin(string loginname, string loginpassword)
        {
            T_User user = _iT_UserDAL.GetModelByCondition(x => x.F_LoginName == loginname);
            if (user == null)
            {
                throw new Exception("账号不存在，请重新输入");
            }
            if (user.F_isValid == null || user.F_isValid != 1)
            {
                throw new Exception("账号被系统锁定，请联系管理员");
            }
            string dbPassword = Md5Helper.MD5(DESEncrypt.Encrypt(loginpassword.ToLower()).ToLower(), 32).ToLower();
            if (dbPassword != user.F_Password)
            {
                throw new Exception("密码和账户名不匹配");
            }
            return user;
        }
    }
}

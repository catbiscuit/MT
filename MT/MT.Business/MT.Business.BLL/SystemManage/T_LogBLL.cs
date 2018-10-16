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
    public class T_LogBLL : IT_LogBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_LogDAL _iT_LogDAL;

        public T_LogBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_LogDAL iT_LogDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_LogDAL = iT_LogDAL;
        }

        public int Insert(T_Log entity)
        {
            _iT_LogDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_Log entity)
        {
            _iT_LogDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public int Insert(List<T_Log> lstEntity)
        {
            foreach (var item in lstEntity)
            {
                _iT_LogDAL.Insert(item);
            }
            return _iUnitOfWork.Commit();
        }

        public T_Log GetModelByCondition(Expression<Func<T_Log, bool>> condition)
        {
            return _iT_LogDAL.GetModelByCondition(condition);
        }
    }
}

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
    /// 创建日期：2018/11/3    
    /// </summary>  
    public class T_DataItemBLL : IT_DataItemBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_DataItemDAL _iT_DataItemDAL;
        
        public T_DataItemBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_DataItemDAL iT_DataItemDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_DataItemDAL = iT_DataItemDAL;
        }

        public int Insert(T_DataItem entity)
        {
            _iT_DataItemDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_DataItem entity)
        {
            _iT_DataItemDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_DataItem GetModelByCondition(Expression<Func<T_DataItem, bool>> condition)
        {
            return _iT_DataItemDAL.GetModelByCondition(condition);
        }
    }
}

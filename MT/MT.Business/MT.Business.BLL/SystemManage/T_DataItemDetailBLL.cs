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
    public class T_DataItemDetailBLL : IT_DataItemDetailBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_DataItemDetailDAL _iT_DataItemDetailDAL;
        
        public T_DataItemDetailBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_DataItemDetailDAL iT_DataItemDetailDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_DataItemDetailDAL = iT_DataItemDetailDAL;
        }

        public int Insert(T_DataItemDetail entity)
        {
            _iT_DataItemDetailDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_DataItemDetail entity)
        {
            _iT_DataItemDetailDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_DataItemDetail GetModelByCondition(Expression<Func<T_DataItemDetail, bool>> condition)
        {
            return _iT_DataItemDetailDAL.GetModelByCondition(condition);
        }
    }
}

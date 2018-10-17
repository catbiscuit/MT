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
    /// 功能: 实体类 (基础信息表)    
    /// 创建日期：2018/10/17    
    /// </summary>  
    public class T_BaseInfoBLL : IT_BaseInfoBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_BaseInfoDAL _iT_BaseInfoDAL;
        
        public T_BaseInfoBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_BaseInfoDAL iT_BaseInfoDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_BaseInfoDAL = iT_BaseInfoDAL;
        }

        public int Insert(T_BaseInfo entity)
        {
            _iT_BaseInfoDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_BaseInfo entity)
        {
            _iT_BaseInfoDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_BaseInfo GetModelByCondition(Expression<Func<T_BaseInfo, bool>> condition)
        {
            return _iT_BaseInfoDAL.GetModelByCondition(condition);
        }
    }
}

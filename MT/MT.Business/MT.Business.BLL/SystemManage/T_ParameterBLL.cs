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
    /// 创建日期：2019/1/6    
    /// </summary>  
    public class T_ParameterBLL : IT_ParameterBLL
    {
        private IUnitOfWork<MTEntities> _iUnitOfWork;
        private IT_ParameterDAL _iT_ParameterDAL;
        
        public T_ParameterBLL(IUnitOfWork<MTEntities> iUnitOfWork
            , IT_ParameterDAL iT_ParameterDAL)
        {
            this._iUnitOfWork = iUnitOfWork;
            this._iT_ParameterDAL = iT_ParameterDAL;
        }

        public int Insert(T_Parameter entity)
        {
            _iT_ParameterDAL.Insert(entity);
            return _iUnitOfWork.Commit();
        }
        public int Delete(T_Parameter entity)
        {
            _iT_ParameterDAL.Delete(entity);
            return _iUnitOfWork.Commit();
        }

        public int Update()
        {
            return _iUnitOfWork.Commit();
        }

        public T_Parameter GetModelByCondition(Expression<Func<T_Parameter, bool>> condition)
        {
            return _iT_ParameterDAL.GetModelByCondition(condition);
        }
    }
}

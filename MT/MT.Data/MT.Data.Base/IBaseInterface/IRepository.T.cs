using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MT.Data.Base.IBaseInterface
{
    /// <summary>
    /// 定义仓储模型中的数据标准操作接口
    /// </summary>
    public interface IRepository<T>
        where T : class
    {
        /// <summary>
        /// 插入一个实体
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        void Insert(T entity);
        /// <summary>
        /// 根据主键删除实体
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        void Delete(T entity);
        /// <summary>
        /// 根据条件获取实体
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        T GetModelByCondition(Expression<Func<T, bool>> condition);
    }
}

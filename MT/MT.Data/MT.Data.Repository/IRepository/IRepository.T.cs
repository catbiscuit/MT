using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Utility.WebControl;

namespace MT.Data.Repository.IRepository
{
    /// <summary>
    /// 定义仓储模型中的数据标准操作接口
    /// </summary>
    public interface IRepository<T>
        where T : class,new()
    {
        IRepository<T> BeginTrans();
        void Commit();
        void Rollback();

        int Insert(T entity);
        int Delete(object keyValue);
        int Update(T entity);

        IEnumerable<T> FindList(Expression<Func<T, bool>> condition, Pagination pagination);
    }
}

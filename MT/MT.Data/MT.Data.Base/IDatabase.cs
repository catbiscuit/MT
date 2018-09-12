using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MT.Data.Base
{
    /// <summary>     
    /// 操作数据库接口     
    /// </summary>     
    public interface IDatabase
    {
        IDatabase BeginTrans();
        int Commit();
        void Rollback();
        void Close();

        int Insert<T>(T entity) where T : class;
        int Delete<T>(object KeyValue) where T : class;
        int Update<T>(T entity) where T : class;

        IEnumerable<T> FindList<T>(Expression<Func<T, bool>> condition, string orderField, bool isAsc, int pageSize, int pageIndex, out int total) where T : class,new();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Data.Base;
using MT.Data.Repository.IRepository;
using MT.Utility.WebControl;

namespace MT.Data.Repository.Repository
{
    public class Repository<T> : IRepository<T>
        where T : class ,new()
    {
        #region 构造
        public IDatabase _iDatabase;
        public Repository(IDatabase iDatabase)
        {
            this._iDatabase = iDatabase;
        }
        #endregion

        #region 事物提交
        public IRepository<T> BeginTrans()
        {
            _iDatabase.BeginTrans();
            return this;
        }
        public void Commit()
        {
            _iDatabase.Commit();
        }
        public void Rollback()
        {
            _iDatabase.Rollback();
        }
        #endregion

        #region 对象实体 添加、修改、删除
        public int Insert(T entity)
        {
            return _iDatabase.Insert<T>(entity);
        }
        public int Delete(object keyValue)
        {
            return _iDatabase.Delete<T>(keyValue);
        }
        public int Update(T entity)
        {
            return _iDatabase.Update<T>(entity);
        }
        #endregion

        #region 对象实体 查询
        public IEnumerable<T> FindList(Expression<Func<T, bool>> condition, Pagination pagination)
        {
            int total = pagination.records;
            var data = _iDatabase.FindList<T>(condition, pagination.sidx, pagination.sord.ToLower() == "asc" ? true : false, pagination.rows, pagination.page, out total);
            pagination.records = total;
            return data;
        }
        #endregion
    }
}

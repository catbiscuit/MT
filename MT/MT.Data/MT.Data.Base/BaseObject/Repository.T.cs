using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using MT.Data.Base.IBaseInterface;

namespace MT.Data.Base.BaseObject
{
    public class Repository<T, TT> : IRepository<T>
        where T : class
        where TT : DbContext
    {
        #region 构造
        //数据库上下文(私有)
        private TT _dbcontext;
        //数据库上下文操作对象(私有)
        private readonly DbSet<T> _dbset;

        //数据库工厂
        protected IDatabaseFactory<TT> _iDatabaseFactory
        {
            get;
            private set;
        }
        //数据库上下文(保护级)
        protected TT _dbContext
        {
            get { return _dbcontext ?? (_dbcontext = _iDatabaseFactory.Get()); }
        }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="iDatabaseFactory"></param>
        public Repository(IDatabaseFactory<TT> iDatabaseFactory)
        {
            this._iDatabaseFactory = iDatabaseFactory;
            this._dbset = _dbContext.Set<T>();
        }
        #endregion

        #region 对象实体 添加、修改、删除
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual void Insert(T entity)
        {
            _dbset.Add(entity);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual void Delete(T entity)
        {
            _dbset.Remove(entity);
        }
        /// <summary>
        /// 根据lambda表达式获取对象
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        public T GetModelByCondition(Expression<Func<T, bool>> condition)
        {
            return _dbset.Where(condition).FirstOrDefault();
        }
        #endregion
    }
}

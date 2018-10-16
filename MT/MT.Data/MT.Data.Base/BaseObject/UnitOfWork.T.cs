using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MT.Data.Base.IBaseInterface;

namespace MT.Data.Base.BaseObject
{
    public class UnitOfWork<T> : IUnitOfWork<T>
        where T : DbContext
    {
        //数据库工厂
        private readonly IDatabaseFactory<T> _iDatabaseFactory;
        //数据库上下文(私有)
        private T _dbcontext;

        //数据库上下文(保护级)
        public T _dbContext
        {
            get { return _dbcontext ?? (_dbcontext = _iDatabaseFactory.Get()); }
        }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="iDatabaseFactory"></param>
        public UnitOfWork(IDatabaseFactory<T> iDatabaseFactory)
        {
            this._iDatabaseFactory = iDatabaseFactory;
        }

        /// <summary>
        /// 提交更改
        /// </summary>
        /// <returns></returns>
        public int Commit()
        {
            return _dbContext.SaveChanges();
        }
    }
}

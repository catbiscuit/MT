using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Data.Base.IBaseInterface
{
    public interface IUnitOfWork<T>
        where T : DbContext
    {
        /// <summary>
        /// 提交更改
        /// </summary>
        /// <returns></returns>
        int Commit();
        /// <summary>
        /// 数据库上下文
        /// </summary>
        T _dbContext { get; }
    }
}

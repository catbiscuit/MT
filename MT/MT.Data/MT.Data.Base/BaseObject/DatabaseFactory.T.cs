using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MT.Data.Base.IBaseInterface;

namespace MT.Data.Base.BaseObject
{
    /// <summary>
    /// 数据库工厂类
    /// </summary>
    public class DatabaseFactory<T> : IDatabaseFactory<T>
        where T : class
    {
        private T _dbcontext;
        /// <summary>
        /// 获取一个数据库上下文对象
        /// 每一次http请求都会开启一个新的线程
        /// 保证在一个线程(功能)中,DbContext是唯一
        /// </summary>
        /// <returns></returns>
        public T Get()
        {
            try
            {
                if (_dbcontext == null)
                {
                    Type t = typeof(T);
                    System.Reflection.ConstructorInfo ci = t.GetConstructor(System.Type.EmptyTypes);
                    T to = (T)ci.Invoke(new object[0]);
                    _dbcontext = to;
                }
                return _dbcontext;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Dispose()
        {
            if (_dbcontext != null)
            {
                ((IDisposable)_dbcontext).Dispose();
            }
        }
    }
}

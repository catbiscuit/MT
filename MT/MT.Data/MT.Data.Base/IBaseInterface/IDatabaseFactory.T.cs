using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Data.Base.IBaseInterface
{
    /// <summary>
    /// 数据库工厂接口
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IDatabaseFactory<T> : IDisposable
        where T : class
    {
        T Get();
    }
}

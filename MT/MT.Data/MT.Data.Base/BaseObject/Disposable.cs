using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MT.Data.Base.BaseObject
{
    /// <summary>
    /// 释放资源
    /// </summary>
    public class Disposable
    {
        //是否回收完毕
        private bool isDisposed;

        ~Disposable()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            //标志位:未回收，且参数标识为需要回收资源
            if (!isDisposed && disposing)
            {
                //释放那些实现IDisposable接口的托管对象。此处调用方法进行释放。
                DisposeCore();
            }            
            isDisposed = true;
            //释放非托管资源。此处没有需要释放的非托管对象
        }

        protected virtual void DisposeCore()
        {
        }
    }
}

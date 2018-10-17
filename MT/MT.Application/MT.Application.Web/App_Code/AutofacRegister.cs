using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Autofac;
using MT.Business.BLL.SystemManage;
using MT.Business.DAL.SystemManage;
using MT.Business.IBLL.SystemManage;
using MT.Business.IDAL.SystemManage;
using MT.Business.Model;
using MT.Data.Base;
using MT.Data.Base.BaseObject;
using MT.Data.Base.IBaseInterface;

namespace MT.Application.Web.App_Code
{
    /// <summary>
    /// Autofac注册
    /// </summary>
    public class AutofacRegister
    {
        public static ContainerBuilder Register()
        {
            ContainerBuilder builder = null;
            try
            {
                builder = new ContainerBuilder();
                //工作单元
                builder.RegisterGeneric(typeof(UnitOfWork<>)).As(typeof(IUnitOfWork<>));//单例模式
                //数据库工厂                
                builder.RegisterGeneric(typeof(DatabaseFactory<>)).As(typeof(IDatabaseFactory<>)).InstancePerRequest();

                //T_Log类
                builder.RegisterType<T_LogDAL>().As<IT_LogDAL>();
                builder.RegisterType<T_LogBLL>().As<IT_LogBLL>();

                return builder;
            }
            catch
            {
                builder = new ContainerBuilder();
                return builder;
            }
        }

    }
}
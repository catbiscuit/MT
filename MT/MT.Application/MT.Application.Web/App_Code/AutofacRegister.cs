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

                //T_BaseInfo类
                builder.RegisterType<T_BaseInfoDAL>().As<IT_BaseInfoDAL>();
                builder.RegisterType<T_BaseInfoBLL>().As<IT_BaseInfoBLL>();
                //T_Log类
                builder.RegisterType<T_LogDAL>().As<IT_LogDAL>();
                builder.RegisterType<T_LogBLL>().As<IT_LogBLL>();
                //T_Role类
                builder.RegisterType<T_RoleDAL>().As<IT_RoleDAL>();
                builder.RegisterType<T_RoleBLL>().As<IT_RoleBLL>();
                //T_User类
                builder.RegisterType<T_UserDAL>().As<IT_UserDAL>();
                builder.RegisterType<T_UserBLL>().As<IT_UserBLL>();
                //T_UserRole类
                builder.RegisterType<T_UserRoleDAL>().As<IT_UserRoleDAL>();
                builder.RegisterType<T_UserRoleBLL>().As<IT_UserRoleBLL>();

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
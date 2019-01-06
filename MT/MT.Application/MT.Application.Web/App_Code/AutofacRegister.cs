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
                //登录用户的提供者
                builder.RegisterType<MT.Application.Code.CurrentUser.UserProvider>().As<MT.Application.Code.CurrentUser.IUserProvider>();

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

                //T_DataItem类
                builder.RegisterType<T_DataItemDAL>().As<IT_DataItemDAL>();
                builder.RegisterType<T_DataItemBLL>().As<IT_DataItemBLL>();
                //T_DataItemDetail类
                builder.RegisterType<T_DataItemDetailDAL>().As<IT_DataItemDetailDAL>();
                builder.RegisterType<T_DataItemDetailBLL>().As<IT_DataItemDetailBLL>();

                //T_Parameter类
                builder.RegisterType<T_ParameterDAL>().As<IT_ParameterDAL>();
                builder.RegisterType<T_ParameterBLL>().As<IT_ParameterBLL>();

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
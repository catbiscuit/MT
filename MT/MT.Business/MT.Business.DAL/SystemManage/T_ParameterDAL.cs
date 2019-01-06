﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MT.Business.IDAL.SystemManage;
using MT.Business.Model;
using MT.Data.Base;
using MT.Data.Base.BaseObject;
using MT.Data.Base.IBaseInterface;

namespace MT.Business.DAL.SystemManage
{
    /// <summary>
    /// 功能: 实体类 ()    
    /// 创建日期：2019/1/6    
    /// </summary>  
    public class T_ParameterDAL : Repository<T_Parameter, MTEntities>, IT_ParameterDAL
    {
        public T_ParameterDAL(IDatabaseFactory<MTEntities> iDatabaseFactory)
            : base(iDatabaseFactory)
        {

        }
    }
}

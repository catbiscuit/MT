using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MT.Business.IDAL.SystemManage;
using MT.Business.Model;
using MT.Data.Base;
using MT.Data.Base.BaseObject;
using MT.Data.Base.IBaseInterface;

namespace MT.Business.IDAL.SystemManage
{
    /// <summary>
    /// 功能: 实体类 (基础信息表)    
    /// 创建日期：2018/10/17    
    /// </summary>  
    public class T_BaseInfoDAL : Repository<T_BaseInfo, MTEntities>, IT_BaseInfoDAL
    {
        public T_BaseInfoDAL(IDatabaseFactory<MTEntities> iDatabaseFactory)
            : base(iDatabaseFactory)
        {

        }
    }
}

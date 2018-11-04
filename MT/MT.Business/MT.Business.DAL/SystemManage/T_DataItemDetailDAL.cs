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
    /// 功能: 实体类 ()    
    /// 创建日期：2018/11/3    
    /// </summary>  
    public class T_DataItemDetailDAL : Repository<T_DataItemDetail, MTEntities>, IT_DataItemDetailDAL
    {
        public T_DataItemDetailDAL(IDatabaseFactory<MTEntities> iDatabaseFactory)
            : base(iDatabaseFactory)
        {

        }
    }
}

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

namespace MT.Business.DAL.SystemManage
{
    public class T_LogDAL : Repository<T_Log, MTEntities>, IT_LogDAL
    {
        public T_LogDAL(IDatabaseFactory<MTEntities> iDatabaseFactory)
            : base(iDatabaseFactory)
        {

        }
    }
}

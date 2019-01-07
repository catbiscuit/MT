using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MT.Business.IBLL.SystemManage;
using MT.Business.Model;
using MT.Cache.Factory;

namespace MT.Application.Web.App_Code
{
    /// <summary>
    /// 常用字典项目
    /// </summary>
    public static class CodeHelper
    {
        private static MTEntities entity = new MTEntities();
        /// <summary>
        /// 获取参数
        /// </summary>
        /// <returns></returns>
        public static List<T_Parameter> GetT_ParameterList()
        {
            string cacheKey = "T_Parameter";
            List<T_Parameter> list = CacheFactory.Cache().GetCache<List<T_Parameter>>(cacheKey);
            if (list == null)
            {
                List<T_Parameter> data = (
                    from p in entity.T_Parameter
                    where p.F_isValid == 1
                    orderby p.F_Sort
                    select p).ToList();
                CacheFactory.Cache().WriteCache(data, cacheKey);
                return data;
            }
            else
            {
                return list;
            }
        }
    }
}
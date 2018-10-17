using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MT.Business.IBLL.SystemManage;
using MT.Business.Model;

namespace MT.Application.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IT_LogBLL _iT_LogBLL;
        private readonly IT_UserBLL _iT_UserBLL;
        private readonly IT_UserRoleBLL _iT_UserRoleBLL;
        private readonly IT_RoleBLL _iT_RoleBLL;

        public HomeController(IT_LogBLL iT_LogBLL
            , IT_UserBLL iT_UserBLL
            , IT_UserRoleBLL iT_UserRoleBLL
            , IT_RoleBLL iT_RoleBLL)
        {
            this._iT_LogBLL = iT_LogBLL;
            this._iT_UserBLL = iT_UserBLL;
            this._iT_UserRoleBLL = iT_UserRoleBLL;
            this._iT_RoleBLL = iT_RoleBLL;
        }

        public ActionResult Index()
        {
            T_User user = new T_User();
            user.F_ID = Guid.NewGuid();
            user.F_UserName = DateTime.Now.ToShortTimeString();

            T_Role role = new T_Role();
            role = _iT_RoleBLL.GetModelByCondition(x => x.F_RoleName == "管理员");

            List<T_UserRole> lstUserRole = new List<T_UserRole>();
            T_UserRole userRole = new T_UserRole();
            userRole.F_ID = Guid.NewGuid();
            userRole.F_UserID = user.F_ID;
            userRole.F_RoleID = role.F_ID;
            userRole.F_isValid = 1;
            lstUserRole.Add(userRole);

            return View();
        }

        public ActionResult Add()
        {
            T_User user = new T_User();
            user.F_ID = Guid.Parse("259E4C58-6719-4896-904C-F090E3F45514");
            user.F_UserName = DateTime.Now.ToShortTimeString();

            T_Role role = new T_Role();
            role = _iT_RoleBLL.GetModelByCondition(x => x.F_RoleName == "管理员");

            List<T_UserRole> lstUserRole = new List<T_UserRole>();
            T_UserRole userRole = new T_UserRole();
            userRole.F_ID = Guid.NewGuid();
            userRole.F_UserID = user.F_ID;
            userRole.F_RoleID = role.F_ID;
            userRole.F_isValid = 1;
            lstUserRole.Add(userRole);

            _iT_UserBLL.Add(user, lstUserRole);

            return View();
        }

    }
}
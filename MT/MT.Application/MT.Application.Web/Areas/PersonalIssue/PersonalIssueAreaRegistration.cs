﻿using System.Web.Mvc;

namespace MT.Application.Web.Areas.PersonalIssue
{
    public class PersonalIssueAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "PersonalIssue";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
               this.AreaName + "_Default",
               this.AreaName + "/{controller}/{action}/{id}",
               new { area = this.AreaName, Controller = "Home", action = "Index", id = UrlParameter.Optional },
               new string[] { "MT.Application.Web.Areas." + this.AreaName + ".Controllers" }
            );
        }
    }
}
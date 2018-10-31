DECLARE @LoginName varchar(200)--admin �û�����
DECLARE @UserID varchar(36)--�û�����
DECLARE @RoleID varchar(36)--��ɫ����  

set @LoginName='admin';
select top 1 @UserID=F_ID from T_User where F_LoginName=@LoginName;
select top 1 @RoleID=F_RoleID from T_UserRole where F_UserID=@UserID;

delete from T_RoleMenu
where F_RoleID=@RoleID

insert into T_RoleMenu
select newid(),@RoleID,F_ID
from T_Menu
where F_Level>0 and F_isValid=1
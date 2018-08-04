CREATE ROLE [db_executor]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_executor', N'svcssbrp'
GO
GRANT EXECUTE TO [db_executor]

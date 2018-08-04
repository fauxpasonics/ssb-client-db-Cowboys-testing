CREATE TABLE [dbo].[FanManager_Contacts_Historical]
(
[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Street1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Street2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO

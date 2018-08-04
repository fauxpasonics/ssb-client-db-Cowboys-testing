CREATE TABLE [ods].[Listrak_Attributes]
(
[AttributeID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRestAPIEnabled] [bit] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO

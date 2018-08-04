CREATE TABLE [ods].[Listrak_Click]
(
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LinkDescription] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LinkUrl] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ClickDate] [datetime] NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__14DEEFE6] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__15D3141F] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__16C73858] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__17BB5C91] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_ClickUpdate] ON [ods].[Listrak_Click]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_Click] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID] AND t.[ContactID] = i.[ContactID] AND t.[EmailAddress] = i.[EmailAddress] AND t.[LinkDescription] = i.[LinkDescription] AND t.[LinkUrl] = i.[LinkUrl] AND t.[ClickDate] = i.[ClickDate]

INSERT INTO [ods].[Snapshot_Listrak_Click] ([MessageID],[ContactID],[EmailAddress],[LinkDescription],[LinkUrl],[ClickDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_Click] ADD CONSTRAINT [PK__Listrak___9DC8D1DACAFC4939] PRIMARY KEY CLUSTERED  ([MessageID], [ContactID], [EmailAddress], [LinkDescription], [LinkUrl], [ClickDate])
GO

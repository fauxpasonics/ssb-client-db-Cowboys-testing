CREATE TABLE [ods].[Listrak_Read]
(
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReadDate] [datetime] NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__577886F1] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__586CAB2A] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__5960CF63] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__5A54F39C] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_ReadUpdate] ON [ods].[Listrak_Read]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_Read] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID] AND t.[ContactID] = i.[ContactID] AND t.[EmailAddress] = i.[EmailAddress] AND t.[ReadDate] = i.[ReadDate]

INSERT INTO [ods].[Snapshot_Listrak_Read] ([MessageID],[ContactID],[EmailAddress],[ReadDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_Read] ADD CONSTRAINT [PK__Listrak___6BDB60A852F2A176] PRIMARY KEY CLUSTERED  ([MessageID], [ContactID], [EmailAddress], [ReadDate])
GO

CREATE TABLE [ods].[Listrak_Removal]
(
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AdditionDate] [datetime] NOT NULL,
[RemovalDate] [datetime] NOT NULL,
[RemovalMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__26A0456C] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__279469A5] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__28888DDE] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__297CB217] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_RemovalUpdate] ON [ods].[Listrak_Removal]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_Removal] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID] AND t.[ContactID] = i.[ContactID] AND t.[EmailAddress] = i.[EmailAddress] AND t.[AdditionDate] = i.[AdditionDate] AND t.[RemovalDate] = i.[RemovalDate] AND t.[RemovalMethod] = i.[RemovalMethod]

INSERT INTO [ods].[Snapshot_Listrak_Removal] ([MessageID],[ContactID],[EmailAddress],[AdditionDate],[RemovalDate],[RemovalMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_Removal] ADD CONSTRAINT [PK__Listrak___FFF2C312AB38CE93] PRIMARY KEY CLUSTERED  ([MessageID], [ContactID], [EmailAddress], [AdditionDate], [RemovalDate], [RemovalMethod])
GO

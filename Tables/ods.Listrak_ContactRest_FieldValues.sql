CREATE TABLE [ods].[Listrak_ContactRest_FieldValues]
(
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SegmentationFieldGroupId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SegmentationFieldId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SegmentationFieldValue] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__58B52910] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__59A94D49] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__5A9D7182] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__5B9195BB] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_ContactRest_FieldValuesUpdate] ON [ods].[Listrak_ContactRest_FieldValues]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_ContactRest_FieldValues] t
	JOIN inserted i ON  t.[ListID] = i.[ListID] AND t.[EmailAddress] = i.[EmailAddress] AND t.[SegmentationFieldGroupId] = i.[SegmentationFieldGroupId] AND t.[SegmentationFieldId] = i.[SegmentationFieldId]

INSERT INTO [ods].[Snapshot_Listrak_ContactRest_FieldValues] ([ListID],[EmailAddress],[SegmentationFieldGroupId],[SegmentationFieldId],[SegmentationFieldValue],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_ContactRest_FieldValues] ADD CONSTRAINT [PK__Listrak___E81EDB7A5521E434] PRIMARY KEY CLUSTERED  ([ListID], [EmailAddress], [SegmentationFieldGroupId], [SegmentationFieldId])
GO

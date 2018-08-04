CREATE TABLE [ods].[Listrak_Bounces]
(
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddres] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BounceReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BounceDetail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BounceDate] [datetime] NOT NULL,
[BounceCount] [int] NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_B__ETL_C__1649E212] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_B__ETL_C__173E064B] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_B__ETL_U__18322A84] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_B__ETL_U__19264EBD] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_BouncesUpdate] ON [ods].[Listrak_Bounces]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_Bounces] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID] AND t.[ContactID] = i.[ContactID] AND t.[EmailAddres] = i.[EmailAddres] AND t.[BounceReason] = i.[BounceReason] AND t.[BounceDetail] = i.[BounceDetail] AND t.[BounceDate] = i.[BounceDate] AND t.[BounceCount] = i.[BounceCount]

INSERT INTO [ods].[Snapshot_Listrak_Bounces] ([MessageID],[ContactID],[EmailAddres],[BounceReason],[BounceDetail],[BounceDate],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_Bounces] ADD CONSTRAINT [PK__Listrak___ED005BA62514F444] PRIMARY KEY CLUSTERED  ([MessageID], [ContactID], [EmailAddres], [BounceReason], [BounceDetail], [BounceDate], [BounceCount])
GO

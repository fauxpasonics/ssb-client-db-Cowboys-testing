CREATE TABLE [ods].[Listrak_MessageActivityRest]
(
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Abuse] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivityDate] [datetime2] NULL,
[Bounce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceReason] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClickCount] [int] NULL,
[EmailAddress] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Open] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderTotal] [decimal] (18, 6) NULL,
[Read] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime2] NULL,
[Unsubscribe] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisitDate] [datetime2] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL_C__2424929C] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_M__ETL_C__2518B6D5] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL_U__260CDB0E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_M__ETL_U__2700FF47] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_MessageActivityRestUpdate] ON [ods].[Listrak_MessageActivityRest]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_MessageActivityRest] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID] AND t.[EmailAddress] = i.[EmailAddress]

INSERT INTO [ods].[Snapshot_Listrak_MessageActivityRest] ([MessageID],[Abuse],[ActivityDate],[Bounce],[BounceReason],[Click],[ClickCount],[EmailAddress],[Open],[OrderTotal],[Read],[SendDate],[Unsubscribe],[VisitDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_MessageActivityRest] ADD CONSTRAINT [PK__Listrak___CCE6170811D7D00A] PRIMARY KEY CLUSTERED  ([MessageID], [EmailAddress])
GO

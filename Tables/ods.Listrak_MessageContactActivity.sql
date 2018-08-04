CREATE TABLE [ods].[Listrak_MessageContactActivity]
(
[MsgID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime] NULL,
[Opened] [bit] NULL,
[Read] [bit] NULL,
[ClickCount] [int] NULL,
[BounceCount] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL_C__3E93D1DB] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_M__ETL_C__3F87F614] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL_U__407C1A4D] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_M__ETL_U__41703E86] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_MessageContactActivityUpdate] ON [ods].[Listrak_MessageContactActivity]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_MessageContactActivity] t
	JOIN inserted i ON  t.[MsgID] = i.[MsgID] AND t.[ContactID] = i.[ContactID]

INSERT INTO [ods].[Snapshot_Listrak_MessageContactActivity] ([MsgID],[ContactID],[EmailAddress],[SendDate],[Opened],[Read],[ClickCount],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_MessageContactActivity] ADD CONSTRAINT [PK__Listrak___C3E53AC992C53451] PRIMARY KEY CLUSTERED  ([MsgID], [ContactID])
GO

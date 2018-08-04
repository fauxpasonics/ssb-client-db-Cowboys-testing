CREATE TABLE [ods].[Snapshot_Listrak_MessageActivityRest]
(
[Listrak_MessageActivityRestSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Abuse] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivityDate] [datetime2] NULL,
[Bounce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceReason] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClickCount] [int] NULL,
[EmailAddress] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderTotal] [decimal] (18, 6) NULL,
[Read] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime2] NULL,
[Unsubscribe] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisitDate] [datetime2] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_MessageActivityRest] ADD CONSTRAINT [PK__Snapshot__6E2B4F8AF1AC4800] PRIMARY KEY CLUSTERED  ([Listrak_MessageActivityRestSK])
GO

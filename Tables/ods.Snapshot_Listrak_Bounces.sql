CREATE TABLE [ods].[Snapshot_Listrak_Bounces]
(
[Listrak_BouncesSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddres] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceDetail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceDate] [datetime] NULL,
[BounceCount] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_Bounces] ADD CONSTRAINT [PK__Snapshot__E5950387CE47AFE5] PRIMARY KEY CLUSTERED  ([Listrak_BouncesSK])
GO

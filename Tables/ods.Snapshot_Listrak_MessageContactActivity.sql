CREATE TABLE [ods].[Snapshot_Listrak_MessageContactActivity]
(
[Listrak_MessageContactActivitySK] [int] NOT NULL IDENTITY(1, 1),
[MsgID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime] NULL,
[Opened] [bit] NULL,
[Read] [bit] NULL,
[ClickCount] [int] NULL,
[BounceCount] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_MessageContactActivity] ADD CONSTRAINT [PK__Snapshot__6D1BF43521D27B27] PRIMARY KEY CLUSTERED  ([Listrak_MessageContactActivitySK])
GO

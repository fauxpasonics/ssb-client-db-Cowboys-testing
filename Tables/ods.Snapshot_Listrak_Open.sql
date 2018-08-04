CREATE TABLE [ods].[Snapshot_Listrak_Open]
(
[Listrak_OpenSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OpenDate] [datetime] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_Open] ADD CONSTRAINT [PK__Snapshot__535FBBFBFBA082E7] PRIMARY KEY CLUSTERED  ([Listrak_OpenSK])
GO

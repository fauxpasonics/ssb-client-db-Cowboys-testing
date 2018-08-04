CREATE TABLE [ods].[Snapshot_Listrak_Click]
(
[Listrak_ClickSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkDescription] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkUrl] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClickDate] [datetime] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_Click] ADD CONSTRAINT [PK__Snapshot__21E160683744A180] PRIMARY KEY CLUSTERED  ([Listrak_ClickSK])
GO

CREATE TABLE [ods].[Snapshot_Listrak_Contact]
(
[Listrak_ContactSK] [int] NOT NULL IDENTITY(1, 1),
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttributeValue] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_Contact] ADD CONSTRAINT [PK__Snapshot__8EED94E4D0DE25FF] PRIMARY KEY CLUSTERED  ([Listrak_ContactSK])
GO

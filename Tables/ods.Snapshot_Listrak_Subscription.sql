CREATE TABLE [ods].[Snapshot_Listrak_Subscription]
(
[Listrak_SubscriptionSK] [int] NOT NULL IDENTITY(1, 1),
[ListID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionDate] [datetime] NULL,
[AdditionMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_Subscription] ADD CONSTRAINT [PK__Snapshot__FC82410F7D710F83] PRIMARY KEY CLUSTERED  ([Listrak_SubscriptionSK])
GO

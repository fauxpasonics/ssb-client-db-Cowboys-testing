CREATE TABLE [ods].[Snapshot_Listrak_Subscriptions]
(
[Listrak_SubscriptionsSK] [int] NOT NULL IDENTITY(1, 1),
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [ods].[Snapshot_Listrak_Subscriptions] ADD CONSTRAINT [PK__Snapshot__06F95075B156AFF5] PRIMARY KEY CLUSTERED  ([Listrak_SubscriptionsSK])
GO

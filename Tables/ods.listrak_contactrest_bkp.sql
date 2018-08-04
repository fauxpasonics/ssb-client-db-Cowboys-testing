CREATE TABLE [ods].[listrak_contactrest_bkp]
(
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailKey] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionState] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscribeDate] [datetime2] NULL,
[SubscribeMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeDate] [datetime2] NULL,
[UnsubscribeMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

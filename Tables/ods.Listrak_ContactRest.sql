CREATE TABLE [ods].[Listrak_ContactRest]
(
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailKey] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionState] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscribeDate] [datetime2] NULL,
[SubscribeMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeDate] [datetime] NULL,
[UnsubscribeMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__4F2BBED6] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__501FE30F] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__51140748] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__52082B81] DEFAULT (suser_sname())
)
GO
ALTER TABLE [ods].[Listrak_ContactRest] ADD CONSTRAINT [PK__Listrak___E7193C118455A35D] PRIMARY KEY CLUSTERED  ([ListID], [EmailAddress])
GO

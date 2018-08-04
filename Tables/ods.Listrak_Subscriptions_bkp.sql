CREATE TABLE [ods].[Listrak_Subscriptions_bkp]
(
[ListID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionDate] [datetime] NULL,
[AdditionMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__672BD31A] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__681FF753] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__69141B8C] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__6A083FC5] DEFAULT (suser_sname())
)
GO
ALTER TABLE [ods].[Listrak_Subscriptions_bkp] ADD CONSTRAINT [PK__Listrak___46454A3EB8715052] PRIMARY KEY CLUSTERED  ([ListID], [ContactID])
GO

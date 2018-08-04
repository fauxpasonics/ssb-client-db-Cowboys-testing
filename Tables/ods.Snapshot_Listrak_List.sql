CREATE TABLE [ods].[Snapshot_Listrak_List]
(
[Listrak_ContactListCollectionSK] [int] NOT NULL IDENTITY(1, 1),
[ListID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromEmail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableRemovalLink] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableBrowserLink] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bounceHandling] [int] NULL,
[EnableDoubleOptin] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableListHygiene] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowEmailList] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowAdvancedPersonalization] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceUnsubscribeCount] [int] NULL,
[DomainAliasLink] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DomainAliasEmail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableRSS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableGoogleAnalytics] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleTrackingDomains] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableInternationalization] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableDynamicContent] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableListRemoveHeader] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VmtaID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VmtaDescription] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_List] ADD CONSTRAINT [PK__Snapshot__5B0326720900E3F3] PRIMARY KEY CLUSTERED  ([Listrak_ContactListCollectionSK])
GO

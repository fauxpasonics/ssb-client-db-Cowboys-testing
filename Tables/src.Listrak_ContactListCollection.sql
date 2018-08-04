CREATE TABLE [src].[Listrak_ContactListCollection]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromEmail] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableRemovalLink] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableBrowserLink] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bounceHandling] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableDoubleOptin] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableListHygiene] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowEmailList] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShowAdvancedPersonalization] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceUnsubscribeCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DomainAliasLink] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DomainAliasEmail] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableRSS] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableGoogleAnalytics] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleTrackingDomains] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableInternationalization] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableDynamicContent] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnableListRemoveHeader] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VmtaDescription] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

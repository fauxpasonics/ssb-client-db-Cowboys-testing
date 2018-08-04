CREATE TABLE [src].[Listrak_ContactList]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_ListID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_ListName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_CreateDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_FromName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_FromEmail] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableRemovalLink] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableBrowserLink] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_bounceHandling] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableDoubleOptin] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableListHygiene] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_ShowEmailList] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_ShowAdvancedPersonalization] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_BounceUnsubscribeCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_DomainAliasLink] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_DomainAliasEmail] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableRSS] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableGoogleAnalytics] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_GoogleTrackingDomains] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableInternationalization] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableDynamicContent] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_EnableListRemoveHeader] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_AllData_Vmta_VmtaID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_AllData_Vmta_Description] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

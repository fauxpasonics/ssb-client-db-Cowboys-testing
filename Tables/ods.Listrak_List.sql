CREATE TABLE [ods].[Listrak_List]
(
[ListID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__1837881B] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__192BAC54] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__1A1FD08D] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__1B13F4C6] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_ListUpdate] ON [ods].[Listrak_List]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_List] t
	JOIN inserted i ON  t.[ListID] = i.[ListID]

INSERT INTO [ods].[Snapshot_Listrak_List] ([ListID],[ListName],[CreateDate],[FromName],[FromEmail],[EnableRemovalLink],[EnableBrowserLink],[bounceHandling],[EnableDoubleOptin],[EnableListHygiene],[ShowEmailList],[ShowAdvancedPersonalization],[BounceUnsubscribeCount],[DomainAliasLink],[DomainAliasEmail],[EnableRSS],[EnableGoogleAnalytics],[GoogleTrackingDomains],[EnableInternationalization],[EnableDynamicContent],[EnableListRemoveHeader],[VmtaID],[VmtaDescription],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,DATEADD(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_List] ADD CONSTRAINT [PK__Listrak___E3832865D4E3D4F1] PRIMARY KEY CLUSTERED  ([ListID])
GO

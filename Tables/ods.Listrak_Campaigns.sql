CREATE TABLE [ods].[Listrak_Campaigns]
(
[CampaignID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignMessageCount] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__35A9861F] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_C__369DAA58] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__3791CE91] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_C__ETL_U__3885F2CA] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_CampaignsUpdate] ON [ods].[Listrak_Campaigns]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_Campaigns] t
	JOIN inserted i ON  t.[CampaignID] = i.[CampaignID]

INSERT INTO [ods].[Snapshot_Listrak_Campaigns] ([CampaignID],[ListID],[CampaignName],[CampaignMessageCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,DATEADD(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_Campaigns] ADD CONSTRAINT [PK__Listrak___3F5E8D79F19AD16E] PRIMARY KEY CLUSTERED  ([CampaignID])
GO

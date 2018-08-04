CREATE TABLE [ods].[Snapshot_Listrak_Campaigns]
(
[Listrak_CampaignCollectionSK] [int] NOT NULL IDENTITY(1, 1),
[CampaignID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignMessageCount] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_Campaigns] ADD CONSTRAINT [PK__Snapshot__99618DC68B6CF0E1] PRIMARY KEY CLUSTERED  ([Listrak_CampaignCollectionSK])
GO

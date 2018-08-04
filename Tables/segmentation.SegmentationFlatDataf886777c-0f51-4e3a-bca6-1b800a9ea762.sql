CREATE TABLE [segmentation].[SegmentationFlatDataf886777c-0f51-4e3a-bca6-1b800a9ea762]
(
[id] [uniqueidentifier] NULL,
[DocumentType] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Distance_From_ATT_Stadium] [float] NULL,
[Distance_From_The_Star] [float] NULL,
[InListrak] [int] NULL,
[InCowboysFit] [int] NULL,
[InYouthCamps] [int] NULL,
[InCRM_Contact] [int] NULL,
[InFanManager] [int] NULL,
[InTM] [int] NULL,
[InCowboysClub] [int] NULL,
[InCowboysEntity] [int] NULL,
[InCRM_Account] [int] NULL,
[InCowboysFanClub] [int] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [ccix_SegmentationFlatDataf886777c-0f51-4e3a-bca6-1b800a9ea762] ON [segmentation].[SegmentationFlatDataf886777c-0f51-4e3a-bca6-1b800a9ea762]
GO

CREATE TABLE [segmentation].[SegmentationFlatDataede7554c-a4a5-405c-a8c5-695adc8f82c8]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
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
ALTER TABLE [segmentation].[SegmentationFlatDataede7554c-a4a5-405c-a8c5-695adc8f82c8] ADD CONSTRAINT [pk_SegmentationFlatDataede7554c-a4a5-405c-a8c5-695adc8f82c8] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDataede7554c-a4a5-405c-a8c5-695adc8f82c8] ON [segmentation].[SegmentationFlatDataede7554c-a4a5-405c-a8c5-695adc8f82c8] ([_rn])
GO

CREATE TABLE [segmentation].[SegmentationFlatData43e8773a-58c3-4dc3-86e6-88ecc586876b]
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
ALTER TABLE [segmentation].[SegmentationFlatData43e8773a-58c3-4dc3-86e6-88ecc586876b] ADD CONSTRAINT [pk_SegmentationFlatData43e8773a-58c3-4dc3-86e6-88ecc586876b] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData43e8773a-58c3-4dc3-86e6-88ecc586876b] ON [segmentation].[SegmentationFlatData43e8773a-58c3-4dc3-86e6-88ecc586876b] ([_rn])
GO

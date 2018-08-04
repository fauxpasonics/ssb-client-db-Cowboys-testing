CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimClientTypes]
(
[dctLocalId] [int] NOT NULL,
[dctGuid] [uniqueidentifier] NOT NULL,
[dctHolderCompanyId] [int] NOT NULL,
[dctIssuerCompanyId] [int] NULL,
[dctName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dctDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dctOrdinal] [int] NOT NULL,
[dctIsActive] [bit] NOT NULL,
[dctOrganizationUnitId] [uniqueidentifier] NULL,
[dctAclSchemeId] [int] NULL,
[dctVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimClientTypes] ADD CONSTRAINT [PK__Sync_tem__19364FD2D7505C45] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

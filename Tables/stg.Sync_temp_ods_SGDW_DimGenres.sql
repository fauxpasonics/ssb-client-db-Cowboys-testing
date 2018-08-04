CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimGenres]
(
[dgLocalId] [int] NOT NULL,
[dgGuid] [uniqueidentifier] NOT NULL,
[dgHolderCompanyId] [int] NOT NULL,
[dgIssuerCompanyId] [int] NOT NULL,
[dgDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dgAclSchemeId] [int] NULL,
[dgOrganizationUnitGuid] [uniqueidentifier] NULL,
[dgVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimGenres] ADD CONSTRAINT [PK__Sync_tem__19364FD264DE98CA] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

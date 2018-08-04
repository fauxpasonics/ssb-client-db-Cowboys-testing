CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceTypeGroups]
(
[dptgLocalId] [int] NOT NULL,
[dptgIssuerCompanyId] [int] NULL,
[dptgHolderCompanyId] [int] NOT NULL,
[dptgName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dptgOrdinal] [int] NULL,
[dptgGuid] [uniqueidentifier] NULL,
[dptgOrganizationUnitId] [uniqueidentifier] NULL,
[dptgShowInPrimaryPanel] [bit] NULL,
[dptgIsActive] [bit] NULL,
[dptgAclSchemeId] [int] NULL,
[dptgVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceTypeGroups] ADD CONSTRAINT [PK__Sync_tem__19364FD22CA60509] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

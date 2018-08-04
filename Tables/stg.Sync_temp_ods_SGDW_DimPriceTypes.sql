CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceTypes]
(
[dptLocalId] [int] NOT NULL,
[dptHoldercompanyId] [int] NOT NULL,
[dptIssuerCompanyId] [int] NOT NULL,
[dptPriceTypeGUID] [uniqueidentifier] NOT NULL,
[dptPriceTypeName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dptPriceTypeGroupId] [uniqueidentifier] NULL,
[dptOrganizationUnitId] [uniqueidentifier] NULL,
[dptAclSchemeId] [int] NULL,
[dptIsActive] [bit] NULL,
[dptVisibleBySubordinates] [bit] NOT NULL,
[dptShortName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceTypes] ADD CONSTRAINT [PK__Sync_tem__19364FD24AE466EE] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

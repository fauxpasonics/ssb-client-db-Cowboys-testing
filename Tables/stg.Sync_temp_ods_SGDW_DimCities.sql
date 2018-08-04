CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimCities]
(
[dctLocalId] [int] NOT NULL,
[dctId] [uniqueidentifier] NOT NULL,
[dctHolderCompanyId] [int] NOT NULL,
[dctIssuerCompanyId] [int] NULL,
[dctGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dctCountryId] [uniqueidentifier] NULL,
[dctStateId] [uniqueidentifier] NULL,
[dctIsApproved] [bit] NOT NULL,
[dctIsActive] [bit] NOT NULL,
[dctOrganizationUnitGuid] [uniqueidentifier] NULL,
[dctVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimCities] ADD CONSTRAINT [PK__Sync_tem__19364FD2B1E2462D] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

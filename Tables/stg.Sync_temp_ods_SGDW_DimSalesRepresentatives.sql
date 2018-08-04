CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSalesRepresentatives]
(
[dsrLocalId] [int] NOT NULL,
[dsrGuid] [uniqueidentifier] NOT NULL,
[dsrHolderCompanyId] [int] NOT NULL,
[dsrIssuerCompanyId] [int] NOT NULL,
[dsrCustomerGuid] [uniqueidentifier] NOT NULL,
[dsrTypeEnum] [int] NOT NULL,
[dsrIsActive] [bit] NOT NULL,
[dsrOrganizationUnitGuid] [uniqueidentifier] NOT NULL,
[dsrVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSalesRepresentatives] ADD CONSTRAINT [PK__Sync_tem__19364FD2757C00C3] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

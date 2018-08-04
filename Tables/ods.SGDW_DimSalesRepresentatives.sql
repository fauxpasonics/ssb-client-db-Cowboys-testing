CREATE TABLE [ods].[SGDW_DimSalesRepresentatives]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSalesRepresentatives] ON [ods].[SGDW_DimSalesRepresentatives]
GO

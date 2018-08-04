CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimCoupons]
(
[dcLocalId] [int] NOT NULL,
[dcHolderCompanyId] [int] NOT NULL,
[dcIssuerCompanyId] [int] NULL,
[dcGuid] [uniqueidentifier] NOT NULL,
[dcName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dcDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcValidFrom] [datetime] NULL,
[dcValidTo] [datetime] NULL,
[dcIdentityTypeEnum] [int] NULL,
[dcRedemptionQuantity] [int] NULL,
[dcIsActive] [bit] NOT NULL,
[dcOrganizationUnitGuid] [uniqueidentifier] NULL,
[dcLedgerGuid] [uniqueidentifier] NULL,
[dcProjectIdentifierGuid] [uniqueidentifier] NULL,
[dcAclSchemeId] [int] NULL,
[dcRedemptionQuantityPerTransaction] [int] NULL,
[dcVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimCoupons] ADD CONSTRAINT [PK__Sync_tem__19364FD2FB057D68] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

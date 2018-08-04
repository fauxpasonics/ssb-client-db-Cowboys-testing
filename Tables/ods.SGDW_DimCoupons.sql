CREATE TABLE [ods].[SGDW_DimCoupons]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimCoupons] ON [ods].[SGDW_DimCoupons]
GO

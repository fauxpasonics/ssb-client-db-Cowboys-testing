CREATE TABLE [ods].[SGDW_DimShowTypes]
(
[dstLocalId] [int] NOT NULL,
[dstHolderCompanyId] [int] NOT NULL,
[dstIssuerCompanyId] [int] NOT NULL,
[dstGuid] [uniqueidentifier] NOT NULL,
[dstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dstIsActive] [bit] NOT NULL,
[dstLedgerGuid] [uniqueidentifier] NULL,
[dstProjectIdentifierGuid] [uniqueidentifier] NULL,
[dstOrganizationUnitGuid] [uniqueidentifier] NULL,
[dstAclSchemeId] [int] NULL,
[dstVisibleBySubordinates] [bit] NOT NULL,
[dstPromoterPriceListIdForRegularTickets] [uniqueidentifier] NULL,
[dstPromoterPriceListIdForSubsTickets] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimShowTypes] ON [ods].[SGDW_DimShowTypes]
GO

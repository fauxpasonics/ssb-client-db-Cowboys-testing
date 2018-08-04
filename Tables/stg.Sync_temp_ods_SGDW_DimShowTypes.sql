CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimShowTypes]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimShowTypes] ADD CONSTRAINT [PK__Sync_tem__19364FD205E18B0F] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

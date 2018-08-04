CREATE TABLE [ods].[SGDW_DimSalesRepGoals]
(
[dsrgLocalId] [int] NOT NULL,
[dsrgHolderCompanyId] [int] NOT NULL,
[dsrgGuid] [uniqueidentifier] NOT NULL,
[dsrgIssuerCompanyId] [int] NOT NULL,
[dsrgSalesRepGuid] [uniqueidentifier] NOT NULL,
[dsrgTargetAmount] [money] NULL,
[dsrgCampaignGuid] [uniqueidentifier] NULL,
[dsrgAppealGuid] [uniqueidentifier] NULL,
[dsrgFundGuid] [uniqueidentifier] NULL,
[dsrgFromDate] [date] NULL,
[dsrgToDate] [date] NULL,
[dsrgNote] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsrgAssociatedClientGuid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [ods].[SGDW_DimSalesRepGoals] ADD CONSTRAINT [pk_DimSalesRepGoals_c_LocalId#HolderCompanyId] PRIMARY KEY CLUSTERED  ([dsrgLocalId], [dsrgHolderCompanyId])
GO

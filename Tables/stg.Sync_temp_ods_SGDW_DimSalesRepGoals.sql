CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSalesRepGoals]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSalesRepGoals] ADD CONSTRAINT [PK__Sync_tem__19364FD2D81F612A] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

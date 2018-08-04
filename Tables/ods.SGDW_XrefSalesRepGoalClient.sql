CREATE TABLE [ods].[SGDW_XrefSalesRepGoalClient]
(
[xsgcLocalId] [int] NOT NULL,
[xsgcHolderCompanyId] [int] NOT NULL,
[xsgcGuid] [uniqueidentifier] NOT NULL,
[xsgcClientGuid] [uniqueidentifier] NOT NULL,
[xsgcSalesRepGoalGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [ods].[SGDW_XrefSalesRepGoalClient] ADD CONSTRAINT [pk_XrefSalesRepGoalClient_c_LocalId#HolderCompanyId] PRIMARY KEY CLUSTERED  ([xsgcLocalId], [xsgcHolderCompanyId])
GO

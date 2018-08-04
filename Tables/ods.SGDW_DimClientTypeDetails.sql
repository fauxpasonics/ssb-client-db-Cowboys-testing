CREATE TABLE [ods].[SGDW_DimClientTypeDetails]
(
[dctdLocalId] [int] NOT NULL,
[dctdGuid] [uniqueidentifier] NOT NULL,
[dctdHolderCompanyId] [int] NOT NULL,
[dctdIssuerCompanyId] [int] NULL,
[dctdClientGuid] [uniqueidentifier] NOT NULL,
[dctdTypeGuid] [uniqueidentifier] NOT NULL,
[dctdValidFromDate] [datetime] NULL,
[dctdValidToDate] [datetime] NULL,
[dctdIsDynamic] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimClientTypeDetails] ON [ods].[SGDW_DimClientTypeDetails]
GO

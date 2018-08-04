CREATE TABLE [ods].[SGDW_DimShowGenres]
(
[dsgLocalId] [int] NOT NULL,
[dsgHolderCompanyId] [int] NOT NULL,
[dsgIssuerCompanyId] [int] NULL,
[dsgGuid] [uniqueidentifier] NOT NULL,
[dsgShowGuid] [uniqueidentifier] NULL,
[dsgGenereGuid] [uniqueidentifier] NULL,
[dsgIsRecommended] [bit] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimShowGenres] ON [ods].[SGDW_DimShowGenres]
GO

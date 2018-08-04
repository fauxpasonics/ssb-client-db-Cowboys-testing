CREATE TABLE [ods].[SGDW_XrefSeriesEvents]
(
[xseLocalId] [int] NOT NULL,
[xseGuid] [uniqueidentifier] NOT NULL,
[xseHolderCompanyId] [int] NOT NULL,
[xseEventGuid] [uniqueidentifier] NOT NULL,
[xseSeriesGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_XrefSeriesEvents] ON [ods].[SGDW_XrefSeriesEvents]
GO

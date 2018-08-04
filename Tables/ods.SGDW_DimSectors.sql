CREATE TABLE [ods].[SGDW_DimSectors]
(
[dscLocalId] [int] NOT NULL,
[dscHolderCompanyId] [int] NOT NULL,
[dscGuid] [uniqueidentifier] NOT NULL,
[dscName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dscAreaMapGuid] [uniqueidentifier] NULL,
[dscContinuedBySectorGuid] [uniqueidentifier] NULL,
[dscMaxUnreservedSeats] [int] NULL,
[dscOrdinal] [int] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSectors] ON [ods].[SGDW_DimSectors]
GO

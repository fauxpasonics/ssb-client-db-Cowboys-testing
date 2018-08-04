CREATE TABLE [ods].[SGDW_DimSeatsInfo]
(
[dsiLocalId] [int] NOT NULL,
[dsiHolderCompanyId] [int] NOT NULL,
[dsiGuid] [uniqueidentifier] NOT NULL,
[dsiAreaMapGuid] [uniqueidentifier] NOT NULL,
[dsiSeatIdInAreaMap] [int] NOT NULL,
[dsiSeatName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dsiRowName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dsiSectorName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dsiSeatOrdinal] [int] NOT NULL,
[dsiRowOrdinal] [int] NOT NULL,
[dsiSectorOrdinal] [int] NOT NULL,
[dsiSectorGuid] [uniqueidentifier] NOT NULL,
[dsiSeatCustom1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsiSeatCustom2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsiSeatCustom3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsiSeatCustom4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSeatsInfo] ON [ods].[SGDW_DimSeatsInfo]
GO

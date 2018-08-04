CREATE TABLE [stg].[SWAP__SGDW_DimHallVersionsAreaMaps]
(
[dhaLocalId] [int] NOT NULL,
[dhaHolderCompanyId] [int] NOT NULL,
[dhaIssuerCompanyId] [int] NULL,
[dhaGuid] [uniqueidentifier] NOT NULL,
[dhaHallVersionGuid] [uniqueidentifier] NULL,
[dhaAreaMapGuid] [uniqueidentifier] NULL,
[dhaAreaGuid] [uniqueidentifier] NULL,
[dhaSeatingTypeEnum] [int] NULL,
[dhaName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dhaGACapacity] [int] NULL,
[dhaGAPriceLevelGuid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimHallVersionsAreaMaps] ON [stg].[SWAP__SGDW_DimHallVersionsAreaMaps]
GO

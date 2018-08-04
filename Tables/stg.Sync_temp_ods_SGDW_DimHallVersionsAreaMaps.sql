CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimHallVersionsAreaMaps]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimHallVersionsAreaMaps] ADD CONSTRAINT [PK__Sync_tem__19364FD25DCFB776] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

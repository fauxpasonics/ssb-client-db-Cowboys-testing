CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSeatsInfo_Event_New]
(
[dsieLocalId] [int] NOT NULL,
[dsieHolderCompanyId] [int] NOT NULL,
[dsieAreaMapGuid] [uniqueidentifier] NULL,
[dsieSeatIdInAreaMap] [int] NULL,
[dsiePriceLevelGuid] [uniqueidentifier] NULL,
[dsieEventGuid] [uniqueidentifier] NULL,
[dsieAreaGuid] [uniqueidentifier] NOT NULL,
[dsieCapacity] [int] NULL,
[dsieIsGA] [bit] NULL,
[dsieGAHeaderRow] [bit] NULL,
[dsiePrivateProperty] [bit] NULL,
[dsieLockGuid] [uniqueidentifier] NULL,
[dsieLocked] [int] NULL,
[dsieSold] [int] NULL,
[dsieReserved] [int] NULL,
[dsieSubs] [int] NULL,
[dsieIsCountWithAvailableSeats] [bit] NULL,
[dsieOccupyChairs] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSeatsInfo_Event_New] ADD CONSTRAINT [PK__Sync_tem__19364FD20F3191BE] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

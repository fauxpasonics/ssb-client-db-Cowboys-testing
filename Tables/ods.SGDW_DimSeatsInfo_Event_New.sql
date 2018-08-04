CREATE TABLE [ods].[SGDW_DimSeatsInfo_Event_New]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSeatsInfo_Event_New] ON [ods].[SGDW_DimSeatsInfo_Event_New]
GO

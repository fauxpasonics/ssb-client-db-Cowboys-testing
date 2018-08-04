CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSectors]
(
[dscLocalId] [int] NOT NULL,
[dscHolderCompanyId] [int] NOT NULL,
[dscGuid] [uniqueidentifier] NOT NULL,
[dscName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dscAreaMapGuid] [uniqueidentifier] NULL,
[dscContinuedBySectorGuid] [uniqueidentifier] NULL,
[dscMaxUnreservedSeats] [int] NULL,
[dscOrdinal] [int] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSectors] ADD CONSTRAINT [PK__Sync_tem__19364FD27A262F5E] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

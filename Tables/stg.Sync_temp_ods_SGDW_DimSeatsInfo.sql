CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSeatsInfo]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSeatsInfo] ADD CONSTRAINT [PK__Sync_tem__19364FD27757E5F4] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

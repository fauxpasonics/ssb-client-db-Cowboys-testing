CREATE TABLE [stg].[Sync_temp_ods_SGDW_XrefSeriesEvents]
(
[xseLocalId] [int] NOT NULL,
[xseGuid] [uniqueidentifier] NOT NULL,
[xseHolderCompanyId] [int] NOT NULL,
[xseEventGuid] [uniqueidentifier] NOT NULL,
[xseSeriesGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_XrefSeriesEvents] ADD CONSTRAINT [PK__Sync_tem__19364FD22A08206C] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

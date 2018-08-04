CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimAreaMaps]
(
[damLocalId] [int] NOT NULL,
[damHolderCompanyId] [int] NOT NULL,
[damGuid] [uniqueidentifier] NOT NULL,
[damName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[damAreaGuid] [uniqueidentifier] NULL,
[damCapacity] [int] NULL,
[damSeatIds] [varbinary] (1) NULL,
[damSeatCustomProperty1] [varbinary] (1) NULL,
[damSeatCustomProperty2] [varbinary] (1) NULL,
[damSeatCustomProperty3] [varbinary] (1) NULL,
[damSeatCustomProperty4] [varbinary] (1) NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimAreaMaps] ADD CONSTRAINT [PK__Sync_tem__19364FD28A1ABB91] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

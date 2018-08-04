CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceModifiersTypeEnum]
(
[dpmteLocalId] [int] NOT NULL,
[dpmteGuid] [uniqueidentifier] NOT NULL,
[dpmteEnumValue] [int] NOT NULL,
[dpmteDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceModifiersTypeEnum] ADD CONSTRAINT [PK__Sync_tem__19364FD251BACC21] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

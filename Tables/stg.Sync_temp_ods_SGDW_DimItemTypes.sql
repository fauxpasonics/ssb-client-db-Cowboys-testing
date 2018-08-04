CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimItemTypes]
(
[ditLocalId] [int] NOT NULL,
[ditGuid] [uniqueidentifier] NOT NULL,
[ditHolderCompanyId] [int] NOT NULL,
[ditNumber] [int] NULL,
[ditName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ditDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimItemTypes] ADD CONSTRAINT [PK__Sync_tem__19364FD23B4B80C1] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

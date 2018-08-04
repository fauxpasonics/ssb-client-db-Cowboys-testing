CREATE TABLE [stg].[Sync_temp_ods_SGDW_ListsAndEnums]
(
[lnmGUID] [uniqueidentifier] NOT NULL,
[lnmLocalId] [int] NOT NULL,
[lnmHolderCompanyId] [int] NOT NULL,
[lnmIssuerCompanyId] [int] NOT NULL,
[lnmKey] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lnmItemName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lnmItemValue] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lnmItemCaptionId] [int] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_ListsAndEnums] ADD CONSTRAINT [PK__Sync_tem__19364FD2BF9E96F5] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

CREATE TABLE [ods].[SGDW_ListsAndEnums]
(
[lnmGUID] [uniqueidentifier] NOT NULL,
[lnmLocalId] [int] NOT NULL,
[lnmHolderCompanyId] [int] NOT NULL,
[lnmIssuerCompanyId] [int] NOT NULL,
[lnmKey] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lnmItemName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lnmItemValue] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lnmItemCaptionId] [int] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_ListsAndEnums] ON [ods].[SGDW_ListsAndEnums]
GO

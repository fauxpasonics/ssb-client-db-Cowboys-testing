CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimShowGenres]
(
[dsgLocalId] [int] NOT NULL,
[dsgHolderCompanyId] [int] NOT NULL,
[dsgIssuerCompanyId] [int] NULL,
[dsgGuid] [uniqueidentifier] NOT NULL,
[dsgShowGuid] [uniqueidentifier] NULL,
[dsgGenereGuid] [uniqueidentifier] NULL,
[dsgIsRecommended] [bit] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimShowGenres] ADD CONSTRAINT [PK__Sync_tem__19364FD29128F058] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

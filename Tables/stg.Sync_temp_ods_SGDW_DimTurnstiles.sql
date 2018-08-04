CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimTurnstiles]
(
[dtsLocalId] [int] NOT NULL,
[dtsGuid] [uniqueidentifier] NOT NULL,
[dtsHolderCompanyId] [int] NOT NULL,
[dtsIssuerCompanyId] [int] NULL,
[dtsName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtsPrintedName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtsDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtsHallGuid] [uniqueidentifier] NULL,
[dtsHallVersionGuid] [uniqueidentifier] NULL,
[dtsParentRecordGuid] [uniqueidentifier] NULL,
[dtsIsActive] [bit] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimTurnstiles] ADD CONSTRAINT [PK__Sync_tem__19364FD2D04DE6F0] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

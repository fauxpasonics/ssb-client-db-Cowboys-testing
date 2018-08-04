CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimGates]
(
[dgtLocalId] [int] NOT NULL,
[dgtHolderCompanyId] [int] NOT NULL,
[dgtIssuerCompanyId] [int] NULL,
[dgtGuid] [uniqueidentifier] NOT NULL,
[dgtExternalReference] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtPrintedName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtHallGuid] [uniqueidentifier] NULL,
[dgtHallVersionGuid] [uniqueidentifier] NULL,
[dgtParentRecordGuid] [uniqueidentifier] NULL,
[dgtIsActive] [bit] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimGates] ADD CONSTRAINT [PK__Sync_tem__19364FD27E6370C1] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

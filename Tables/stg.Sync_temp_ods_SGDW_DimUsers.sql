CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimUsers]
(
[dusHolderCompanyId] [int] NOT NULL,
[dusIssuerCompanyId] [int] NOT NULL,
[dusUserGUID] [uniqueidentifier] NOT NULL,
[dusUserName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dusIsAllowToChangeTill] [bit] NOT NULL,
[dusIsAllowToCloseTill] [bit] NOT NULL,
[dusIsActive] [bit] NOT NULL,
[dusLocalId] [int] NOT NULL,
[dusSecurityTokenId] [uniqueidentifier] NULL,
[dusOrganizationUnitId] [uniqueidentifier] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimUsers] ADD CONSTRAINT [PK__Sync_tem__19364FD2714DEBFD] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

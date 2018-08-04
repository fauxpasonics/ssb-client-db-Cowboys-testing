CREATE TABLE [ods].[SGDW_DimUsers]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimUsers] ON [ods].[SGDW_DimUsers]
GO

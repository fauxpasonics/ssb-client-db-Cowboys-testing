CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPaymentMethods]
(
[dpmLocalId] [int] NOT NULL,
[dpmHolderCompanyId] [int] NOT NULL,
[dpmIssuerCompanyId] [int] NULL,
[dpmGuid] [uniqueidentifier] NOT NULL,
[dpmName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dpmLedgerGuid] [uniqueidentifier] NULL,
[dpmTypeEnum] [int] NULL,
[dpmSystemName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dpmOrganizationUnitGuid] [uniqueidentifier] NULL,
[dpmVisibleBySubordinates] [bit] NOT NULL,
[dpmProjectIdentifierGuid] [uniqueidentifier] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPaymentMethods] ADD CONSTRAINT [PK__Sync_tem__19364FD269E49EC2] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

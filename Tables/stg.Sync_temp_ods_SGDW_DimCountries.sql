CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimCountries]
(
[dcnLocalId] [int] NOT NULL,
[dcnGuid] [uniqueidentifier] NOT NULL,
[dcnHolderCompanyId] [int] NOT NULL,
[dcnIssuerCompanyId] [int] NULL,
[dcnName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dcnIsActive] [bit] NOT NULL,
[dcnOrder] [int] NOT NULL,
[dcnProviderComponentName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcnIBANCountryGuid] [uniqueidentifier] NULL,
[dcnOrganizationUnitGuid] [uniqueidentifier] NULL,
[dcnVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimCountries] ADD CONSTRAINT [PK__Sync_tem__19364FD210164650] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

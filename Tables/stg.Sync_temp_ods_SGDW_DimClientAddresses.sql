CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimClientAddresses]
(
[dcaLocalId] [int] NOT NULL,
[dcaHolderCompanyId] [int] NOT NULL,
[dcaGuid] [uniqueidentifier] NOT NULL,
[dcaClientGuid] [uniqueidentifier] NOT NULL,
[dcaAddressTypeGuid] [uniqueidentifier] NOT NULL,
[dcaPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaCityGuid] [uniqueidentifier] NULL,
[dcaCityGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaCountryGuid] [uniqueidentifier] NULL,
[dcaStateGuid] [uniqueidentifier] NULL,
[dcaRegionGuid] [uniqueidentifier] NULL,
[dcaZip] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaTrimZip] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaAddressLine1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaAddressLine2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaAddressLine3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaAddressLine4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaAddressLine5] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaNote] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcaValidFrom] [datetime] NULL,
[dcaValidTo] [datetime] NULL,
[dcaIsPrimary] [bit] NOT NULL,
[dcaPostalAddressGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimClientAddresses] ADD CONSTRAINT [PK__Sync_tem__19364FD263DE1C2A] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

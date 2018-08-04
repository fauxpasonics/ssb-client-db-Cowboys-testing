CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimRestrictions]
(
[drLocalId] [int] NOT NULL,
[drGUID] [uniqueidentifier] NOT NULL,
[drHolderCompanyId] [int] NOT NULL,
[drIssuerCompanyId] [int] NOT NULL,
[drRestrictionType] [int] NOT NULL,
[drRestrictionDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[drExclusive] [bit] NOT NULL,
[drCountWithAvailableSeats] [bit] NULL,
[drOrganizationUnitGuid] [uniqueidentifier] NULL,
[drVisibleBySubordinates] [bit] NOT NULL,
[drExcludeLockFromCapacity] [bit] NULL,
[drRestrictionGroupGuid] [uniqueidentifier] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimRestrictions] ADD CONSTRAINT [PK__Sync_tem__19364FD21BC0A1B1] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO

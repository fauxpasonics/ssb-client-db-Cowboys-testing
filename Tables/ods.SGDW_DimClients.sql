CREATE TABLE [ods].[SGDW_DimClients]
(
[dcHolderCompanyId] [int] NOT NULL,
[dcLocalId] [int] NOT NULL,
[dcIssuerCompanyId] [int] NOT NULL,
[dcClientGUID] [uniqueidentifier] NOT NULL,
[dcIsActive] [bit] NULL,
[dcIsAccount] [bit] NULL,
[dcIsHidden] [bit] NULL,
[dcClientCode] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcJoinDate] [datetime] NULL,
[dcDeactivateDate] [datetime] NULL,
[dcSpouseName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcFirstName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcLastName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcMiddleName] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcSuffix] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcIdCardNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcGenderEnum] [int] NULL,
[dcMarialStatusGuid] [uniqueidentifier] NULL,
[dcBirthday] [datetime] NULL,
[dcDemographicGuid] [uniqueidentifier] NULL,
[dcExemptValidUntil] [datetime] NULL,
[dcNote] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcTitleGuid] [uniqueidentifier] NULL,
[dcJobTitleGuid] [uniqueidentifier] NULL,
[dcCountryGuid] [uniqueidentifier] NULL,
[dcStateGuid] [uniqueidentifier] NULL,
[dcRegionGuid] [uniqueidentifier] NULL,
[dcCityGuid] [uniqueidentifier] NULL,
[dcCityGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcZipCode] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcAddressLine1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcAddressLine2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcAddressLine3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcAddressLine4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcAddressLine5] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcHomeAddr] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcHomePhone] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcBusinessPhone] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcMobilePhone] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcFax] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcEmail] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcWebSite] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcNamePrefix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcWorkPlace] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcInitials] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcPreferedName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcPreferredCultureId] [uniqueidentifier] NULL,
[dcUserLogin] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcIsGroupLeader] [bit] NULL,
[dcGroupLeaderGuid] [uniqueidentifier] NULL,
[dcIsDeceased] [bit] NULL,
[dcDateOfDeath] [datetime] NULL,
[dcContactDetails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcOrganizationUnitId] [uniqueidentifier] NULL,
[dcVatRegistrationNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcTaxExemptNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcLastUpdateDateTime] [datetime] NULL,
[dcLedgerGuid] [uniqueidentifier] NULL,
[dcExternalId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcAge] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimClients] ON [ods].[SGDW_DimClients]
GO

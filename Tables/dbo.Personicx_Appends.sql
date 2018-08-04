CREATE TABLE [dbo].[Personicx_Appends]
(
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailPrimary] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhonePrimary] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryStreet] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimarySuite] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryZip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCounty] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonicxLifestageClusterCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonicxLifeStageGroupsCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessOwner] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOHOIndicator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomeOwnerRenter] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PresenceOfChildren] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HealthEnthusiastRank] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SportsEnthusiastRank] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SourceFileName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedDate] [datetime] NULL,
[ETL__UpdatedDate] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO

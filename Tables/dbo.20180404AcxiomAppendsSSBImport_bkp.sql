CREATE TABLE [dbo].[20180404AcxiomAppendsSSBImport_bkp]
(
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRST_NAME] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_NAME] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS1] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS2] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZIP] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTY] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Business_Owner] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Race] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOHO] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NetWorth] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personicx_Lifestage_Cluster_Code] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personicx_Lifestage_Group_Code] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Presence_of_Children] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HHLD_Income] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health Enthusiast_Rank] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sports_Enthusiast_Rank] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConcertGoers] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TravelSpend] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[ListName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DynamicData] [xml] NULL
)
GO

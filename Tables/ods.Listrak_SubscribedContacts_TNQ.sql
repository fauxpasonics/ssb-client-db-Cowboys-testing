CREATE TABLE [ods].[Listrak_SubscribedContacts_TNQ]
(
[Email] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subscribe Date (UTC-05)] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Method] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name First Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name Last Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unsubscribe Date] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedDate] [datetime] NULL CONSTRAINT [DF__Listrak_S__ETL____03B26573] DEFAULT (getdate())
)
GO

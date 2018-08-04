CREATE TABLE [ods].[Listrak_SubscribedContacts_SCAProgram]
(
[Email] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subscribe Date (UTC-05)] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Method] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShopperInfo Phone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShopperInfo Zip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShopperInfo LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShopperInfo FirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unsubscribe Date] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedDate] [datetime] NULL CONSTRAINT [DF__Listrak_S__ETL____0782F657] DEFAULT (getdate())
)
GO

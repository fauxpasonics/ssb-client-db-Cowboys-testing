CREATE TABLE [etl].[Listrak_MessageActivityRest_loading]
(
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Abuse] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivityDate] [datetime2] NULL,
[Bounce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceReason] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClickCount] [int] NULL,
[EmailAddress] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Open] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderTotal] [decimal] (18, 6) NULL,
[Read] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime2] NULL,
[Unsubscribe] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisitDate] [datetime2] NULL
)
GO

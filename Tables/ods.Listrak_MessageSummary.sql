CREATE TABLE [ods].[Listrak_MessageSummary]
(
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subject] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime] NOT NULL,
[DeliverCount] [int] NULL,
[RemoveCount] [int] NULL,
[RemovePercent] [decimal] (18, 6) NULL,
[OpenCount] [int] NULL,
[OpenPercent] [decimal] (18, 6) NULL,
[ReadCount] [int] NULL,
[ReadPercent] [decimal] (18, 6) NULL,
[ClickCount] [int] NULL,
[ClickerCount] [int] NULL,
[RepeatClickerCount] [int] NULL,
[NewClickerCount] [int] NULL,
[ClickerPercent] [decimal] (18, 6) NULL,
[OrderTotal] [decimal] (18, 6) NULL,
[ConversionCount] [int] NULL,
[AverageOrderValue] [decimal] (18, 6) NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__11371B7F] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_C__122B3FB8] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__131F63F1] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_R__ETL_U__1413882A] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_MessageSummaryUpdate] ON [ods].[Listrak_MessageSummary]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_MessageSummary] t
	JOIN inserted i ON  t.[ListID] = i.[ListID] AND t.[MessageID] = i.[MessageID] AND t.[SendDate] = i.[SendDate]

INSERT INTO [ods].[Snapshot_Listrak_MessageSummary] ([ListID],[MessageID],[Subject],[SendDate],[DeliverCount],[RemoveCount],[RemovePercent],[OpenCount],[OpenPercent],[ReadCount],[ReadPercent],[ClickCount],[ClickerCount],[RepeatClickerCount],[NewClickerCount],[ClickerPercent],[OrderTotal],[ConversionCount],[AverageOrderValue],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,DATEADD(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_MessageSummary] ADD CONSTRAINT [PK__Listrak___60F2333419FB781E] PRIMARY KEY CLUSTERED  ([ListID], [MessageID], [SendDate])
GO

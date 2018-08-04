CREATE TABLE [tmarc].[WRK_TM_PaySchedulePayment]
(
[payment_Schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[due_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percent_due] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__ID] [int] NOT NULL,
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArcYear] [int] NULL,
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RowRank] [bigint] NULL
)
GO

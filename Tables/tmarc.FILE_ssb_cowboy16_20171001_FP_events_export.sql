CREATE TABLE [tmarc].[FILE_ssb_cowboy16_20171001_FP_events_export]
(
[event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_time] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_day] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Team] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_abv] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_report_group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Enabled] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Returnable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Min_events] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total_events] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FSE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dsps_allowed] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[exchange_price_opt] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_name_long] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tm_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Game_Number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Barcode_Status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print_Ticket_Ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Add_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Upd_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaxEventDate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Arena_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Major_Category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Minor_Category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Org_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLAN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[season_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy16_20171001_FP_events_export] ON [tmarc].[FILE_ssb_cowboy16_20171001_FP_events_export]
GO

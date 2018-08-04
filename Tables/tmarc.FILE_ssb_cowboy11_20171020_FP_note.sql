CREATE TABLE [tmarc].[FILE_ssb_cowboy11_20171020_FP_note]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[note_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[note_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[priority] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TEXT] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reminder_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subcategory_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subject] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[response_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_status_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_status] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[alert_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[alert_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[icon_file_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_user_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_owner_on_chg] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[duration] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_datetime] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[end_datetime] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[all_day_event] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[show_time_as] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[added_to_outlook] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_type_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[assigned_to_user_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_stage_seq_num] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_activity_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_result_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_stage_status_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_activity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_result] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_stage_status] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_assigned_to_user_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_assigned_to_dept_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_dept_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_assignee_notified] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_duration] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_stage_text] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_start_date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_end_date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_probability_to_close] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[task_probability_to_close_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[org_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[org_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TeamName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[action] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[export_datetime] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[FILE_ssb_cowboy11_20171020_FP_note] ADD CONSTRAINT [PK__FILE_ssb__C4EA2445AFCFDE0D] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
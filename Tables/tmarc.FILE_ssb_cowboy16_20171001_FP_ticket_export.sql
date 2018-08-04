CREATE TABLE [tmarc].[FILE_ssb_cowboy16_20171001_FP_ticket_export]
(
[event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[num_seats] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[block_purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item_seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[info] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total_events] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricing_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comp_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comp_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[disc_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[disc_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surchg_code_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surchg_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_flag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[class_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sell_location] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[full_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sales_source_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sales_source_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ticket_Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_code_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_Seat] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_9] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_10] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_Rep_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_full_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tran_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[promo_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_ticket_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_qualifiers] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paid_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owed_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[renewal_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[return_reason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[return_reason_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[expanded] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_method_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_instructions] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_name_first] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_addr1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_addr2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_addr3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_zip_formatted] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_phone_formatted] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivered_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_sales_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ledger_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_ticket] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_tax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_licfee] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate_a] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate_b] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate_c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[orig_acct_rep_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_system_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_acct_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_acct_add_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_mask] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_price_level] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_face_value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_face_value_tax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_facility_fee] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_service_charge] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_service_charge_tax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[retail_distance_charge] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[return_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_type_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contract_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy16_20171001_FP_ticket_export] ON [tmarc].[FILE_ssb_cowboy16_20171001_FP_ticket_export]
GO

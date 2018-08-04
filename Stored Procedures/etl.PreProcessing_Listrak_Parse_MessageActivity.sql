SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*****	Revision History

DCH 2018-06-25	-	initial sproc creation. 


*****/


CREATE PROC [etl].[PreProcessing_Listrak_Parse_MessageActivity]
AS
BEGIN

	truncate table etl.Listrak_MessageActivityRest_loading;

	truncate table etl.Listrak_MessageActivityRest_working;

	insert etl.Listrak_MessageActivityRest_working (ETL__session_id, ETL__insert_datetime, ETL__multi_query_value_for_audit, json_payload, IsLoaded, ID)
	select ETL__session_id, ETL__insert_datetime, ETL__multi_query_value_for_audit, json_payload, IsLoaded, ID
	from stg.Listrak_MessageActivityRest (nolock)
	where IsLoaded = 0;

	
END


GO

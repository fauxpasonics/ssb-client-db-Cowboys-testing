SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****	Revision History

DCH 2018-06-25	-	initial sproc creation. 


*****/


CREATE PROC [etl].[PostProcessing_Listrak_Parse_MessageActivity]
AS
BEGIN


	update a
	set a.IsLoaded = 1
	from stg.Listrak_MessageActivityRest a
	join etl.Listrak_MessageActivityRest_working b
		on a.ID = b.ID
		and a.IsLoaded = 0;
	
	
END

GO

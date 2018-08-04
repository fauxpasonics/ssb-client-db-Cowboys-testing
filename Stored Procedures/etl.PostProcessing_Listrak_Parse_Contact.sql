SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*****	Revision History

DCH 2018-06-25	-	initial sproc creation. 


*****/


CREATE PROC [etl].[PostProcessing_Listrak_Parse_Contact]
AS
BEGIN


	update a
	set a.IsLoaded = 1
	from stg.Listrak_ContactRest a
	join etl.Listrak_ContactRest_working b
		on a.ID = b.ID
		and a.IsLoaded = 0;
	
	
END


GO

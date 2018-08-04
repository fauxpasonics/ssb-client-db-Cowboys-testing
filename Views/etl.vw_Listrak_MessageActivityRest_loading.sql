SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Listrak_MessageActivityRest_loading]
AS


with blah as (
	select MessageID, Abuse, ActivityDate, Bounce, BounceReason, Click, ClickCount
		, EmailAddress, [Open], OrderTotal, [Read], SendDate, Unsubscribe, VisitDate
		, ROW_NUMBER() OVER (Partition By MessageID, EmailAddress Order By ActivityDate DESC) RowNum
	from etl.Listrak_MessageActivityRest_loading (nolock)
)
select MessageID, Abuse, ActivityDate, Bounce, BounceReason, Click, ClickCount
	, EmailAddress, [Open], OrderTotal, [Read], SendDate, Unsubscribe, VisitDate
from blah
where RowNum = 1;



GO

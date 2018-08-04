SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Listrak_Subscriptions_New]
AS

SELECT sub.ListID, sub.ContactID, sub.EmailAddress, sub.AdditionDate, sub.AdditionMethod
	, CASE WHEN con.EmailAddress IS NULL THEN 1 ELSE 0 END AS NewRecord
FROM ods.Listrak_Subscription sub
LEFT JOIN (
	SELECT DISTINCT EmailAddress, ListID
	FROM ods.Listrak_Contact
	) con
	ON sub.EmailAddress = con.EmailAddress
	AND sub.ListID = con.ListID
LEFT JOIN (
	SELECT DISTINCT ContactID
	FROM ods.Listrak_Removal
	) unsub ON sub.ContactID = unsub.ContactID
WHERE unsub.ContactID IS NULL
GO

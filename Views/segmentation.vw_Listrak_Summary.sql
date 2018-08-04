SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [segmentation].[vw_Listrak_Summary]
AS

SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID
	, mca.EmailAddress
	, ms.[Subject]
	, l.ListName
	, CASE WHEN mca.BounceCount = 0 THEN 'Delivery' ELSE 'Bounce' END AS Delivery
	, mca.SendDate AS DeliveryDate
	, 1 AS DeliveryCount
	, o.OpenDate
	, mca.Opened AS OpenCount
	, cl.ClickDate
	, mca.ClickCount
	, mca.BounceCount
--SELECT *
FROM ods.Listrak_MessageContactActivity mca
JOIN ods.Listrak_MessageSummary ms
	ON mca.MsgID = ms.MessageID
JOIN ods.Listrak_List l
	ON ms.ListID = l.ListID
LEFT JOIN (
	SELECT MessageID, ContactID, MIN(OpenDate) OpenDate
	FROM ods.Listrak_Open
	GROUP BY MessageID, ContactID
	) o ON o.ContactID = mca.ContactID AND o.MessageID = mca.MsgID
LEFT JOIN (
	SELECT MessageID, ContactID, MIN(ClickDate) ClickDate
	FROM ods.Listrak_Click
	GROUP BY MessageID, ContactID
	) cl ON cl.ContactID = mca.ContactID AND cl.MessageID = mca.MsgID
JOIN dbo.DimCustomer dc
	ON mca.ContactID = dc.SSID AND dc.SourceSystem = 'Listrak'
JOIN dbo.dimcustomerssbid ssbid
	ON dc.DimCustomerId = ssbid.DimCustomerId





GO

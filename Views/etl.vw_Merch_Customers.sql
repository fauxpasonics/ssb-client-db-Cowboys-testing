SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/****** Object:  View [etl].[vw_Merch_Customers]    Script Date: 3/26/2018 10:25:52 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO


CREATE VIEW [etl].[vw_Merch_Customers]
AS

SELECT MIN(ETL_ID) SSID
	, CASE WHEN LTRIM(RTRIM(Shipping_Name)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_Name)) END AS FullName
	, CASE WHEN LTRIM(RTRIM(Shipping_Street_Name)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_Street_Name)) END AS StreetAddress
	, CASE WHEN LTRIM(RTRIM(Shipping_PO_Box)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_PO_Box)) END AS POBox
	, CASE WHEN LTRIM(RTRIM(Shipping_City)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_City)) END AS City
	, CASE WHEN LTRIM(RTRIM(Shipping_State_Code)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_State_Code)) END AS [State]
	, CASE WHEN LTRIM(RTRIM(Shipping_Postal_Code)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_Postal_Code)) END AS PostalCode
	, CASE WHEN LTRIM(RTRIM(Shipping_County)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_County)) END AS County
	, CASE WHEN LTRIM(RTRIM(Shipping_Country_Code)) IN ('', 'Data Error', 'No Address') THEN NULL
			ELSE LTRIM(RTRIM(Shipping_Country_Code)) END AS Country
	, CASE WHEN LTRIM(RTRIM(Sales_Order_Email_Address)) IN ('', 'Data Error', 'No Email Address') THEN NULL
			ELSE LTRIM(RTRIM(Sales_Order_Email_Address)) END AS Email
	, MIN(CAST(Order_Date AS DATETIME)) CreatedDate
FROM ods.Merchandise_LineItems (NOLOCK)
GROUP BY
	  LTRIM(RTRIM(Shipping_Name))
	, LTRIM(RTRIM(Shipping_Street_Name))
	, LTRIM(RTRIM(Shipping_PO_Box))
	, LTRIM(RTRIM(Shipping_City))
	, LTRIM(RTRIM(Shipping_State_Code))
	, LTRIM(RTRIM(Shipping_Postal_Code))
	, LTRIM(RTRIM(Shipping_County))
	, LTRIM(RTRIM(Shipping_Country_Code))
	, LTRIM(RTRIM(Sales_Order_Email_Address))





--GO


GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_SG_DimRep]
AS

SELECT
  dsrGuid AS ETL__SSID
, dsrGuid AS ETL__SSID_SG_salesrep_guid
, c.dcFirstName AS FirstName
, c.dcMiddleName AS MiddleName
, c.dcLastName AS LastName
, c.dcSuffix AS Suffix
, CASE WHEN c.dcIsActive = 1 THEN 'Active' ELSE NULL END AS [Status]
, sr.dsrIsActive AS IsActive
--SELECT *
FROM ods.SGDW_DimSalesRepresentatives sr (NOLOCK)
LEFT JOIN ods.SGDW_DimClients c (NOLOCK)
	ON sr.dsrCustomerGuid = c.dcClientGUID


GO

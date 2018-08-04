SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_SG_DimTicketCustomer]
AS

SELECT c.dcClientGUID AS ETL__SSID
, c.dcClientGUID AS ETL__SSID_SG_client_guid
, -1 AS DimRepId
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN 1
	ELSE 0 END AS IsCompany
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN c.dcLastName
	ELSE c.dcWorkPlace END AS CompanyName
, NULL AS FullName
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN NULL
	ELSE t.dttlGlobalName END AS Prefix
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN NULL
	ELSE c.dcFirstName END AS FirstName
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN NULL
	ELSE c.dcMiddleName END AS MiddleName
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN NULL
	ELSE c.dcLastName END AS LastName
, CASE WHEN ISNULL(c.dcFirstName, '') = '' AND ISNULL(cef.dcefStringField2, '') <> '' THEN NULL
	ELSE c.dcSuffix END AS Suffix
, /*ct.dctName*/ NULL AS TicketCustomerClass
, CASE WHEN c.dcIsActive = 1 THEN 'Active' ELSE 'Inactive' END AS [Status]
, c.dcClientGUID AS CustomerId
, NULL AS VIPCode
, NULL AS IsVIP
, NULL AS Tag
, NULL AS AccountType
, NULL AS Keywords
, NULL AS Gender
, NULL AS AddDateTime
, c.dcJoinDate AS SinceDate
, c.dcBirthday AS Birthday
, c.dcEmail AS Email
, c.dcHomePhone AS Phone
, CASE WHEN ISNULL(c.dcAddressLine2, '') <> '' THEN CONCAT(c.dcAddressLine1, ' ', c.dcAddressLine2)
	ELSE c.dcAddressLine1 END AS AddressStreet1
, NULL AS AddressStreet2
, c.dcCityGlobalName AS AddressCity
, states.dsName AS AddressState
, c.dcZipCode AS AddressZip
, country.dcnName AS AddressCountry
--SELECT *
FROM ods.SGDW_DimClients c (NOLOCK)
LEFT JOIN ods.SGDW_DimTitles t (NOLOCK)
	ON c.dcTitleGuid = t.dttlGuid
LEFT JOIN ods.SGDW_DimStates states (NOLOCK)
	ON c.dcStateGuid = states.dsGuid
LEFT JOIN ods.SGDW_DimCountries country (NOLOCK)
	ON c.dcCountryGuid = country.dcnGuid
LEFT JOIN ods.SGDW_DimClientExtraFields cef (NOLOCK)
	ON c.dcClientGUID = cef.dcefClientId
--LEFT JOIN ods.SGDW_DimClientTypeDetails ctd (NOLOCK) -- Can't use this until we have updated dates or valid dates populated so we can choose a single type
--	ON c.dcClientGUID = ctd.dctdClientGuid
--LEFT JOIN ods.SGDW_DimClientTypes ct (NOLOCK)
--	ON ctd.dctdTypeGuid = ct.dctGuid
GO

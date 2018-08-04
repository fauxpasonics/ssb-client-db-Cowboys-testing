SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_TM_Customers_ToursDB]
AS

SELECT  
        /*Standard Attributes*/  
          CAST(AcctID AS NVARCHAR(25)) [SSID]  
        , CAST(CASE WHEN ISNULL(NameFirst, '') = '' AND ISNULL(NameLast, '') NOT LIKE '%@%' THEN NameLast ELSE '' END AS NVARCHAR(50)) AS [CompanyName]
		, Salutation AS [SalutationName]
		, TRY_CAST(Birthdate AS DATE) AS [Birthday]    
  
        /**ENTITIES**/  
        /*Name*/                     
        , CASE WHEN NameLast IN ('', 'DC Fan') THEN NameFirst ELSE '' END AS FullName  
        , CASE WHEN NameFirst IN ('', 'Unknown', 'Fan') OR NameFirst LIKE '%@%' THEN '' ELSE NameFirst END AS [FirstName] 
        , NameMI AS [MiddleName]  
        , CASE WHEN NameFirst = '' OR NameLast IN ('', 'Unknown', '*', ',', '.', ';u', 'DC Fan', 'Facebook', 'Unknown', 'Dcc', 'True Blue', 'TrueBlue')
				OR NameLast LIKE '%@%' OR NameLast LIKE 'Employee Tickets%' THEN ''
			ELSE NameLast END AS [LastName] 
  
        /*AddressPrimary*/  
        , CASE WHEN Street2 != '' THEN CONCAT(Street1, ' ', Street2)
			ELSE Street1 END AS [AddressPrimaryStreet]  
        , City AS [AddressPrimaryCity]   
        , [State] AS [AddressPrimaryState]   
        , Zip AS [AddressPrimaryZip]   
        , Country AS [AddressPrimaryCountry]
  
        /*Phone*/  
        , CAST(PhoneDay AS NVARCHAR(25)) AS [PhonePrimary]  
        , CAST(PhoneEve AS NVARCHAR(25)) AS [PhoneHome]  
        , CAST(PhoneCell AS NVARCHAR(25)) AS [PhoneCell]  
        , CAST(PhoneFax AS NVARCHAR(25)) AS [PhoneFax]  

  
        /*Email*/  
        , Email AS [EmailPrimary]  

FROM ods.TM_Customers_ToursDB








GO

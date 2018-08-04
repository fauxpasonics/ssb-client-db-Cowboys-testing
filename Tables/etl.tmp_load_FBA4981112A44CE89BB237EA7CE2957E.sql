CREATE TABLE [etl].[tmp_load_FBA4981112A44CE89BB237EA7CE2957E]
(
[SourceDB] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceSystemPriority] [int] NULL,
[SSID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountRep] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalutationName] [int] NULL,
[DonorMailName] [int] NULL,
[DonorFormalName] [int] NULL,
[Birthday] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MergedRecordFlag] [int] NOT NULL,
[MergedIntoSSID] [int] NULL,
[Prefix] [int] NULL,
[FirstName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [int] NULL,
[LastName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [int] NULL,
[Fullname] [int] NULL,
[AddressPrimaryStreet] [int] NULL,
[AddressPrimarySuite] [int] NULL,
[AddressPrimaryCity] [int] NULL,
[AddressPrimaryState] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryZip] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCounty] [int] NULL,
[AddressPrimaryCountry] [int] NULL,
[AddressOneStreet] [int] NULL,
[AddressOneSuite] [int] NULL,
[AddressOneCity] [int] NULL,
[AddressOneState] [int] NULL,
[AddressOneZip] [int] NULL,
[AddressOneCounty] [int] NULL,
[AddressOneCountry] [int] NULL,
[AddressTwoStreet] [int] NULL,
[AddressTwoSuite] [int] NULL,
[AddressTwoCity] [int] NULL,
[AddressTwoState] [int] NULL,
[AddressTwoZip] [int] NULL,
[AddressTwoCounty] [int] NULL,
[AddressTwoCountry] [int] NULL,
[AddressThreeStreet] [int] NULL,
[AddressThreeSuite] [int] NULL,
[AddressThreeCity] [int] NULL,
[AddressThreeState] [int] NULL,
[AddressThreeZip] [int] NULL,
[AddressThreeCounty] [int] NULL,
[AddressThreeCountry] [int] NULL,
[AddressFourStreet] [int] NULL,
[AddressFourSuite] [int] NULL,
[AddressFourCity] [int] NULL,
[AddressFourState] [int] NULL,
[AddressFourZip] [int] NULL,
[AddressFourCounty] [int] NULL,
[AddressFourCountry] [int] NULL,
[PhonePrimary] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneHome] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneCell] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneBusiness] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneFax] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneOther] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailPrimary] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailOne] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailTwo] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute1] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute2] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute3] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute4] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute5] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute6] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute7] [int] NULL,
[ExtAttribute8] [int] NULL,
[ExtAttribute9] [int] NULL,
[ExtAttribute10] [int] NULL,
[ExtAttribute11] [int] NULL,
[ExtAttribute12] [int] NULL,
[ExtAttribute13] [int] NULL,
[ExtAttribute14] [int] NULL,
[ExtAttribute15] [int] NULL,
[ExtAttribute16] [int] NULL,
[ExtAttribute17] [int] NULL,
[ExtAttribute18] [int] NULL,
[ExtAttribute19] [int] NULL,
[ExtAttribute20] [int] NULL,
[ExtAttribute21] [int] NULL,
[ExtAttribute22] [int] NULL,
[ExtAttribute23] [int] NULL,
[ExtAttribute24] [int] NULL,
[ExtAttribute25] [int] NULL,
[ExtAttribute26] [int] NULL,
[ExtAttribute27] [int] NULL,
[ExtAttribute28] [int] NULL,
[ExtAttribute29] [int] NULL,
[ExtAttribute30] [int] NULL,
[ExtAttribute31] [int] NULL,
[ExtAttribute32] [int] NULL,
[ExtAttribute33] [int] NULL,
[ExtAttribute34] [int] NULL,
[ExtAttribute35] [int] NULL,
[SSCreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSUpdatedBy] [int] NULL,
[SSCreatedDate] [datetime] NULL,
[SSUpdatedDate] [int] NULL,
[createddate] [datetime] NOT NULL,
[updateddate] [datetime] NOT NULL,
[AccountId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsBusiness] [int] NOT NULL,
[IsDeleted] [int] NOT NULL,
[customer_matchkey] [int] NULL,
[matchkey_updatedate] [int] NULL,
[NameDirtyHash] [varbinary] (8000) NULL,
[NameIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NameMasterId] [int] NULL,
[AddressPrimaryDirtyHash] [varbinary] (8000) NULL,
[AddressPrimaryIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressPrimaryMasterId] [int] NULL,
[AddressOneDirtyHash] [varbinary] (8000) NULL,
[AddressOneIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressOneMasterId] [int] NULL,
[AddressTwoDirtyHash] [varbinary] (8000) NULL,
[AddressTwoIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressTwoMasterId] [int] NULL,
[AddressThreeDirtyHash] [varbinary] (8000) NULL,
[AddressThreeIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressThreeMasterId] [int] NULL,
[AddressFourDirtyHash] [varbinary] (8000) NULL,
[AddressFourIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressFourMasterId] [int] NULL,
[ContactDirtyHash] [varbinary] (8000) NULL,
[PhonePrimaryDirtyHash] [varbinary] (8000) NULL,
[PhonePrimaryIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhonePrimaryMasterId] [int] NULL,
[PhoneHomeDirtyHash] [varbinary] (8000) NULL,
[PhoneHomeIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneHomeMasterId] [int] NULL,
[PhoneCellDirtyHash] [varbinary] (8000) NULL,
[PhoneCellIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneCellMasterId] [int] NULL,
[PhoneBusinessDirtyHash] [varbinary] (8000) NULL,
[PhoneBusinessIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneBusinessMasterId] [int] NULL,
[PhoneFaxDirtyHash] [varbinary] (8000) NULL,
[PhoneFaxIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneFaxMasterId] [int] NULL,
[PhoneOtherDirtyHash] [varbinary] (8000) NULL,
[PhoneOtherIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneOtherMasterId] [int] NULL,
[EmailPrimaryDirtyHash] [varbinary] (8000) NULL,
[EmailPrimaryIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailPrimaryMasterId] [int] NULL,
[EmailOneDirtyHash] [varbinary] (8000) NULL,
[EmailOneIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailOneMasterId] [int] NULL,
[EmailTwoDirtyHash] [varbinary] (8000) NULL,
[EmailTwoIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailTwoMasterId] [int] NULL,
[contactattrDirtyHash] [varbinary] (8000) NULL,
[extattr1_10DirtyHash] [varbinary] (8000) NULL,
[extattr11_20DirtyHash] [varbinary] (8000) NULL,
[extattr21_30DirtyHash] [varbinary] (8000) NULL,
[extattr31_35DirtyHash] [varbinary] (8000) NULL,
[RecordRank] [bigint] NULL
)
GO

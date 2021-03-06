CREATE TABLE [stg].[Merchandise_LineItems]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Merchandi__ETL_C__2FB3137D] DEFAULT (getdate()),
[Sales_Order_Data_Area_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sales_Order_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sales_Order_Email_Address] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Data_Area_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Size_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Vendor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Department] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Department] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Class] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Class] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brand_Group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Graphics_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product_Line] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Account_Num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Cust_Data_Area_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Cust_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Cust_Price_Group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Invoice_Account_Num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Invc_Cust_Data_Area_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ship_From_Location_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Store_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_Street_Number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_Street_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_PO_Box] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_City] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_State_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_County] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_Country_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipping_Postal_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Data_Area_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sales_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Invoice_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Units] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dollars] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line_Discount_Percentage] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line_Discount_Dollars] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[Merchandise_LineItems] ADD CONSTRAINT [PK__Merchand__7EF6BFCDD5AE88AD] PRIMARY KEY CLUSTERED  ([ETL_ID])
GO

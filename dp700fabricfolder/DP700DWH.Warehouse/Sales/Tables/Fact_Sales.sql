CREATE TABLE [Sales].[Fact_Sales] (

	[CustomerID] varchar(255) NOT NULL, 
	[ItemID] varchar(255) NOT NULL, 
	[SalesOrderNumber] varchar(30) NULL, 
	[SalesOrderLineNumber] int NULL, 
	[OrderDate] date NULL, 
	[Quantity] int NULL, 
	[TaxAmount] float NULL, 
	[UnitPrice] float NULL
);


GO
ALTER TABLE [Sales].[Fact_Sales] ADD CONSTRAINT FK_5811e934_b89e_459e_ae87_d39bf2b785b5 FOREIGN KEY ([ItemID]) REFERENCES [Sales].[Dim_Item]([ItemID]);
GO
ALTER TABLE [Sales].[Fact_Sales] ADD CONSTRAINT FK_5ebc13f7_9f07_4542_adcf_6ead680df829 FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Dim_Customer]([CustomerID]);
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
ALTER TABLE [Sales].[Fact_Sales] ADD CONSTRAINT FK_13da4dd0_456f_4979_96fa_7b88ddcaef9f FOREIGN KEY ([ItemID]) REFERENCES [Sales].[Dim_Item]([ItemID]);
GO
ALTER TABLE [Sales].[Fact_Sales] ADD CONSTRAINT FK_a9a463ae_f9fe_447a_ac0a_7d25a8040bd8 FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Dim_Customer]([CustomerID]);
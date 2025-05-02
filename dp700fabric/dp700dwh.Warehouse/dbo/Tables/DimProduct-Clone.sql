CREATE TABLE [dbo].[DimProduct-Clone] (

	[ProductKey] int NOT NULL, 
	[ProductAltKey] varchar(25) NULL, 
	[ProductName] varchar(50) NOT NULL, 
	[Category] varchar(50) NULL, 
	[ListPrice] decimal(18,0) NULL
);


GO
ALTER TABLE [dbo].[DimProduct-Clone] ADD CONSTRAINT UQ__DimProdu__A15E99B24636B22B unique NONCLUSTERED ([ProductKey]);
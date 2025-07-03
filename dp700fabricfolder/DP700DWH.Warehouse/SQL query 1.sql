CREATE TABLE dbo.DimProduct
(
   ProductKey INTEGER NOT NULL,
   ProductAltKey VARCHAR(25) NULL,
   ProductName VARCHAR(50) NOT NULL,
   Category VARCHAR(50) NULL,
   ListPrice DECIMAL(5,2) NULL
);
GO

select * from DimProduct
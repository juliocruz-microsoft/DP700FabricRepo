CREATE TABLE [dbo].[Dim_Item-Clone] (

	[ItemID] varchar(255) NOT NULL, 
	[ItemName] varchar(255) NOT NULL
);


GO
ALTER TABLE [dbo].[Dim_Item-Clone] ADD CONSTRAINT PK__Dim_Item__727E83EA58DC1DAE primary key NONCLUSTERED ([ItemID]);
select [$Outer].[SalesOrderKey],
    [$Outer].[SalesOrderDateKey],
    [$Outer].[ProductKey],
    [$Outer].[CustomerKey],
    [$Outer].[Quantity],
    [$Outer].[SalesTotal],
    [$Inner].[ProductName],
    [$Inner].[Category],
    [$Inner].[ListPrice]
from [JCDP700Warehouse].[dbo].[FactSalesOrder] as [$Outer]
left outer join 
(
    select [_].[ProductKey] as [ProductKey2],
        [_].[ProductAltKey] as [ProductAltKey],
        [_].[ProductName] as [ProductName],
        [_].[Category] as [Category],
        [_].[ListPrice] as [ListPrice]
    from [JCDP700Warehouse].[dbo].[DimProduct] as [_]
) as [$Inner] on ([$Outer].[ProductKey] = [$Inner].[ProductKey2])
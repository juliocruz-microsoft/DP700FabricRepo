-- Auto Generated (Do not modify) EFF2BCB6FE2EB30BE920C28ED5BAB25CDAB4430BE9361ED40E579C9201461B13
CREATE VIEW vSalesByRegion
AS
SELECT  d.[Year] AS CalendarYear,
       d.[Month] AS MonthOfYear,
       d.MonthName AS MonthName,
       c.CountryRegion AS SalesRegion,
      SUM(so.SalesTotal) AS SalesRevenue
FROM FactSalesOrder AS so
JOIN DimDate AS d ON so.SalesOrderDateKey = d.DateKey
JOIN DimCustomer AS c ON so.CustomerKey = c.CustomerKey
GROUP BY d.[Year], d.[Month], d.MonthName, c.CountryRegion;
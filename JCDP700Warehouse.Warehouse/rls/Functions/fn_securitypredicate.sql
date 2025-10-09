/*Create the security predicate defined as an inline table-valued function.
A predicate evaluates to true (1) or false (0). This security predicate returns 1,
meaning a row is accessible, when a row in the SalesRep column is the same as the user
executing the query.*/   
--Create a function to evaluate who is querying the table
CREATE FUNCTION rls.fn_securitypredicate(@SalesRep AS VARCHAR(60)) 
   RETURNS TABLE  
WITH SCHEMABINDING  
AS  
   RETURN SELECT 1 AS fn_securitypredicate_result   
WHERE @SalesRep = USER_NAME();
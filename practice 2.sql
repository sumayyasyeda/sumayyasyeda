Exercise-1 

/*Write a query that displays the three most expensive orders, per vendor ID, from the Purchasing.PurchaseOrderHeader table. 
There should ONLY be three records per Vendor ID, even if some of the total amounts due are identical.
"Most expensive" is defined by the amount in the "TotalDue" field. 

Include the following fields in your output: 
PurchaseOrderID VendorID OrderDate TaxAmt Freight TotalDue */


/*sub query*/

select purchaseOrderID,VendorID,orderDate,Taxamt,Freight,totaldue,
      mostexpensive=row_number() over(partition by vendorID order by totaldue desc) 
from purchasing.PurchaseOrderHeader as a
where 3<=(select max(totaldue)
          from purchasing.PurchaseOrderHeader 
		  )


/*cte*/
WITH a AS
(
SELECT distinct VendorID , PurchaseOrderID , OrderDate ,totaldue,Freight,taxamt,
mostexpensiveorder=Row_number() OVER (partition by vendorid ORDER BY totaldue Desc) 
FROM Purchasing.PurchaseOrderHeader
)
SELECT *
FROM a
WHERE mostexpensiveorder<=3;

Exercise 2 
  
/*Modify your query from the first problem, such that the top three purchase order amounts are returned, regardless of how many records are returned per Vendor Id. 
In other words, if there are multiple orders with the same total due amount, all should be returned as long as the total due amount for these orders is 
one of the top three. 
Ultimately, you should see three distinct total due amounts (i.e., the top three) for each group of like Vendor Ids. However, 
there could be multiple records for each of these amounts. */
 
 select * from purchasing.purchaseorderheader;

WITH p AS
(
SELECT distinct top 3 VendorID , PurchaseOrderID , OrderDate ,totaldue,Freight,taxamt,
mostexpensiveorder=Row_number() OVER ( ORDER BY totaldue Desc) ,
top3=row_number() over( order by totaldue desc) 
FROM Purchasing.PurchaseOrderHeader
)
SELECT *
FROM p
WHERE mostexpensiveorder<=3 ;



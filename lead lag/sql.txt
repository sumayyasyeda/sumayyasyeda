/*1st query*/
select a.purchaseorderId,a.orderdate,a.totaldue,b.name as vendorname
 from purchasing.purchaseorderheader as a
join purchasing.vendor as b
   on b.businessentityID=a.vendorID
   where (orderdate>='2013') and (totaldue>$500);

   /*2nd query*/
 select a.purchaseorderId,a.orderdate,a.totaldue,b.name as vendorname,
   prevorderfromvendoramt=Lag(totaldue,1,0) over(partition by a.vendorID order by purchaseorderId)
 from purchasing.purchaseorderheader as a
join purchasing.vendor as b
   on  b.businessentityID=a.vendorID
   where (orderdate>='2013') and (totaldue>$500);

   /*3rd query*/
 select a.purchaseorderId,a.orderdate,a.totaldue,b.name as vendorname,
   prevorderfromvendoramt=Lag(totaldue,1,0) over(partition by a.vendorID order by purchaseorderId),
   nextorderbyemployeevendor=lead(b.name,1) over(partition by a.employeeID order by orderdate)
 from purchasing.purchaseorderheader as a
join purchasing.vendor as b
   on  b.businessentityID=a.vendorID
   where orderdate>='2013' and totaldue>$500;

/*4th query*/
select a.purchaseorderId,a.orderdate,a.totaldue,b.name as vendorname,averagerate=max(totaldue) over(),
   prevorderfromvendoramt=Lag(totaldue,1,0) over(partition by a.vendorID order by purchaseorderId),
   nextorderbyemployeevendor=lead(b.name,1) over(partition by a.employeeID order by orderdate),
   next2orderbyemployeevendor=lead(b.name,2) over (partition by a.employeeID order by purchaseorderID) 
   
 from purchasing.purchaseorderheader as a
join purchasing.vendor as b
   on  b.businessentityID=a.vendorID
   where (orderdate>='2013') and (totaldue>$500);

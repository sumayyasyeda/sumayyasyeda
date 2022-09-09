/*1st query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory 
from Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

/*2nd query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  avgPriceBycategory=avg(a.ListPrice)  over(partition by c.productcategoryID order by c.Name)
from Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

/*3rd query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  avgPriceBycategory=avg(a.ListPrice) over(),
	  avgPriceBycategoryandsubcategory=avg(a.ListPrice) over(partition by c.name order by c.Name)
from Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

/*4th query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  avgPriceBycategory=avg(a.ListPrice) over(),
	  avgPriceBycategoryandsubcategory=avg(a.ListPrice) over(partition by c.name order by c.Name),
	  
	   productvscategorydelta =a.ListPrice-avg(a.listPrice) over(partition by c.name)
from Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

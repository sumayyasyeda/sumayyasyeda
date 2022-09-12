/*1st query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory
	  
FROM Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

  /*2nd query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Row_number() over( order by a.ListPrice DESC)
	 
FROM Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

  /*3rd query*/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Rank() over( order by a.ListPrice DESC),
	  CategotyPriceRank=row_number() over(partition by c.productcategoryID order by a.listPrice DESC)
	  
FROM Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

/*4th query**/
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Row_number() over(partition by c.name order by a.ListPrice DESC),
	  CategotyPriceRank=row_number() over(partition by c.productcategoryID order by a.listPrice DESC),
	  top5casecategory=
	    case
		   when rank() over(partition by c.name order by Listprice desc) > 5 then 'no'
		   else 'yes'
		   end 

FROM Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

  or

 select d.listprice,d.productname,d.pricerank,
 top5pricecategory=
  (
  CASE
      WHEN pricerank>5 then 'no'
	  else 'yes'
  end)
  from(select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Row_Number() over(partition by c.name order by a.ListPrice DESC),
	  CategotyPriceRank=row_number() over(partition by c.name order by a.listPrice DESC)
	  from Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID) d






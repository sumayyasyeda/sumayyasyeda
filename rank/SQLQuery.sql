  /***rank_exercise****/
  /1st query/
  
select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Rank() over(partition by c.name order by a.ListPrice DESC),
	  CategotyPriceRank=row_number() over(partition by c.name order by a.listPrice DESC),
	  Categorypricerankwithrank = rank() over(partition by c.productcategoryID order by a.ListPrice desc),
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



  /*2nd query*/
  select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Rank() over(partition by c.name order by a.ListPrice DESC),
	  CategotyPriceRank=row_number() over(partition by c.name order by a.listPrice DESC),
	  Categorypricerankwithrank = rank() over(partition by c.productcategoryID order by a.ListPrice desc),
	  categorypricerankwithDenserank=DENSE_RANK() over(partition by c.name order by a.ListPrice DESC),
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


 
  /*3rd query*/
     select a.Name as productname,a.ListPrice,b.Name as Productsubcategory,
      c.Name as Productcategory,
	  pricerank=Rank() over(partition by c.name order by a.ListPrice DESC),
	  CategotyPriceRank=row_number() over(partition by c.name order by a.listPrice DESC),
	  Categorypricerankwithrank = rank() over(partition by c.productcategoryID order by a.ListPrice desc),
	  categorypricerankwithDenserank=DENSE_RANK() over(partition by c.name order by a.ListPrice DESC),
	  top5casecategory=
	    case
		   when dense_rank() over(partition by c.name order by Listprice desc) > 5 then 'no'
		   else 'yes'
		   end 
FROM Production.Product as a
inner join Production.productsubcategory as b
  on a.productsubcategoryID=b.productsubcategoryID
join Production.ProductCategory  as c
  on b.productcategoryID=c.productcategoryID

/*1query*/
select a.FirstName,a.LastName,b.JobTitle,c.rate,Averagerate=avg(c.rate) over()
from person.person as a
join humanResources.employee as b
  on a.businessEntityId=b.BusinessEntityID
join HumanResources.EmployeepayHistory as c
  on b.BusinessEntityID=c.BusinessEntityID

/*2query*/
select a.FirstName,a.LastName,b.JobTitle,c.rate,Averagerate=avg(c.rate) over(), MaximumRate=max(c.rate) over()
from person.person as a
join humanResources.employee as b
  on a.businessEntityId=b.BusinessEntityID
join HumanResources.EmployeepayHistory as c
  on b.BusinessEntityID=c.BusinessEntityID

/*3rd query*/

select a.FirstName,a.LastName,b.JobTitle,c.rate,Averagerate=avg(c.rate) over(), MaximumRate=max(c.rate) over(),
Difffromavgrate=c.rate-avg(c.rate) over()
from person.person as a
join humanResources.employee as b
  on a.businessEntityId=b.BusinessEntityID
join HumanResources.EmployeepayHistory as c
  on b.BusinessEntityID=c.BusinessEntityID

/*4th query*/
select a.FirstName,a.LastName,b.JobTitle,c.rate,Averagerate=avg(c.rate) over(),
        MaximumRate=max(c.rate) over(),Difffromavgrate=c.rate-avg(c.rate) over()
	
from person.person as a
join humanResources.employee as b
  on a.businessEntityId=b.BusinessEntityID
join HumanResources.EmployeepayHistory as c
  on b.BusinessEntityID=c.BusinessEntityID
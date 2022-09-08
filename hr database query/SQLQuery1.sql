/*1st query*/
select first_name,last_name,round(salary/12,2) as 'monthly salary' 
from employees;

/*2nd query*/
select manager_id,min(salary) as salarymin
from employees
where manager_id is not null
group by manager_id
order by min(salary) desc;

/*3rd query*/
select department_id,avg(salary) as averagesalary,count(*) more10
from employees
group by department_id 
having count(*)>10;

/*4th query*/
select first_name,last_name
from dbo.employees
where salary>(select salary
              from dbo.employees
			  where employee_id=163
			  );

/*5th query*/
select first_name,last_name,salary,department_id
from dbo.employees
where salary in(select min(salary)
                 from employees
				 group by department_id
				 );
/*6th query*/
select first_name,last_name,employee_id,salary
from employees
where manager_id=(select employee_id
                  from employees
				  where first_name='payam'
				  );
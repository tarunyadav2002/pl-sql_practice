
select round(max(salary),2) as "Max Salary",
		round(min(salary),2) as "Min Salary",
		round(sum(salary),2) as "total salary",
		round(avg(salary),2) as "avg Salary"
from employees

select job_id,max(salary),min(salary),max(salary)-min(salary) as diff from employees
group by job_id

select manager_id,min(salary) salary from employees
where manager_id is not null and manager_id != 0
group by manager_id
order by 2 

select department_id,round(avg(salary),0),count(*) as average from employees
group by department_id
having count(*) >=10
order by department_id

select * from employees

select round(avg(salary),0),job_id from employees 
where job_id not in ('IT_PROG')
group by job_id
order by 1

select job_id,round(max(salary),0) from employees
group by job_id
having round(max(salary),0) >= 5000

select first_name,email,substr(email,1,length(email)-4) from employees

select first_name,last_name from employees
where first_name like 'A%' or first_name like 'C%' or first_name like 'M%'
order by first_name

select upper(first_name) from employees

select distinct job_id from employees

select first_name,last_name,department_id from employees
where department_id in (30,100)
order by department_id

select * from employees

select first_name,last_name,salary from employees 
where department_id not in (30,100)
and salary not between 10000 and 20000

select first_name,last_name,position('c' in last_name) from employees
where position('c' in last_name) > 2;

update employees 
set phone_number = replace (phone_number,'123','888')
where phone_number like '%123%'

select round(salary/12,2) from employees

select round(avg(salary),2),count(*) from employees

select first_name,last_name from employees
where length(last_name) = 6

select first_name,last_name from employees
where last_name like '______'















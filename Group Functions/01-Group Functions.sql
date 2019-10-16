/* ---------------------------GROUP FUNCTIONS------------------------------ */
select * from employees;

select distinct salary from employees;

select avg(salary), avg(all salary), avg(distinct salary)
from employees;

select avg(salary), avg(all salary), avg(distinct salary)
from employees
where job_id = 'IT_PROG';

select count(*), count(manager_id), count(all manager_id),
       count(distinct manager_id) 
from employees;
       
select count(*), count(commission_pct), count(distinct commission_pct),
       count(nvl(commission_pct, 0)), count(distinct nvl(commission_pct, 0))
from employees;

select max(salary), max(hire_date), max(first_name) from employees;

select min(salary), min(hire_date), min(first_name) from employees;

select min(commission_pct), min(nvl(commission_pct, 0))
from employees;

select sum(salary), sum(distinct salary) from employees;

select min(salary), max(salary), avg(salary), count(*)
from employees;
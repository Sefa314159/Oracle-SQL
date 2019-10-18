select * from employees;

select job_id, avg(salary) average from employees
group by job_id order by average desc;

select job_id, department_id, manager_id, avg(salary)
from employees
group by department_id, job_id, manager_id;

select avg(salary), sum(salary), min(salary), max(salary), count(*)
from employees
group by department_id order by avg(salary);

select job_id, department_id, avg(salary) from employees
    where job_id in('SH_CLERK', 'IT_PROG', 'AC_ACCOUNT')
        group by job_id, department_id
        order by avg(salary);
        
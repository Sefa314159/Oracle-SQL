select * from employees;

select max(avg(salary))
from employees; /* error : "nested group function without GROUP BY" */

select department_id, avg(salary) from employees
group by department_id;

select max(avg(salary))
from employees
group by department_id;

select department_id, max(avg(salary)) from employees
group by department_id; /* error : "not a single-group group function" */


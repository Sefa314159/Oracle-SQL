select employee_id, salary, commission_pct,
salary + commission_pct
from employees;

select employee_id, salary, commission_pct,
salary + salary * commission_pct
from employees;

select employee_id, salary, commission_pct,
salary + salary * nvl(commission_pct, 0)
from employees;

select employee_id, salary, commission_pct,
salary + salary * nvl2(commission_pct, 0, 3)
from employees;

select first_name, last_name,
nvl2(commission_pct, 'has not null', 'has null') comm_pct,
commission_pct from employees
where job_id in('SA_REP', 'IT_PROG');

/* if exp1 and exp2 are equal, returns null, otherwise return exp1 */
select first_name, last_name,
length(first_name) "Expression 1",
length(last_name) "Expression 2"
from employees
where nullif(length(first_name), length(last_name)) is null;

/* --------------COALESCE FUNCTION----------------- */
/* if expression 1 is null then look at expression 2. */
/* if it is null either then look at the next one */
/* this will continue until the expressionX arrives */
/* all the expressions must be of the same data type */
select * from locations;

select state_province, city, 
coalesce(state_province, city, 'not has') 
from locations;

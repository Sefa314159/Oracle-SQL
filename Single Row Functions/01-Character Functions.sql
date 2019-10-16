select first_name, last_name, substr(first_name, 4, 6), length(last_name)
from employees;

select first_name || ' ' || last_name from employees;

select first_name, instr(first_name, 'a') from employees;

select trim('     Sefa     ') from dual; 

select rtrim('     Sefa     ') from dual; 

select ltrim('     Sefa     ') from dual;

select first_name, replace(first_name, 'l', '*') from employees;

select first_name, replace(first_name, 'll', '*') from employees;

select first_name, lpad(first_name, 10, '*') from employees;

select first_name, lpad(first_name, 6, '*') from employees;

select first_name, lpad(first_name, 10, ' ') from employees;

select first_name, rpad(first_name, 6, '*'), lpad(first_name, 6, '*')
from employees;









 
select first_name, last_name,
lpad(upper(concat(first_name, last_name)), 20, '*')
nesting from employees;

select first_name, last_name,
lpad(upper(first_name || ' ' || last_name), 20, '*')
nesting from employees;

select 'Sefa Ýþci' from dual;

select instr('Sefa Ýþci', ' ') + 1 from dual;

select substr('Sefa Ýþci', instr('Sefa Ýþci', ' ') + 1, length('Sefa Ýþci')) 
from dual;

select substr(first_name || ' ' || last_name, 
instr(first_name || ' ' || last_name, ' ') + 1,
length(first_name || ' ' || last_name)) names,
first_name || ' ' || last_name from employees;



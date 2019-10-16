select first_name, last_name,
lpad(upper(concat(first_name, last_name)), 20, '*')
nesting from employees;

select first_name, last_name,
lpad(upper(first_name || ' ' || last_name), 20, '*')
nesting from employees;

select 'Sefa ��ci' from dual;

select instr('Sefa ��ci', ' ') + 1 from dual;

select substr('Sefa ��ci', instr('Sefa ��ci', ' ') + 1, length('Sefa ��ci')) 
from dual;

select substr(first_name || ' ' || last_name, 
instr(first_name || ' ' || last_name, ' ') + 1,
length(first_name || ' ' || last_name)) names,
first_name || ' ' || last_name from employees;



select * from employees;

/* ---------------Implicit Data Type Conversion------------ */
select * from employees
where department_id = '90';
/*----------------------------------------------------------*/

/* ---------------Explicit Data Type Conversion------------ */
select first_name, hire_date,
to_char(hire_date, 'YYYY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'YY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'RR') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'YEAR') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'MM') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'MM-YYYY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'MON') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DAY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'MON-YYYY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'Mon-YY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'Month-YY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-Month-YYYY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'Dy-Mon-YY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'Day-Month-YYYY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-MM-YY') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-MM-YY : HH12') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-MM-YY : HH24') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-MM-YY : HH') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-MM-YY : HH24-MI') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DD-MM-YY : HH12-MM-SS') "formatted date"
from employees;

select first_name, hire_date,
to_char(sysdate, 'DD-MM-YY : HH12-MM-SS') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DDTH-Mon-YY : HH24-MI-ss') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DDsp-Mon-YY : HH24-MI-ss') "formatted date"
from employees;

select first_name, hire_date,
to_char(hire_date, 'DDspth-Mon-YY : HH24-MI-ss') "formatted date"
from employees;

select salary, salary * commission_pct "Before format",
to_char(salary * commission_pct, '$99,999.99') "After format"
from employees
where commission_pct is not null;

select salary, salary * commission_pct "Before format",
to_char(salary * commission_pct, '$099,999.99') "After format"
from employees
where commission_pct is not null;

select 6152.21, to_number('$6,152.21', '$99,999.99') "Formatted Number"
from dual;




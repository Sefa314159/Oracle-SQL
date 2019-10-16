select * from employees;

select sysdate from dual;

select current_date from dual;

select sysdate, current_date, sessiontimezone, current_timestamp from dual;

/* + 2 means, two days from now */
select sysdate + 2 from dual;

select sysdate - 4 from dual;

select employee_id, sysdate, hire_date, sysdate - hire_date from employees;

select employee_id, sysdate, hire_date, trunc(sysdate - hire_date) from employees;

select first_name, last_name, (sysdate - hire_date) / 365 "Working Period" from employees;




select * from employees;

select job_id, avg(salary) from employees
having avg(salary) > 10000
group by job_id;

select job_id, avg(salary) from employees
where job_id = 'IT_PROG'
group by job_id;

select job_id, avg(salary) from employees
where job_id != 'IT_PROG'
group by job_id having avg(salary) > 5000;

select job_id, avg(salary) from employees
where hire_date > '01-01-2000'
group by job_id 
having avg(salary) > 5000;

select job_id, avg(salary) from employees
where manager_id = 100
group by job_id 
having avg(salary) > 5000;

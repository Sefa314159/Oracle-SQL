select first_name, last_name, job_id, salary, updated_salary, 
       updated_salary / salary as "ratio"
from(

    select first_name, last_name, job_id, salary, hire_date,
        case job_id when 'SH_CLERK' then 1.2 * salary
                    when 'MK_MAN' then 1.3 * salary
                    when 'IT_PROG' then 1.4 * salary
                    else salary end updated_salary
                    
    from employees where job_id in('SH_CLERK', 'MK_MAN', 'IT_PROG')
    );    
/*------------------------------------------------------------------*/
select first_name, last_name, job_id, salary from employees
where(case
        when job_id = 'IT_PROG' and salary > 5000 then 1
        when job_id = 'SH_CLERK' and salary > 10000 then 1
        else 0 end
     ) = 1;
     
/*------------------------------------------------------------------*/

/*-----------------------DECODE FUNCTION----------------------------*/
select * from employees;

select first_name, last_name, job_id, salary, hire_date,
    decode(job_id, 'SH_CLERK',  1.2 * salary,
                   'FI_MGR',    1.3 * salary,
                   'AD_VP',     1.4 * salary,
                    salary) 
                    as updated_salary
from employees;
/*------------------------------------------------------------------*/
select first_name, last_name, job_id, salary, hire_date,
    decode(job_id, 'SH_CLERK',  1.2 * salary,
                   'FI_MGR',    1.3 * salary,
                   'AD_VP',     1.4 * salary) 
                    as updated_salary
from employees;
/*------------------------------------------------------------------*/
select first_name, last_name, job_id, salary, hire_date,
    decode(job_id, 'SH_CLERK',  1.2 * salary,
                   'FI_MGR',    1.3 * salary,
                   'AD_VP',     1.4 * salary) 
                    as updated_salary
from employees
where job_id in ('SH_CLERK', 'FI_MGR', 'AD_VP');
/*------------------------------------------------------------------*/



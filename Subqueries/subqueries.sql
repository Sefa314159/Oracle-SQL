/* --------------------------| Using Subqueries |---------------------------- */

select * from employees;

select salary from employees;

select salary from employees
    where employee_id = 201;
    
select * from employees
    where salary > 13000;
    
select first_name, last_name
    from (select * from employees
            where salary > 13000
          );

select first_name, last_name from employees
    where employee_id = 201;

select first_name, last_name, salary
    from employees
    where salary > (select salary
                        from employees
                        where employee_id = 201
                    );

select * from employees /* main query */
    where salary > (select salary /* subquery */
                        from employees
                        where first_name = 'Michael'
                            and last_name = 'Hartstein'
                    );
                    
select first_name, last_name, salary
    from employees
    where salary > (select salary
                        from employees
                        where first_name = 'Michael'
                            and last_name = 'Hartstein'
                    );

/* -----------------------| Single Row Subqueries |-------------------------- */

select department_id from employees
    where employee_id = 201;

select * from employees
    where department_id = (select department_id from employees
                           where employee_id = 201);

select *
    from employees
    where department_id = (select department_id from employees
                                where first_name = 'Michael' and
                                last_name = 'Hartstein');

select first_name, last_name, department_id
    from employees
    where department_id = (select department_id from employees
                                where first_name = 'Michael' and
                                last_name = 'Hartstein')
        and salary < (select salary from employees
                            where employee_id = 201);

select * from employees
    where salary > (select salary from employees
                        where employee_id = 201)
        and department_id = (select department_id from employees
                                where salary > 20000);

select first_name, last_name, hire_date
    from employees
    where hire_date = (
        select min(hire_date)
        from employees
                       );
                       
/* error : single - row subquery return more than one row. */                       
select first_name, last_name, hire_date
    from employees
    where hire_date = (
        select min(hire_date)
        from employees
        group by department_id
                       );
                       
select first_name, last_name, hire_date
    from employees
    where hire_date = (
        select max(hire_date)
        from employees
                       );
                       
select min(hire_date)
    from employees
    group by department_id;
    
/* ----------------------| Multiple Row Subqueries |------------------------- */

/*
- return more than one row from the inner query.
- used with multiple-row comparison operators. (in, any, row)
    1) 'in' operator  : equal to any element in the list.
    2) 'any' operator : at least one of the element should match.
    3) 'all' operator : all of the elements should match.
- multiple row subqueries can be used within 'from', 'where' or 'having' clause.
*/

select *  from employees;

select first_name, last_name, department_id, salary
    from employees
    where salary in (14000, 15000, 10000);
    
select first_name, last_name, department_id, salary
    from employees
    where salary in (
                    select min(salary) from employees
                        group by department_id
                    );
                    
select first_name, last_name, department_id, salary
    from employees
    where salary in (
                    select max(salary) from employees
                        group by department_id
                    );
                     
select first_name, last_name, job_id, salary
    from employees
    where salary > any (
                        select salary
                            from employees
                            where job_id = 'SA_MAN'
                        );
                        
select salary
    from employees
    where job_id = 'SA_MAN';
    
select first_name, last_name, job_id, salary
    from employees
    where salary = any (
                        select salary
                            from employees
                            where job_id = 'SA_MAN'
                        );
                        
select first_name, last_name, job_id, salary
    from employees
    where salary < any (
                        select salary
                            from employees
                            where job_id = 'SA_MAN'
                        );
                        
select first_name, last_name, job_id, salary
    from employees
    where salary > all (
                        select salary
                            from employees
                            where job_id = 'SA_MAN'
                        );

select salary
    from employees
    where job_id = 'SA_MAN';
                        
select first_name, last_name, job_id, salary
    from employees
    where salary = all (
                        select salary
                            from employees
                            where job_id = 'SA_MAN'
                        );
                        
select first_name, last_name, job_id, salary
    from employees
    where salary < all (
                        select salary
                            from employees
                            where job_id = 'SA_MAN'
                        );
                        
/* ---------------------| Multiple Column Subqueries |----------------------- */

/*
- multiple column subqueries return more than one column in a row.
- can be used with 'from', 'where', 'having' clauses.
- multiple column subqueries are useful in writing more than one inner query
  in one inner query.
- used with 'in' operator.
*/

select first_name, last_name, department_id, salary from employees
    where (department_id, salary) in(
                    select department_id, min(salary) from employees
                    group by department_id
                                    );

select min(salary) from employees
    group by department_id;
    
select department_id, min(salary) from employees
    group by department_id;

select first_name, last_name, department_id, salary from employees
    where salary in( /* single column example */
                    select min(salary) from employees
                    group by department_id
                                    );
                    
select first_name, last_name, department_id, salary from employees
    where (department_id, salary) in(
                    select department_id, min(salary) from employees
                    group by department_id
                                    );
                                    
select first_name, last_name, department_id, salary from employees
    where (department_id, salary) in(
                    select department_id, max(salary) from employees
                    group by department_id
                                    );

select first_name, last_name, job_id, salary
    from employees
    where (salary, job_id) in
        (
         select max(salary), job_id
            from employees
            group by job_id
         )
         order by salary desc;
         
select max(salary), job_id
    from employees
    group by job_id;

/* ----------------------------| Natural Joins |----------------------------- */

select * from employees;

select * from departments;

select *
    from employees
    natural join departments;

select first_name, last_name, department_id
    from employees
    natural join departments;

/* -----------------------| Join with USING Clause |------------------------- */

/* if we use natural join,
program 'naturally' joins them with manager_id.
But we have another common columnn:
that is department_id. And we can use 'using' clause
to choose to join them up with that column(department_id).*/

select * from employees
    natural join departments;

select * from employees
    join departments using (department_id);

/*this command same as 'natural join'*/
select * from employees
    join departments using(department_id, manager_id);

/* -------------------| Handling Ambiguous Column Names |-------------------- */

/* this command gives me an error.*/
select first_name, last_name, department_name, manager_id
    from employees
    join departments using(department_id);

/* we can use table aliases */
select first_name, last_name, department_name, e.manager_id
    from employees 
    e join departments d using(department_id);

/* we can use table aliases */
select first_name, last_name, department_name, d.manager_id
    from employees 
    e join departments d using(department_id);

/* we can use table aliases */
select e.first_name, e.last_name, department_name, e.manager_id
    from employees 
    e join departments d using(department_id);

/* this command gives me an error :
column part cannot be a modifier. */
select first_name, last_name, department_name, manager_id
    from employees e 
    join departments d using(manager_id);

/* -------------------------| Join with ON Clause |-------------------------- */

/* ON clause is used to join two tables with one or more than
one columns, these column names can be different. */

select e.first_name, e.last_name, d.manager_id, department_name
    from employees e 
    join departments d
    on(e.department_id = d.department_id
        and e.manager_id = d.manager_id);
        
select e.first_name, e.last_name, manager_id, d.department_name
    from employees e
    join departments d
    using (department_id, manager_id);
    
/* -----------------------| Multiple Join Operations |----------------------- */

select * from employees;

select * from departments;

select * from locations;

select first_name, last_name, d.department_name, city
    from employees e 
    join departments d
    on(e.department_id = d.department_id)
    join locations l
    on(l.location_id = d.location_id);
    
/* --------------------------| Restricting Joins |--------------------------- */

select e.first_name, e.last_name, d.department_id
    from employees e
    join departments d
    on(e.department_id = d.department_id)
    where d.department_id = 100;
    
select e.first_name, e.last_name, d.department_name, l.city, d.department_id
    from employees e
    join departments d
    on(e.department_id = d.department_id)
    join locations l
    on(l.location_id = d.location_id)
    where d.department_id = 100;
    
select e.first_name, e.last_name, d.department_name, l.city, d.department_id
    from employees e
    join departments d
    on(e.department_id = d.department_id)
    join locations l
    on(l.location_id = d.location_id)
    and d.department_id = 100;

select e.first_name, e.last_name, d.department_name, l.city, d.department_id
    from employees e
    join departments d
    on(e.department_id = d.department_id)
    join locations l
    on(l.location_id = d.location_id)
    where e.job_id = 'IT_PROG';
    
select e.first_name, e.last_name, d.department_name, l.city, d.department_id
    from employees e
    join departments d
    on(e.department_id = d.department_id)
    join locations l
    on(l.location_id = d.location_id)
    and e.job_id = 'IT_PROG';
    
/* ------------------------------| Self Join |------------------------------- */

select * from employees;

select * from departments;

/* error : column ambiguously defined*/
select employee_id, first_name, last_name, manager_id
    from employees worker
    join
    employees manager
    on(worker.manager_id = manager.employee_id);
    
select worker.employee_id, worker.first_name, 
       worker.last_name, worker.manager_id
    from employees worker
    join
    employees manager
    on(worker.manager_id = manager.employee_id);
    
select worker.employee_id, worker.first_name,
       worker.last_name, worker.manager_id, d.department_name
    from employees worker
    join
    employees manager
    on(worker.manager_id = manager.employee_id)
    join departments d
    on(manager.department_id = d.department_id)
    order by employee_id;
    
select worker.first_name || ' ' || worker.last_name "Employee Name",
       manager.first_name || ' ' || manager.last_name "Manager Name",
       worker.employee_id, worker.manager_id, manager.employee_id "Mgr Emp Id"
    from employees worker
    join employees manager
    on(worker.manager_id = manager.employee_id)
    order by worker.employee_id;

/* ---------------------------| Left Outer Join |---------------------------- */    

select * from employees;

select * from departments;

select first_name, last_name, department_id
    from
    employees e left outer join departments d
    using(department_id);
    
select first_name, last_name, d.department_name
    from
    employees e left outer join departments d
    on(e.department_id = d.department_id);
    
/* --------------------------| Right Outer Join |---------------------------- */

select * from employees;

select * from departments;

select first_name, last_name, d.department_name
    from
    employees e right outer join departments d
    on(e.department_id = d.department_id);

/* ---------------------------| Full Outer Join |---------------------------- */

select first_name, last_name, department_name
    from
    employees e full outer join departments d
    on(e.department_id = d.department_id);

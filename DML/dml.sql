select * from sefa_employees;

/* --------------------------| insert statement |---------------------------- */

/* we can insert a new row with specific data. */
insert into sefa_employees(first_name, last_name, salary)
    values('sefa', 'iþci', 2000);

select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can insert a new row without writing column names. */
insert into sefa_employees
    values('sefa', 'isci', 5000);

select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can add a new row without writing column names and without writing the
   full names. */
insert into sefa_employees
    values(280, 'Customer Relations', null);
    
select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can add a new row with omiting some column names. */
insert into sefa_employees(first_name, last_name)
    values('sefa2', 'isci2');
    
select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can add a new row with using special values like sysdate or specific
   dates. */

alter table sefa_employees
    add hire_date date;
    
alter table sefa_employees
    add my_sys_date date;
    
select * from sefa_employees;

insert 
    into sefa_employees(first_name, last_name, salary, hire_date, my_sys_date)
    values('sefa', 'isci', 4000, to_date('01/05/03', 'DD/MM/YY'), sysdate);
    
select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can copy a table into another table. */
create table sefa2_employees2
    as select * from employees;
    
select * from sefa2_employees2;

truncate table sefa2_employees2;

select * from sefa2_employees2;

insert into sefa2_employees2
    select * from employees;
    
select * from sefa2_employees2;
/*----------------------------------------------------------------------------*/
/* we can copy a some values from a table into another table. */

truncate table sefa2_employees2;

select * from employees;

select * from sefa2_employees2;

insert into sefa2_employees2
    select * from employees 
        where first_name like '%e%';
        
select * from sefa2_employees2;
/*----------------------------------------------------------------------------*/
/* we can insert values by using multiple tables. */
select * from employees;

select * from departments;

select * from locations;

create table emp_with_dep_with_loc
    as select employee_id, first_name, last_name,
              city || ' ' || street_address adress
              from employees
              join departments using(department_id)
              join locations using(location_id);
              
select * from emp_with_dep_with_loc;

/* --------------------------| update statement |---------------------------- */

/* modifies existing values from a table is called update statement. */
select * from sefa_employees;

update sefa_employees
    set salary = 10000;
    
select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can update a column of specific rows of a table. */
update sefa_employees
    set salary = 2000
    where first_name = 'sefa' and last_name = 'iþci';
    
select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can update some columns of a table with subquery. */
update sefa_employees
    set(salary, last_name) = (select min(salary), 'no_soyad' from employees)
    where first_name = 'sefa2';
    
select * from sefa_employees;

/* --------------------------| delete statement |---------------------------- */

/* removing existing rows from a table is called delete statement. */
delete from sefa_employees
    where last_name = 'no_soyad';
    
select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can delete rows based on a subquery. */
select * from employees_copy;

delete from employees_copy
    where department_id
        in(
            select department_id from departments
                where department_name like 'SA%'
           );

select * from employees_copy;

/* -------------------------| savepoint statement |--------------------------- */

select * from sefa_employees;

delete from sefa_employees 
    where first_name = 'sefa' and last_name = 'isci';
    
savepoint A;
    
delete from sefa_employees 
    where first_name = 'sefa' and last_name = 'iþci';
    
savepoint B;

delete from sefa_employees 
    where first_name = '280' and last_name = 'Customer Relations';
    
savepoint C;

rollback to B;

select * from sefa_employees;

/* -----------------------| create table statement |------------------------- */

/* we can create a table with getting a subqueries data. */
create table my_employees
    (
    employee_id number(3),
    first_name varchar2(50),
    last_time varchar2(50),
    hire_date date default sysdate
    );

select * from my_employees;

describe my_employees;

desc my_employees;

/* --------------| create table with using subquery statement |-------------- */
    
/* we can copy all the table with or without data. */
create table employees_copy
as select * from employees; /* with data */

select * from employees_copy;

create table employees3_copy
as select * from employees where 1 = 2;  /* without data */

select * from employees3_copy;
/*----------------------------------------------------------------------------*/
/* we can create a table with a specific data. */
create table employees2_copy
as
select * from employees
    where job_id = 'IT_PROG';
    
select * from employees2_copy;
/*----------------------------------------------------------------------------*/
/* we can define column names while creating table from subquery. */
create table sefa_employees(first_name, last_name, salary)
as select first_name, last_name, salary from employees;

select * from sefa_employees;
/*----------------------------------------------------------------------------*/
/* we can give different column names while creating table. */
create table sefa2_employees(name, surname, annual_salary)
as select first_name, last_name, 12 * salary from employees;

select * from sefa2_employees;
/*----------------------------------------------------------------------------*/
/* number of specified columns must match with subquery. 
   otherwise we get an error.
   error : invalid number of column names specified. */

create table sefa3_employees(name, surname)
as select first_name, last_name, 12 * salary from employees;

/* ------------------| altertable add column statement |--------------------- */

select * from employees_copy;
/* we can add one or more than one columns to a table. */
alter table employees_copy
add birth_date date;

select * from employees_copy;

alter table employees_copy
    rename column birth_date to birth;
    
select * from employees_copy;

rename employees_copy to employees_copy99;

select * from employees_copy99;

alter table employees_copy99 rename to employees_copy;

select * from employees_copy;
/*----------------------------------------------------------------------------*/
select * from sefa_employees;

/* we can add multiple columns to a table and we can give 'default' value
   to a column. */
alter table sefa_employees
add (fax_number   number,
     fathers_name varchar2(50),
     passwords    varchar2(10) default 'abc123'
    );

select * from sefa_employees;

/* ------------------| altertable modify column statement |------------------ */

select * from sefa_employees;

/* we can change a column's data type, size or default value. */
alter table sefa_employees
modify fathers_name varchar2(100);

select * from sefa_employees;
/*----------------------------------------------------------------------------*/
select * from sefa_employees;

/* we can modify multiple columns of a table and we can give 'default'
   value to a column. */
alter table sefa_employees
modify (fax_number varchar2(11),
        passwords  varchar2(25) default 'fibo112358'
        );
/* but, modifying a column to a default value will affect only the new
   inserts, existing rows will not be affected. */
select * from sefa_employees;

/* -------------------| altertable drop column statement |------------------- */

select * from sefa_employees;

/* we can drop columns of a table that we no longer need. */
alter table sefa_employees
drop column fathers_name;

select * from sefa_employees;
/*----------------------------------------------------------------------------*/
select * from sefa_employees;

/* we can drop multiple columns of a table at a time. */
alter table sefa_employees
drop(fax_number,
     passwords
     );
     
select * from sefa_employees;

/* dropping column can not be recovered! */

/* -------------------------| truncate statement |--------------------------- */

select * from sefa_employees;

truncate table sefa_employees;

select * from sefa_employees;

/* -------------------------| truncate statement |--------------------------- */

comment on table sefa_employees is 'Sefanın çalışanları :DDD';

select * from user_tab_comments;

select * from user_tab_comments
    where
    table_name = 'sefa_employees';

select * from pison_kpis;

select * from user_col_comments;


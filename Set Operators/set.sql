select * from employees;

select * from departments;

select * from job_history;

/*
- 'set' operators combine the result of more than one query and return as
  one result.
*/

/* error : query block has incorrect number of result columns. 
   columns must be same data type(not names!).*/
select * from departments
    union
select * from employees;

select department_id from employees
    union
select department_id from departments;

/*-----------------------------| union operator |-----------------------------*/

/* returns rows of both queries with eliminating duplicate rows.*/

select job_id from job_history
    union
select job_id from employees
    where department_id = 80;
    
/*---------------------------| union all operator |---------------------------*/

/* return rows of both queries including duplicate rows. 
   columns must be same data type(not names!).*/

select job_id from job_history
    union all
select job_id from employees
    where department_id = 80;
    
/*---------------------------| intersect operator |---------------------------*/

/* return rows which exist in both queries. */

select job_id from job_history
    intersect
select job_id from employees
    where department_id = 80;
    
/*-----------------------------| minus operator |-----------------------------*/

/* return row which exist in first query but not exist in the second one. */

select job_id from job_history
    minus
select job_id from employees
    where department_id = 80;
    
/*-----------------------| matching unmatched queries |-----------------------*/

/* in 'set' operations, if a column does not exist in another table,
   we can match these columns with 'null' values. */
   
select job_id, null, first_name from employees
    where department_id = 80
    union
select job_id, department_id, null from job_history;

/*-----------------------| order by with set operators |----------------------*/

/* 
- order by clause is used only once at the end of the compound query.
- order by recognises the columns in only the first query.
- by default, the compound query is sorted with the first column
  of the first query.
*/

select job_id, department_id, first_name from employees
    where department_id = 80
    union
select job_id, department_id, null from job_history
order by department_id;

select job_id, department_id d from employees
    where department_id = 80
    union
select job_id, department_id from job_history
order by d;

/* error : invalid identifier. */
select job_id, department_id from employees
    where department_id = 80
    union
select job_id, department_id d from job_history
order by d;

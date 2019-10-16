/* result = 12.14 */
select round(12.136, 2) from dual;

/* result = 12 */
select round(12.136) from dual;

/* result = 12.13 */
select trunc(12.136, 2) from dual;

/* result = 12 */
select trunc(12.136) from dual;

/* result = 12 */
select trunc(12.136, 0) from dual;

/* result = 3 */
select ceil(2.67) from dual;

/* result = 13 */
select ceil(12.001) from dual;

/* result = 2 */
select floor(2.67) from dual;

/* result = 200 */
select mod(1800, 400) from dual;

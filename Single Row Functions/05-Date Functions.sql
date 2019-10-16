/* result = 16.10.2019 10:59:27 */
select sysdate from dual;

/* result = 16.12.2019 10:59:27 */
select sysdate, add_months(sysdate, 2) from dual;

/* result = 16.08.2019 10:59:27 */
select sysdate, add_months(sysdate, -2) from dual;

/* result = 16.04.2022 11:01:42 */
select sysdate, add_months(sysdate, 30) from dual;

/* result = 6.516... */
select months_between('03-SEP-15', '18-FEB-15') from dual;

/* result = 16.10.2019 11:10:14, 1.11.2019 */
select sysdate, round(sysdate, 'MONTH') from dual;

/* result = 16.10.2019 11:11:57, 1.01.2020 */
select sysdate, round(sysdate, 'YEAR') from dual;

/* result = 16.10.2019 11:13:16, 1.01.2019 */
select sysdate, trunc(sysdate, 'YEAR') from dual;

/* result = 9.06.2015 */
select next_day('04-JUN-15', 'TUESDAY') from dual;

/* result = 30.06.2015 */
select last_day('04-JUN-15') from dual;
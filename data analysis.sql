create database projects;
use projects;

select * from hr;

alter table hr
change column ï»¿id emp_id varchar(20) null;

desc hr;

select hire_date from hr;

-- set sql_safe_updates= 0;

update hr 
set birthdate = case 
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;	

alter table hr 
modify column birthdate DATE;

update hr 
set hire_date = case 
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

alter table hr 
modify column hire_date DATE;

update hr 
set termdate= date(str_to_date(termdate, '%Y-%m-%d%H:%i:%sUTC'))
where termdate is not null and termdate != '';

update hr 
set termdate= date(str_to_date('1000-01-01', "%Y-%m-%d"))
where termdate = '';

select termdate from hr;

alter table hr
modify column termdate date;

alter table hr add column age int;

select birthdate, age from hr;


select min(age) as youngest, max(age) oldest from hr;

update hr 
set age= timestampdiff(YEAR, birthdate, CURDATE());

select count(*)  as "age<18"
from hr
where age < 18; 






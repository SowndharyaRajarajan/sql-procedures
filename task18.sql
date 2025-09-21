-- Task -13
-- variables and in parameter task
-- 1. calculate total salary based on job role while using procedure(with different input values)
use import;

select * from emp_info; 

delimiter // 

create procedure total_salary_jobs ( in job_role varchar(50))
begin 
declare total_Sal int default 0;

select sum(salary) into total_sal 
from emp_info 
where job = job_role;

select job_role as job , total_sal  as total_salary; 

end // 

delimiter ; 

call total_salary_jobs('analyst');
call total_salary_jobs('clerk');



-- 2. display the individual report  based on dept_no while using procedure
-- (with different input values)

delimiter // 

create procedure report_deptno (in dept int)
begin 

select * from emp_info 
where dept_no = dept; 

end // 

delimiter ; 

call report_deptno (20);






-- 3. calculate the bonus amount for individual employees based on
-- emp_name while using procedure (with different input values and variables
 
 delimiter // 
 create procedure ind_bonus_amount ( in emp varchar(50)) 
 begin 
 
 declare emp_bonus int default 0 ; 
 
 select salary+5000 into emp_bonus from emp_info 
 where emp_name = emp; 
 
 select emp as employee , emp_bonus as bonus ; 
 end// 
 
 delimiter ; 
 
 call ind_bonus_amount ('smith');



-- Task-14:
-- variables task
-- calculate emp_count
-- calculate unique job count
-- calculate Total salary with bonus (bonus = 1000)
-- calculate exact salary (salary + bonus - commission)0 


delimiter // 

create procedure variable ()
begin
declare emp_count int default 0;
declare uniquejob_count int default 0;
declare totalsal_bonus int default 0 ;
declare exact_sal int default 0; 


select count(*) into emp_count from emp_info;
select count(distinct job) into uniquejob_count from emp_info;
select sum(Salary)+1000 into totalsal_bonus from emp_info;
select sum(salary)+1000 - ifnull(commission,0) from emp_info; 
end// 

delimiter ; 

call variable() ; 




-- Project on fetching details from different tables like Employees,
-- Jobs, departments, Countries, Location, Regions to know about all the details of employees
-- from united states of america country whose employeeid is not null 
-- also to have a salary range greater than or equal to 5000
-- and to order the result table by according to the  departments

use hr;
select 
	   -- Getting employee id, first name, last name, 
	   -- job_id, salary, department_id, email columns from employees table
	   e.employee_id,
	   e.first_name,
       e.last_name,
       e.job_id,
       e.salary,
       e.department_id,
       e.email,
       -- Taking job title, Minimum salary, Max salary
       j.job_title,
       j.min_salary,
       j.max_salary,
       -- Getting managerid and departmentname from department table 
       d.manager_id,
       d.department_name,
       -- Taking city, street address, postal code from locations table 
       l.city,
       l.street_address,
       l.postal_code,
       -- Taking countryid, countryname countries table 
	   c.country_id,
       c.country_name,
       -- Taking regionid, region name from regions table 
       r.region_id,
       r.region_name
       from employees e
       -- Joining employees table and Jobs table
       join
       jobs j
       on e.job_id= j.job_id
       -- Left Joining result table with Departments table
       left join
       departments d
       on  e.department_id=d.department_id
       -- Left Joining result table with locations table
       left join
       locations l
       on  d.location_id=l.location_id
	   -- Right Joining result table with countries table
       right join
       countries c
       on l.country_id=c.country_id
       -- Joining result table and regions table
       join
       regions r
       on c.region_id=r.region_id
       -- To eliminate the rows of employee id containing null
       -- And to get the persons who salary greater than 5000
       where employee_id is not null
	   and salary>=5000
	   -- Grouping the result by Employee id
       group by employee_id
       -- To fetch the details of employees from United states of america
       Having country_name= "United states of america"
       -- Ordering all the tables with department id in ascending order
	   order by department_id
       
             
       
       
       
       
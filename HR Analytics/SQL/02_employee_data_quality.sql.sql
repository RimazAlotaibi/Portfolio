-- Preview employee data
select * from employees limit 20;
 
-- Check for duplicate employee IDs
SELECT 
   count(employeeid) ,
   count(DISTINCT EmployeeID)
 FROM employees;

-- Check if termination date is before start date
SELECT 
   employeeid, 
   start_date, 
   termination_date
FROM employees
WHERE termination_date < start_date;

-- Check missing values across important employee columns
SELECT
    COUNT(*) AS total_employees,

    COUNT(*) FILTER (WHERE city IS NULL) AS missing_city,
    COUNT(*) FILTER (WHERE state IS NULL) AS missing_state,
    COUNT(*) FILTER (WHERE statefull IS NULL) AS missing_statefull,

    COUNT(*) FILTER (WHERE department IS NULL) AS missing_department,
    COUNT(*) FILTER (WHERE job_title IS NULL) AS missing_job_title,
    COUNT(*) FILTER (WHERE job_profile IS NULL) AS missing_job_profile,

    COUNT(*) FILTER (WHERE office IS NULL) AS missing_office,
    COUNT(*) FILTER (WHERE salary IS NULL) AS missing_salary,
    COUNT(*) FILTER (WHERE bonus_pct IS NULL) AS missing_bonus,

    COUNT(*) FILTER (WHERE start_date IS NULL) AS missing_start_date,
    COUNT(*) FILTER (WHERE dob IS NULL) AS missing_dob,
    COUNT(*) FILTER (WHERE active_status IS NULL) AS missing_active_status

FROM employees;



-- Check office values
SELECT DISTINCT office
FROM employees
ORDER BY office;

-- Check job profile values
SELECT DISTINCT job_profile
FROM employees
ORDER BY job_profile;

-- Check job title values
SELECT DISTINCT job_title
FROM employees
ORDER BY job_title;


-- Check for blank text values, not only NULL
SELECT *
FROM employees
WHERE TRIM(department) = ''
   OR TRIM(job_title) = ''
   OR TRIM(job_profile) = '';



-- Review employees with missing state values

SELECT EmployeeID,
first_name,
state,
city,statefull,office,job_title,job_profile
FROM employees
WHERE STATE IS NULL 
limit 15;

-- Review missing state values by office and country
SELECT office,country,state
FROM employees
WHERE STATE IS NULL
group by office,country,state;

-- Employee count by office
SELECT office,count(EmployeeID) AS Employees
FROM employees
GROUP BY office
ORDER BY Employees DESC;


-- Review distinct termination years
SELECT DISTINCT EXTRACT(year from termination_date) AS year_of_termination_date
FROM employees
ORDER BY year_of_termination_date;

-- Review termination dates for active employees after 2023
SELECT EmployeeID,start_date,termination_date,active_status,extract(year from termination_date) AS year_of_termination_date FROM employees
WHERE active_status = 'Active' and  extract(year from termination_date) > 2023;

-- Review active employees with termination years between 2009 and 2023
SELECT EmployeeID,start_date,termination_date,active_status,extract(year from termination_date) AS year_of_termination_date FROM employees
WHERE active_status = 'Active' and  extract(year from termination_date) BETWEEN 2009 AND 2023;

-- Employee count by country
SELECT country,count(*) FROM employees
GROUP BY country
ORDER BY country DESC;

-- Active vs. inactive employee count
SELECT active_Status,count(*) FROM employees
GROUP BY active_Status;

-- Employee count by age
SELECT age,count(*) FROM employees
GROUP BY age
ORDER BY age;

-- Validate employees over 60 by comparing stored age with age calculated from DOB

SELECT age,dob,active_status,Extract(year from age(current_date,dob))AS cal_age FROM employees
WHERE age >60;

-- Check department values
SELECT DISTINCT department
FROM employees;

-- Check unusual bonus percentages
SELECT DISTINCT bonus_pct
FROM employees
ORDER BY bonus_pct DESC;

-- Review unusually high bonus percentages
SELECT
    employeeid,
    job_title,
    level,
    bonus_pct
FROM employees
WHERE bonus_pct >= 0.5
ORDER BY bonus_pct DESC;

-- Review salary values by currency and job title
SELECT DISTINCT salary,currency,job_title FROM employees
ORDER BY salary DESC;

-- Check salary ranges by currency
SELECT
    currency,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY currency;

-- Average salary by department
SELECT 
    department,
    round(avg(salary)) AS avg_salary
FROM employees 
GROUP BY
    department
ORDER BY avg_salary DESC;

-- Top 3 highest-paid employees within each job title
SELECT * FROM(
    SELECT employeeid,
      job_title,salary,
       ROW_NUMBER() OVER (
         PARTITION BY job_title
       ORDER BY salary DESC, employeeid
) AS salary_rank
            FROM employees
)RANKED
WHERE salary_rank <=3;


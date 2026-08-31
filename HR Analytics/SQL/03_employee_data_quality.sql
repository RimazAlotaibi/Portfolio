-- Standardize active status values
UPDATE employees SET active_status = CASE
    WHEN active_status = '1' THEN 'Active'
    WHEN active_status = '0' THEN 'Inactive'
    ELSE active_status
END;

-- Trim all text columns
UPDATE employees
SET
    first_name = TRIM(first_name),
    surname = TRIM(surname),
    streetaddress = TRIM(streetaddress),
    city = TRIM(city),
    state = TRIM(state),
    statefull = TRIM(statefull),
    zipcode = TRIM(zipcode),
    country = TRIM(country),
    countryfull = TRIM(countryfull),
    office = TRIM(office),
    office_type = TRIM(office_type),
    department = TRIM(department),
    currency = TRIM(currency),
    job_title = TRIM(job_title),
    level = TRIM(level),
    active_status = TRIM(active_status),
    job_profile = TRIM(job_profile),
    notes = TRIM(notes);

-- Replace placeholder termination date
UPDATE employees
SET termination_date = NULL
WHERE termination_date = '2999-12-12'
AND active_status = 'Active';

-- Preview employee data
SELECT * FROM employees LIMIT 20;
 
-- Check for duplicate employee IDs
SELECT 
   COUNT(employeeid),
   COUNT(DISTINCT employeeid)
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
SELECT
employeeid,
first_name,
state,
city,
statefull,
office,
job_title,
job_profile
FROM employees
WHERE state IS NULL
LIMIT 15;

-- Review missing state values by office and country
SELECT office,country,state
FROM employees
WHERE state IS NULL
GROUP BY office,country,state;

-- Employee count by office
SELECT office,COUNT(employeeid) AS employees
FROM employees
GROUP BY office
ORDER BY employees DESC;

-- Review distinct termination years
SELECT DISTINCT EXTRACT(YEAR FROM termination_date) AS year_of_termination_date
FROM employees
ORDER BY year_of_termination_date;

-- Review termination dates for active employees after 2023
SELECT
employeeid,
start_date,
termination_date,
active_status,
EXTRACT(YEAR FROM termination_date) AS year_of_termination_date
FROM employees
WHERE active_status = 'Active'
AND EXTRACT(YEAR FROM termination_date) > 2023;

-- Review active employees with termination years between 2009 and 2023
SELECT
employeeid,
start_date,
termination_date,
active_status,
EXTRACT(YEAR FROM termination_date) AS year_of_termination_date
FROM employees
WHERE active_status = 'Active'
AND EXTRACT(YEAR FROM termination_date) BETWEEN 2009 AND 2023;

-- Employee count by country
SELECT country,COUNT(*)
FROM employees
GROUP BY country
ORDER BY country DESC;

-- Active vs. inactive employee count
SELECT active_status,COUNT(*)
FROM employees
GROUP BY active_status;

-- Employee count by age
SELECT age,COUNT(*)
FROM employees
GROUP BY age
ORDER BY age;

-- Validate employees over 60 by comparing stored age with age calculated from DOB
SELECT
age,
dob,
active_status,
EXTRACT(YEAR FROM AGE(current_date,dob)) AS cal_age
FROM employees
WHERE age > 60;

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
SELECT DISTINCT salary,currency,job_title
FROM employees
ORDER BY salary DESC;

-- Check salary ranges by currency
SELECT
    currency,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY currency;
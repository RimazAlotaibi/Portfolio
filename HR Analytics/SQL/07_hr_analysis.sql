-- Check for employee job profiles missing from the reference table
SELECT DISTINCT 
e.job_profile
FROM employees AS e
LEFT JOIN job_profiles AS jp
    ON jp.job_profile = e.job_profile
WHERE jp.job_profile IS NULL;

-- Join employee salary with reference compensation
SELECT DISTINCT
    eu.job_profile,
    jp.compensation,
    ROUND(eu.salary_usd,2) AS salary_usd
FROM employees_usd AS eu
LEFT JOIN job_profiles AS jp
    ON jp.job_profile = eu.job_profile
ORDER BY eu.job_profile;

-- Compare employee salary with reference compensation
SELECT
    eu.employeeid,
    eu.job_profile,
    jp.job_title,
    jp.compensation,
    ROUND(eu.salary_usd,2) AS salary_usd,
    CASE
        WHEN ROUND(eu.salary_usd,2) > ROUND(jp.compensation,2)
            THEN 'Above Compensation'
        WHEN ROUND(eu.salary_usd,2) < ROUND(jp.compensation,2)
            THEN 'Below Compensation'
        ELSE 'Equal Compensation'
    END AS compensation_status
FROM employees_usd AS eu
JOIN job_profiles AS jp
    ON jp.job_profile = eu.job_profile;

-- Employee count by salary comparison
SELECT
    CASE
        WHEN ROUND(eu.salary_usd,2) > ROUND(jp.compensation,2)
            THEN 'Above Compensation'
        WHEN ROUND(eu.salary_usd,2) < ROUND(jp.compensation,2)
            THEN 'Below Compensation'
        ELSE 'Equal Compensation'
    END AS compensation_status,
    COUNT(*) AS employee_count
FROM employees_usd AS eu
JOIN job_profiles AS jp
    ON jp.job_profile = eu.job_profile
GROUP BY
    CASE
        WHEN ROUND(eu.salary_usd,2) > ROUND(jp.compensation,2)
            THEN 'Above Compensation'
        WHEN ROUND(eu.salary_usd,2) < ROUND(jp.compensation,2)
            THEN 'Below Compensation'
        ELSE 'Equal Compensation'
    END
ORDER BY employee_count DESC;

-- Check if all employee offices exist in cost_of_living
SELECT DISTINCT e.office
FROM employees AS e
LEFT JOIN cost_of_living AS col
    ON e.office = col.office
WHERE col.office IS NULL;

-- Departments with the most employees earning below reference compensation
WITH underpaid_employees AS (
    SELECT
        eu.department,
        eu.salary_usd,
        eu.employeeid,
        jp.compensation
    FROM employees_usd AS eu
    JOIN job_profiles AS jp
        ON eu.job_profile = jp.job_profile
    WHERE ROUND(eu.salary_usd,2) < ROUND(jp.compensation,2)
)
SELECT
    department,
    COUNT(*) AS underpaid_employees
FROM underpaid_employees
GROUP BY department
ORDER BY underpaid_employees DESC;

-- Average salary by department
SELECT
    department,
    ROUND(AVG(salary_usd),2) AS avg_salary_usd
FROM employees_usd
GROUP BY department
ORDER BY avg_salary_usd DESC;

-- Top 3 highest-paid employees within each job title
SELECT *
FROM (
    SELECT
        employeeid,
        job_title,
        ROUND(salary_usd,2) AS salary_usd,
        ROW_NUMBER() OVER (
            PARTITION BY job_title
            ORDER BY salary_usd DESC,employeeid
        ) AS salary_rank
    FROM employees_usd
) ranked
WHERE salary_rank <= 3;
-- Check for employee job profiles missing from the reference table
SELECT DISTINCT 
e.job_profile
FROM employees AS e
LEFT JOIN job_profiles AS jp
    ON jp.job_profile = e.job_profile
WHERE jp.job_profile IS NULL;


-- Join employee salary with reference compensation
SELECT 
    DISTINCT e.job_profile,
    jp.compensation,
    e.salary
FROM employees AS e
LEFT JOIN job_profiles AS jp
    ON jp.job_profile = e.job_profile
ORDER BY e.job_profile;


-- Compare employee salary with reference compensation
SELECT
    e.job_profile,
    jp.job_title,
    jp.compensation,
    e.salary,
    CASE
        WHEN e.salary > jp.compensation THEN 'Greater than Compensation'
        WHEN e.salary < jp.compensation THEN 'Less than Compensation'
        ELSE 'Equal to Compensation'
    END AS salary_comparison
FROM employees AS e
LEFT JOIN job_profiles AS jp
    ON jp.job_profile = e.job_profile
ORDER BY e.job_profile;


-- Employee count by salary comparison
SELECT
    CASE
        WHEN e.salary > jp.compensation THEN 'Greater than Compensation'
        WHEN e.salary < jp.compensation THEN 'Less than Compensation'
        ELSE 'Equal to Compensation'
    END AS salary_comparison,
    COUNT(*) AS employee_count
FROM employees AS e
LEFT JOIN job_profiles AS jp
    ON jp.job_profile = e.job_profile
GROUP BY
    CASE
        WHEN e.salary > jp.compensation THEN 'Greater than Compensation'
        WHEN e.salary < jp.compensation THEN 'Less than Compensation'
        ELSE 'Equal to Compensation'
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
        e.department,
        e.salary,
        e.employeeid,
        jp.compensation
    FROM employees AS e
    JOIN job_profiles AS jp
        ON e.job_profile = jp.job_profile
    WHERE e.salary < jp.compensation
)
SELECT
    department,
    COUNT(*) AS underpaid_employees
FROM underpaid_employees
GROUP BY department
ORDER BY underpaid_employees DESC;
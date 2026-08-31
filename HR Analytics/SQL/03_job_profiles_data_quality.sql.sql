-- Preview job profile data
SELECT * FROM job_profiles;

-- Check duplicate job profile values
SELECT job_profile , count(*) FROM job_profiles
GROUP BY job_profile
HAVING count(*) > 1;

-- Check for NULL values
SELECT 
    COUNT(*) FILTER (WHERE job_profile IS NULL) AS missing_job_profile,
    COUNT(*) FILTER (WHERE department IS NULL) AS missing_department,
    COUNT(*) FILTER (WHERE job_title IS NULL) AS missing_job_title,
    COUNT(*) FILTER (WHERE compensation IS NULL) AS missing_compensation,
    COUNT(*) FILTER (WHERE level IS NULL) AS missing_level,
    COUNT(*) FILTER (WHERE bonus_pct IS NULL) AS missing_bonus_pct
FROM job_profiles;


-- Check department values
SELECT 
    DISTINCT department
FROM job_profiles;

-- Check level values
SELECT 
    DISTINCT level 
FROM job_profiles;

-- Check bonus percentage values
SELECT DISTINCT bonus_pct 
FROM job_profiles
ORDER BY bonus_pct DESC;


-- Check job title values
SELECT 
    DISTINCT job_title 
FROM job_profiles;


-- Check compensation range
SELECT 
    max(compensation) AS Max_compensation,
    min(compensation) AS Min_compensation,
    avg(compensation) AS Avg_compensation 
FROM job_profiles;




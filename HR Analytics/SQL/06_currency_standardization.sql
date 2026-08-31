-- Create salary view in USD
CREATE VIEW employees_usd AS
SELECT
    e.*,
    e.salary * r.rate_to_usd AS salary_usd
FROM employees AS e
LEFT JOIN exchange_rates AS r
    ON e.currency = r.currency;

-- Check for currencies without exchange rates
SELECT DISTINCT e.currency
FROM employees AS e
LEFT JOIN exchange_rates AS r
    ON e.currency = r.currency
WHERE r.currency IS NULL;

-- Review exchange rates
SELECT *
FROM exchange_rates;

-- Check missing converted salaries
SELECT COUNT(*) AS missing_salary_usd
FROM employees_usd
WHERE salary_usd IS NULL;
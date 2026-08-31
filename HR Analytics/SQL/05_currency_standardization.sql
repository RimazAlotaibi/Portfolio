CREATE VIEW employees_usd AS
SELECT
    e.*,
    e.salary * r.rate_to_usd AS salary_usd
FROM employees AS e
LEFT JOIN exchange_rates AS r
    ON e.currency = r.currency;

SELECT DISTINCT e.currency
FROM employees e
LEFT JOIN exchange_rates r
    ON e.currency = r.currency
WHERE r.currency IS NULL;

SELECT *
FROM exchange_rates;
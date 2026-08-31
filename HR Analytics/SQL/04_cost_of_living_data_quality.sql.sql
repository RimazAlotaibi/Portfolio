-- Preview cost of living data
SELECT * FROM cost_of_living;

-- Check for blank text values
SELECT * 
FROM cost_of_living
WHERE TRIM(office) = ''
    OR TRIM(currency) ='';

-- Check cost of living range
SELECT 
    Max(col_amount) AS Max_col ,
    min(col_amount) AS Min_col,
    avg(col_amount) AS Avg_col 
FROM cost_of_living;






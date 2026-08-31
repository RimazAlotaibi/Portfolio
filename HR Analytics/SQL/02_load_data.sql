-- Load job profile data first
COPY job_profiles
FROM 'path/to/2021.06_job_profile_mapping.tsv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER E'\t'
);

-- Load employee data
COPY employees
FROM 'path/to/CompanyData.tsv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER E'\t'
);

-- Load cost of living data
COPY cost_of_living
FROM 'path/to/2021.06_COL_2021.tsv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER E'\t'
);
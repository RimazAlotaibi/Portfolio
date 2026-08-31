CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Surname VARCHAR(100),
    StreetAddress VARCHAR(200),
    City VARCHAR(100),
    State VARCHAR(100),
    StateFull VARCHAR(100),
    ZipCode VARCHAR(20),
    Country VARCHAR(100),
    CountryFull VARCHAR(100),
    Age INT,
    Office VARCHAR(100),
    Start_Date DATE,
    Termination_Date DATE,
    Office_Type VARCHAR(100),
    Department VARCHAR(100),
    Currency VARCHAR(3),
    Bonus_pct DECIMAL(5, 2),
    Job_title VARCHAR(100),
    DOB DATE,
    level VARCHAR(100),
    Salary DECIMAL(10, 2),
    Active_Status TEXT,
    Job_Profile TEXT,
    Notes TEXT
);
CREATE TABLE job_profiles (
    Department TEXT,
    Job_title TEXT,
    Job_Profile	TEXT PRIMARY KEY,
    Compensation INT,	
    Level VARCHAR(100),
    Bonus_Pct DECIMAL(5, 2)
);
CREATE TABLE cost_of_living (
    Office VARCHAR(100),
    COL_Amount INT,
    Currency VARCHAR(3)
);



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

ALTER TABLE employees
ADD CONSTRAINT fk_employee_job_profile
FOREIGN KEY (job_profile)
REFERENCES job_profiles(job_profile);

UPDATE job_profiles SET 
department = TRIM(department),
level = TRIM(level),
job_title = TRIM(job_title),
job_profile = TRIM(job_profile);

UPDATE employees 
    SET Termination_Date =NULL 
    WHERE Termination_Date = '2999-12-12' AND Active_Status= 'Active'
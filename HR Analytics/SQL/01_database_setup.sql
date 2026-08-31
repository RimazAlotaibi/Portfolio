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
    Job_Profile TEXT PRIMARY KEY,
    Compensation INT,
    Level VARCHAR(100),
    Bonus_Pct DECIMAL(5, 2)
);

CREATE TABLE cost_of_living (
    Office VARCHAR(100),
    COL_Amount INT,
    Currency VARCHAR(3)
);

CREATE TABLE exchange_rates (
    currency VARCHAR(3) PRIMARY KEY,
    rate_to_usd DECIMAL(10,6)
);

INSERT INTO exchange_rates (currency, rate_to_usd)
VALUES
    ('USD', 1.000000),
    ('GBP', 1.383100),
    ('JPY', 0.009003),
    ('NOK', 0.116268),
    ('HKD', 0.128763);

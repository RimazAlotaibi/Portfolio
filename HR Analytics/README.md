# HR Analytics - SQL & Power BI

## Project Overview

This project analyzes employee and compensation data using **PostgreSQL, SQL, Power BI, and DAX**.

The goal of the project was to clean and validate HR data, analyze workforce and compensation patterns, standardize salaries across multiple currencies, and build an interactive Power BI dashboard.

---

## Dashboard

![HR Analytics Dashboard](HR_Dashboard.gif)

---

## Tools Used

- PostgreSQL
- SQL
- Power BI
- DAX

---

## Dataset

The project uses selected datasets from **The Company Data**:

- `CompanyData.tsv` - Core employee and HCM data
- `2021.06_job_profile_mapping.tsv` - Job profile and compensation reference data
- `2021.06_COL_2021.tsv` - Cost of living data

The project focuses on employee, job profile, salary, compensation, office, and employment status information.

---

## SQL Analysis

PostgreSQL was used to create the database structure, clean and validate the data, standardize salaries, and perform HR analysis.

### Data Preparation & Cleaning

The main data preparation steps included:

- Created the employee, job profile, cost of living, and exchange rate tables
- Checked for duplicate Employee IDs
- Checked NULL and blank values
- Standardized employee status into `Active` and `Inactive`
- Trimmed text columns
- Investigated missing state values
- Checked termination dates against employee start dates
- Replaced placeholder termination dates with `NULL` for active employees
- Validated employee age against date of birth
- Reviewed unusual bonus percentages
- Reviewed salary ranges across multiple currencies
- Validated employee job profiles against the reference table
- Validated office values against the cost of living table

### Currency Standardization

Employee salaries were stored in multiple currencies:

- USD
- GBP
- JPY
- NOK
- HKD

To make salary comparisons consistent, I created an exchange-rate table and standardized employee salaries to USD.

A SQL view called `employees_usd` was created using:

```sql
salary_usd = salary * rate_to_usd
```

This standardized salary was also used in Power BI.

### SQL Techniques Used

- `JOIN`
- `LEFT JOIN`
- `CASE`
- `CTE`
- `GROUP BY`
- Aggregate functions
- `ROW_NUMBER()`
- Data validation queries
- Views

---

## Power BI Dashboard

After preparing the data in PostgreSQL, the data was connected to Power BI to build an interactive HR analytics dashboard.

### Data Model

Relationships were created between:

- Employees and Job Profiles
- Employees and Cost of Living
- Employees and Exchange Rates

### DAX Measures

The dashboard includes measures for:

- Total Employees
- Active Employees
- Inactive Employees
- Average Salary USD
- Average Bonus
- Employees Below Compensation
- Employees Above Compensation
- Employees Equal Compensation
- Below Compensation Rate

### Dashboard Visuals

The dashboard includes:

- Total Employees by Office
- Employee Count by Department
- Compensation Status
- Top 5 Job Titles by Average Salary USD
- Average Salary USD by Department

### Interactive Filters

The dashboard can be filtered by:

- Department
- Office
- Job Title
- Level
- Active Status

---

## Key Insights

- The company has **4,968 employees**
- **3,113 employees are active**
- **1,855 employees are inactive**
- Technology is the largest department with **1,915 employees**
- NYC has the highest employee count with **1,796 employees**
- The average standardized salary is approximately **$74.42K**
- Technology has the highest average department salary at approximately **$88K**
- Customer Service has the lowest average department salary at approximately **$56K**
- **4,225 employees** are below the reference compensation level
- The below compensation rate is approximately **85.04%**
- The average employee bonus is approximately **16.07%**
- The CEO has the highest average salary among job titles at approximately **$500K**

---

## Project Files

### SQL


- [Database Setup](SQL/01_database_setup.sql)
- [Load Data](SQL/02_load_data.sql)
- [Employee Data Quality](SQL/03_employee_data_quality.sql)
- [Job Profiles Data Quality](SQL/04_job_profiles_data_quality.sql)
- [Cost of Living Data Quality](SQL/05_cost_of_living_data_quality.sql)
- [Currency Standardization](SQL/06_currency_standardization.sql)
- [HR Analysis](SQL/07_hr_analysis.sql)

### Power BI

- [Power BI Dashboard File](HR.pbix)

### Dashboard Demo

- [HR Dashboard GIF](HR_Dashboard.gif)

---

## Assumptions & Notes

- Salaries were standardized to USD before cross-currency salary analysis
- The compensation field from the job profile mapping was treated as the reference compensation value
- Placeholder termination dates for active employees were converted to `NULL`
- Missing state values were retained when the field was not applicable to the employee's location
---

## Dataset Source

**The Company Data - Koluit**

https://github.com/Koluit/The_Company_Data

---

## Conclusion

This project demonstrates an end-to-end HR analytics workflow using SQL and Power BI.

SQL was used for database setup, data cleaning, validation, transformation, and analysis.

Power BI was used to create the data model, DAX measures, interactive filters, and dashboard visualizations to communicate HR and compensation insights.


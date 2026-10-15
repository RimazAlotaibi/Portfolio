# Automotive Transportation & Operational Performance Analysis

**SQL Server | Power BI | DAX | Data Quality | Operational Analytics | Process Improvement**

## Project Overview

An end-to-end automotive transportation analytics project focused on evaluating delivery performance, identifying operational inefficiencies, and recommending process improvements.

The project analyzes **11,200 transportation orders** to assess carrier performance, delivery delays, route efficiency, assignment response times, and operational exceptions.

**Note:** This project uses synthetic data for portfolio and educational purposes.

## Dashboard Preview

![Automotive Transportation Dashboard](Automotive Transportation & Operational Performance Analysis/Automotive_Dashboard_2x.gif)

### 1. Operations Overview

![Operations Overview](Automotive Transportation & Operational Performance Analysis/images/Operations_Overview.jpeg)

### 2. Carrier & Route Performance

![Carrier Route Performance](Automotive Transportation & Operational Performance Analysis/images/Carrier_Route_Performance.jpeg)

### 3. Assignment & Operational Exceptions

![Operational Exceptions](Automotive Transportation & Operational Performance Analysis/images/Operational_Exceptions.jpeg)

## Business Objectives

- Evaluate delivery performance against service targets.
- Compare carrier efficiency across routes.
- Identify patterns associated with delivery delays.
- Assess carrier assignment response times.
- Monitor overdue shipments and operational exceptions.
- Recommend improvements to transportation workflows.

## Tools & Technologies

| Tool | Application |
|---|---|
| SQL Server | Data exploration, quality checks, and data validation |
| Power BI | Data modeling, interactive dashboards, and business analysis |
| DAX | KPI calculations and operational performance measures |
| Draw.io | AS-IS and TO-BE process mapping |

## Project Workflow

**1. Business Requirements**

Defined operational challenges, business questions, and performance indicators.

**2. Data Exploration & Quality Checks**

Explored transportation data, verified table relationships, checked missing and duplicate records, and identified data quality exceptions.

**3. Data Modeling & KPI Development**

Developed relationships and measures for delivery performance, carrier efficiency, assignment response times, and shipment exceptions.

**4. Operational Analysis**

Investigated performance differences across carriers, routes, congestion conditions, and assignment activities.

**5. Process Mapping & Improvement**

Documented the current transportation workflow and designed a proposed improved process with service-level monitoring, exception alerts, and escalation procedures.

**6. Executive Reporting**

Summarized operational findings, business risks, recommended actions, and management priorities.

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Orders | 11,200 |
| Completed Deliveries | 10,000 |
| On-Time Delivery Rate | 65.94% |
| Late Delivery Rate | 34.06% |
| Average On-Time Target | 92.18% |
| Performance Gap | −26.24 pp |
| Average Delivery Duration | 47.81 hrs |
| Active Shipments | 1,200 |
| Overdue Shipments | 254 |

## Key Findings

- **Delivery Performance:** The on-time delivery rate was 26.24 percentage points below the average service target.
- **Carrier Efficiency:** Horizon Car Haulers achieved the highest on-time performance at 69.00%, while Desert Fleet Logistics recorded 63.17%.
- **Congestion:** High-congestion shipments recorded a late delivery rate of 40.43%, compared with 30.88% under low congestion.
- **Route Performance:** Riyadh–Jazan recorded a 48.98% late delivery rate across 49 completed deliveries.
- **Assignment Efficiency:** Average response time for accepted carrier assignments reached 590.51 minutes.
- **Operational Exceptions:** 254 active shipments were overdue at the reporting reference date.

These findings identify operational patterns and investigation priorities rather than confirmed causal relationships.

## Process Mapping & Improvement

### AS-IS — Current Transportation Process

![Current Transportation Process](Automotive Transportation & Operational Performance Analysis/images/AS-IS.png)

The current-state model represents order creation, carrier assignment, vehicle dispatch, shipment tracking, and delivery confirmation.

### TO-BE — Proposed Improved Transportation Process

![Improved Transportation Process](Automotive Transportation & Operational Performance Analysis/images/TO-BE_Improved_Transportation_Process.drawio.png)

The proposed process introduces:

- Carrier response SLA monitoring.
- Standardized carrier reassignment procedures.
- Dispatch delay alerts.
- Shipment deadline monitoring.
- Overdue shipment escalation.
- Proof-of-delivery verification.

These are proposed improvements and have not been deployed in a live operational environment.

## Business Recommendations

1. Strengthen carrier performance and SLA monitoring.
2. Standardize carrier assignment and rejection-handling procedures.
3. Prioritize overdue shipments through exception management.
4. Improve dispatch monitoring and route performance reviews.
5. Strengthen delivery confirmation and operational data quality.


## Project Outcome

This project demonstrates the ability to transform operational data into actionable business insights through data validation, KPI development, interactive reporting, diagnostic analysis, and process improvement recommendations.

**Disclaimer:** All data is synthetic. Operational improvements are proposed and have not been tested through real-world implementation.
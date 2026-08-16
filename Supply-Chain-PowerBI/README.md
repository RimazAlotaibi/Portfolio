# Supply Chain Performance Dashboard - Power BI

An interactive Power BI dashboard for analyzing sales, profitability, delivery performance, suppliers, warehouses, stockouts, and returns.

![Dashboard Demo](images/dashboard-demo.gif)

## Key Results

- **Net Sales:** SAR 62.18M
- **Profit:** SAR 16.04M
- **Profit Margin:** 25.79%
- **Total Orders:** 5,960
- **Return Rate:** 8.75%
- **Stockout Rate:** 8.76%
- **On-Time Delivery:** 74.80%
- **Late Delivery:** 25.20%

## Charts

- **KPI cards** provide a quick executive view of sales, profit, orders, returns, stockouts, and delivery performance.
- **Line charts** compare monthly sales, profit, and late deliveries across 2024 and 2025.
- **Bar and column charts** rank categories, products, regions, suppliers, warehouses, and shipping methods.
- **Scatter plots with trend lines** examine the relationships between discounts, sales, profit margin, stockouts, and supplier lead time.
- **The order-status donut chart** separates fully delivered, partially cancelled, and cancelled orders without overlap.

![Delivery Analysis](images/delivery-inventory.png)

## Functions

- **`SUM` and `SUMX`** aggregate financial values and calculate total discounts.
- **`DISTINCTCOUNT`** counts every order once, even when it contains multiple product lines.
- **`CALCULATE`** applies year, status, supplier, return, stockout, and delivery conditions.
- **`DIVIDE`** creates safe percentage and ratio calculations.
- **`VALUES`, `EXCEPT`, and `INTERSECT`** create unique order groups and prevent overlapping classifications.

## Data Validation

- Removed zero and negative quantities to prevent incorrect financial results.
- Recalculated gross sales, net sales, product cost, and profit using validated fields.
- Used distinct order IDs to avoid double counting multi-line orders.
- Separated fully delivered, partially cancelled, and fully cancelled orders.
- Made on-time and late-delivery groups mutually exclusive, producing rates that total 100%.
- Used delivered orders as the return-rate denominator because cancelled orders cannot be returned.
- Validated the star schema and its active many-to-one relationships.
- Disabled year filtering for static supplier and warehouse reference metrics.

## Key Business Insights

- Personal Care generated the highest sales and profit.
- The Western region produced the highest profit.
- Suppliers 19, 05, and 11 had the highest late-delivery rates.
- Delivery reliability is the main operational risk, with 25.20% of delivered orders arriving late.

## Tools

Power BI · Power Query · DAX · Data Modeling · Data Validation · Business Analysis

## Open the Dashboard

Download [`/Supply Chain.pbix`](/Supply%20Chain.pbix) and open it in Power BI Desktop.


# FLO SQL Case Study

This case study uses FLO omnichannel customer data to practice SQL through customer, channel, and revenue questions.

The dataset contains **19,945 customer records**. Each row represents a customer and includes online/offline purchase counts, customer value, first/last purchase dates, last order channel, and category-interest information.

![FLO and Northwind practice overview](./assets/flo-northwind-overview.jpg)

## Dataset Overview

![FLO dataset dictionary](./assets/flo-data-dictionary.jpg)

| Column | Description |
|---|---|
| `master_id` | Unique customer ID |
| `order_channel` | Channel/platform used for shopping |
| `last_order_channel` | Channel of the latest purchase |
| `first_order_date` | First purchase date |
| `last_order_date` | Last purchase date |
| `last_order_date_online` | Latest online purchase date |
| `last_order_date_offline` | Latest offline purchase date |
| `order_num_total_ever_online` | Total online purchase count |
| `order_num_total_ever_offline` | Total offline purchase count |
| `customer_value_total_ever_online` | Total online customer value |
| `customer_value_total_ever_offline` | Total offline customer value |
| `interested_in_categories_12` | Category list from the last 12 months |

## Questions Covered

The SQL file contains selected exercises chosen to reinforce the most useful concepts for an entry-level Data Analyst workflow:

- Total purchase count and total revenue
- Average revenue per purchase
- Purchase count and revenue by last order channel
- Average revenue per purchase by last order channel
- Filtering non-offline customers with online spend above 1,000
- Online order volume by category-list combination and order channel
- Total purchase count by category-list combination and last order channel
- Top 50 customers by total purchase count
- Exact vs. partial `AKTIFSPOR` matching
- Course exercise for online-order month analysis

## Key Results

| KPI | Result |
|---|---:|
| Total purchases | 100,219 |
| Total revenue | 14,983,567.31 |
| Average revenue per purchase | 149.51 |
| Highest average revenue per purchase | iOS App — 164.64 |
| Lowest average revenue per purchase | Mobile — 143.62 |

The channel comparison shows why volume and value should be evaluated separately. A channel can have a higher average value per purchase without necessarily having the highest total activity.

## Important Data Notes

### Monthly analysis limitation

`order_num_total_ever_online` is a cumulative customer-level measure, while `last_order_date_online` only stores the customer's latest online purchase date.

For that reason, the related course exercise groups cumulative online purchase counts by the **month of each customer's latest online purchase**. This should not be interpreted as a true transaction-level monthly order time series. A transaction table with one row per order would be required for that analysis.

### Category field structure

`interested_in_categories_12` is stored as a list-like text field such as:

```text
[ERKEK, KADIN, AKTIFSPOR]
```

In the selected exercises, each full category-list combination is treated as one group. Splitting and analysing each category separately would require additional string-processing logic.

## SQL Skills Used

`SUM` · `ROUND` · `WHERE` · `AND` · `<>` · `LIKE` · `GROUP BY` · `ORDER BY` · `TOP` · `YEAR` · `MONTH`

## Files

- [`flo_case_study.sql`](./flo_case_study.sql) — selected FLO SQL solutions
- [`assets/`](./assets/) — dataset reference visuals

## Data Source

The exercises are based on Miuul Data Analytics Bootcamp practice materials. The course PDFs are referenced instead of being uploaded to this repository:

- [FLO SQL Practice - Exercise 1](https://import.cdn.thinkific.com/682699/IyM8YQeTWi4kzxKSIzCw_A%20%C3%96dev%20Al%C4%B1%C5%9Ft%C4%B1rma%201.pdf)
- [FLO SQL Practice - Exercise 2](https://import.cdn.thinkific.com/682699/SWEnDMTaT2CjLNizUVnq_A%20%C3%96dev%20Al%C4%B1%C5%9Ft%C4%B1rma%202.pdf)

> SQL queries and explanations in this repository are my own work. The raw dataset is not redistributed here.

## Author

**Hüseyin Yanmaz**  
Statistics Student | Data Analyst Candidate

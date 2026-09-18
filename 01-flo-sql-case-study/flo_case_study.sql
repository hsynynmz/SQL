/*
    FLO SQL Case Study
    Dataset: FLO Omnichannel Customer Data
    Database: SQL Server

    Selected exercises focused on KPI calculation, grouping, filtering,
    ranking, text matching, and customer/channel analysis.
*/

-- ============================================================
-- Q03 - Total number of purchases and total revenue
-- ============================================================
SELECT
    SUM(order_num_total_ever_online)
        + SUM(order_num_total_ever_offline) AS total_orders,
    ROUND(
        SUM(customer_value_total_ever_online)
        + SUM(customer_value_total_ever_offline),
        2
    ) AS total_revenue
FROM flo;


-- ============================================================
-- Q04 - Average revenue per purchase
-- ============================================================
SELECT
    ROUND(
        (SUM(customer_value_total_ever_online)
         + SUM(customer_value_total_ever_offline))
        /
        NULLIF(
            SUM(order_num_total_ever_online)
            + SUM(order_num_total_ever_offline),
            0
        ),
        2
    ) AS avg_revenue_per_order
FROM flo;


-- ============================================================
-- Q05 - Total purchases and revenue by last order channel
-- ============================================================
SELECT
    last_order_channel,
    SUM(order_num_total_ever_online)
        + SUM(order_num_total_ever_offline) AS total_orders,
    ROUND(
        SUM(customer_value_total_ever_online)
        + SUM(customer_value_total_ever_offline),
        2
    ) AS total_revenue
FROM flo
GROUP BY last_order_channel
ORDER BY total_revenue DESC;


-- ============================================================
-- Q07 - Average revenue per purchase by last order channel
-- ============================================================
SELECT
    last_order_channel,
    ROUND(
        (SUM(customer_value_total_ever_online)
         + SUM(customer_value_total_ever_offline))
        /
        NULLIF(
            SUM(order_num_total_ever_online)
            + SUM(order_num_total_ever_offline),
            0
        ),
        2
    ) AS avg_revenue_per_order
FROM flo
GROUP BY last_order_channel
ORDER BY avg_revenue_per_order DESC;


-- ============================================================
-- Q11 - Non-offline customers with online spend above 1,000
-- ============================================================
SELECT
    master_id,
    order_channel,
    customer_value_total_ever_online
FROM flo
WHERE order_channel <> 'Offline'
  AND customer_value_total_ever_online > 1000
ORDER BY customer_value_total_ever_online DESC;


-- ============================================================
-- Q15 - Online order volume by category-list combination and channel
-- ============================================================
SELECT
    interested_in_categories_12,
    order_channel,
    SUM(order_num_total_ever_online) AS total_online_orders
FROM flo
GROUP BY
    interested_in_categories_12,
    order_channel
ORDER BY total_online_orders DESC;


-- ============================================================
-- Q16 - Total purchase count by last order channel and category-list combination
-- ============================================================
SELECT
    last_order_channel,
    interested_in_categories_12,
    SUM(order_num_total_ever_online)
        + SUM(order_num_total_ever_offline) AS total_orders
FROM flo
GROUP BY
    last_order_channel,
    interested_in_categories_12
ORDER BY total_orders DESC;


-- ============================================================
-- Q17 - Top 50 customers by total purchase count
-- ============================================================
SELECT TOP 50
    master_id,
    order_num_total_ever_online
        + order_num_total_ever_offline AS total_orders
FROM flo
ORDER BY
    total_orders DESC,
    master_id ASC;


-- ============================================================
-- Q20 - Customers interested only in AKTIFSPOR
-- ============================================================
SELECT
    master_id,
    interested_in_categories_12,
    order_channel
FROM flo
WHERE interested_in_categories_12 = '[AKTIFSPOR]';


-- ============================================================
-- Q21 - Customers whose category list contains AKTIFSPOR
-- ============================================================
SELECT
    master_id,
    interested_in_categories_12,
    order_channel
FROM flo
WHERE interested_in_categories_12 LIKE '%AKTIFSPOR%';


-- ============================================================
-- Q25 - Course exercise: latest-online-order month with the highest
--       grouped cumulative online purchase count
-- ============================================================
-- Important:
-- order_num_total_ever_online is cumulative at customer level.
-- last_order_date_online is only the latest online purchase date.
-- Therefore, this is not a true transaction-level monthly time series.
SELECT TOP 1
    YEAR(last_order_date_online) AS order_year,
    MONTH(last_order_date_online) AS order_month,
    SUM(order_num_total_ever_online) AS total_online_orders,
    ROUND(SUM(customer_value_total_ever_online), 2) AS total_online_revenue
FROM flo
GROUP BY
    YEAR(last_order_date_online),
    MONTH(last_order_date_online)
ORDER BY
    total_online_orders DESC,
    order_year ASC,
    order_month ASC;

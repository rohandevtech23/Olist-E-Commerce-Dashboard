-- Total Revenue 
SELECT
    ROUND(SUM(price),2) AS total_revenue
FROM analytics.fact_sales;

-- Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM analytics.fact_sales;

-- Top 10 Product Categories by Revenue
SELECT
    dp.product_category,
    ROUND(SUM(fs.price),2) AS revenue
FROM analytics.fact_sales fs
JOIN analytics.dim_products dp
ON fs.product_id = dp.product_id
GROUP BY dp.product_category
ORDER BY revenue DESC
LIMIT 10;

-- Top 10 States by Revenue

SELECT
    dc.customer_state,
    ROUND(SUM(fs.price),2) AS revenue
FROM analytics.fact_sales fs
JOIN analytics.dim_orders o
    ON fs.order_id = o.order_id
JOIN analytics.dim_customers dc
    ON o.customer_id = dc.customer_id
GROUP BY dc.customer_state
ORDER BY revenue DESC;

-- Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(fs.price),2) AS revenue
FROM analytics.fact_sales fs
JOIN analytics.dim_orders o
    ON fs.order_id = o.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY month;

-- Average Order Value (AOV)
SELECT
    ROUND(
        SUM(price) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM analytics.fact_sales;

-- Top 10 Sellers by Revenue
SELECT
    ds.seller_state,
    fs.seller_id,
    ROUND(SUM(fs.price),2) AS revenue
FROM analytics.fact_sales fs
JOIN analytics.dim_sellers ds
    ON fs.seller_id = ds.seller_id
GROUP BY
    ds.seller_state,
    fs.seller_id
ORDER BY revenue DESC
LIMIT 10;

-- Average Delivery Time
SELECT
    ROUND(
        AVG(
            EXTRACT(
                DAY FROM (
                    order_delivered_customer_date
                    - order_purchase_timestamp
                )
            )
        ),
        2
    ) AS avg_delivery_days
FROM analytics.dim_orders
WHERE order_delivered_customer_date IS NOT NULL;
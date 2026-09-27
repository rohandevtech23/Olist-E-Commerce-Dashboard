-- CREATE TABLE analytics.dim_customers AS
-- SELECT
--     customer_id,
--     customer_unique_id,
--     customer_city,
--     customer_state
-- FROM olist.customers_raw;


-- CREATE TABLE analytics.dim_products AS
-- SELECT
--     p.product_id,
--     COALESCE(
--         ct.product_category_name_english,
--         'Unknown Category'
--     ) AS product_category,
--     p.product_weight_g,
--     p.product_length_cm,
--     p.product_height_cm,
--     p.product_width_cm
-- FROM olist.products_raw p
-- LEFT JOIN olist.category_translation_raw ct
--     ON p.product_category_name = ct.product_category_name;

-- SELECT COUNT(*)
-- FROM analytics.dim_products;


-- CREATE TABLE analytics.dim_sellers AS
-- SELECT
--     seller_id,
--     seller_city,
--     seller_state
-- FROM olist.sellers_raw;


-- CREATE TABLE analytics.dim_orders AS
-- SELECT
--     order_id,
--     customer_id,
--     order_status,
--     order_purchase_timestamp,
--     order_approved_at,
--     order_delivered_carrier_date,
--     order_delivered_customer_date,
--     order_estimated_delivery_date
-- FROM olist.orders_raw;

-- CREATE TABLE analytics.fact_sales AS
-- SELECT
--     oi.order_id,
--     oi.order_item_id,
--     oi.product_id,
--     oi.seller_id,
--     oi.price,
--     oi.freight_value,
--     p.payment_type,
--     p.payment_value
-- FROM olist.order_items_raw oi
-- LEFT JOIN olist.payments_raw p
--     ON oi.order_id = p.order_id;




-- -- Verify
-- SELECT COUNT(*) FROM analytics.dim_sellers;


-- -- Verify
-- SELECT COUNT(*) FROM analytics.dim_orders;


-- SELECT COUNT(*)
-- FROM analytics.fact_sales;


-- SELECT
--     COUNT(*) AS total_payment_rows,
--     COUNT(DISTINCT order_id) AS unique_orders
-- FROM olist.payments_raw;

SELECT
    COUNT(*) AS total_payment_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM olist.payments_raw;
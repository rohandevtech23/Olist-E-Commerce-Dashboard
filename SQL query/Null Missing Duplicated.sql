-- SELECT
--     COUNT(*) FILTER (WHERE order_purchase_timestamp IS NULL) AS purchase_nulls,
--     COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS delivered_nulls,
--     COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS estimated_nulls
-- FROM olist.orders_raw;

-- SELECT
--     COUNT(*) FILTER (WHERE product_category_name IS NULL) AS category_nulls,
--     COUNT(*) FILTER (WHERE product_weight_g IS NULL) AS weight_nulls,
--     COUNT(*) FILTER (WHERE product_length_cm IS NULL) AS length_nulls,
--     COUNT(*) FILTER (WHERE product_height_cm IS NULL) AS height_nulls,
--     COUNT(*) FILTER (WHERE product_width_cm IS NULL) AS width_nulls
-- FROM olist.products_raw;

-- SELECT
--     COUNT(*) FILTER (WHERE review_comment_title IS NULL) AS title_nulls,
--     COUNT(*) FILTER (WHERE review_comment_message IS NULL) AS message_nulls
-- FROM olist.reviews_raw;

-- SELECT
--     COUNT(*) FILTER (WHERE customer_city IS NULL) AS city_nulls,
--     COUNT(*) FILTER (WHERE customer_state IS NULL) AS state_nulls
-- FROM olist.customers_raw;

-- SELECT
--     COUNT(*) FILTER (WHERE seller_city IS NULL) AS city_nulls,
--     COUNT(*) FILTER (WHERE seller_state IS NULL) AS state_nulls
-- FROM olist.sellers_raw;


-- SELECT
--     order_status,
--     COUNT(*)
-- FROM olist.orders_raw
-- WHERE order_delivered_customer_date IS NULL
-- GROUP BY order_status
-- ORDER BY COUNT(*) DESC;
USE olist_project;

-- ANALYSIS 1: ORDER STATUS DISTRIBUTION


SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- ==========================================
-- ANALYSIS 2: MONTHLY ORDERS
-- ==========================================

SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_purchase_timestamp, '%Y-%m')
ORDER BY order_month;


-- ==========================================
-- ANALYSIS 3: MONTHLY REVENUE
-- ==========================================

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY order_month;


-- ==========================================
-- ANALYSIS 4: AVERAGE ORDER VALUE
-- ==========================================

SELECT
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

-- ==========================================
-- ANALYSIS 5: TOP PRODUCT CATEGORIES BY REVENUE
-- ==========================================

SELECT
    COALESCE(p.product_category_name, 'Unknown') AS product_category,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY COALESCE(p.product_category_name, 'Unknown')
ORDER BY total_revenue DESC
LIMIT 10;


-- ==========================================
-- ANALYSIS 6: TOP PRODUCTS BY ITEMS SOLD
-- ==========================================

SELECT
    oi.product_id,
    COUNT(*) AS total_items_sold
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_items_sold DESC
LIMIT 10;


-- ==========================================
-- ANALYSIS 7: SELLER PERFORMANCE
-- ==========================================

SELECT
    oi.seller_id,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY total_items_sold DESC
LIMIT 10;


-- ==========================================
-- ANALYSIS 8: PAYMENT METHOD ANALYSIS
-- ==========================================

SELECT
    payment_type,
    COUNT(*) AS total_payments,
    ROUND(SUM(payment_value), 2) AS total_payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- ==========================================
-- ANALYSIS 9: REVIEW SCORE DISTRIBUTION
-- ==========================================

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;


-- ==========================================
-- ANALYSIS 10: AVERAGE DELIVERY TIME
-- ==========================================

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


Use Olist_Brazilian;
---  01. DATA UNDERSTANDING:-
-- View all tables
Select * From olist_customers_dataset;
Select * From olist_geolocation_dataset;
Select * From olist_order_items_dataset ;
Select * From olist_order_payments_dataset;
Select * From olist_order_reviews_dataset;
Select * From olist_orders_dataset;
Select * From olist_products_dataset;
Select * From olist_sellers_dataset;
Select * From product_category_name_translation;
--- 02. DATA QUALITY:-
-- 1/ Nulls Check 
Select *
From olist_customers_dataset
Where customer_id Is Null ;
-- 
Select *
From olist_order_items_dataset
Where Order_id Is Null ;
-- 
Select *
From olist_order_items_dataset
Where product_id Is Null ;
--
Select * 
From olist_orders_dataset
Where order_status Is Null;
-- 
Select * 
From olist_order_reviews_dataset
Where review_id Is Null;
-- 2/Duplicates Check
Select  customer_id,Count(*) AS Duplicate_Count
From olist_customers_dataset
Group BY customer_id
Having Count(*)>1;
-- 
Select order_id,Count (*) AS Duplicate_Count
From olist_orders_dataset 
Group By order_id
Having Count (*)>1;
-- 
Select product_id,Count (*) AS Duplicate_Count
From olist_products_dataset 
Group By product_id
Having Count (*)>1;
-- 
Select seller_id,Count (*) AS Duplicate_Count
From olist_sellers_dataset
Group By seller_id
Having Count (*)>1;
--
Select review_id,Count (*) AS Duplicate_Count
From olist_order_reviews_dataset
Group By review_id
Having Count (*)>1;
--- 03/INVALID VALUES CHECK:-
-- 1/Categorical Values
Select Distinct order_status
From olist_orders_dataset;
-- 
Select Distinct payment_type
From olist_order_payments_dataset;
-- 
Select Distinct review_score
From olist_order_reviews_dataset;
-- 2/Numeric Values Check
Select *
From olist_order_items_dataset
Where price < 0 Or freight_value < 0;
-- 3/Date Values Check
SELECT *
FROM olist_orders_dataset
WHERE order_purchase_timestamp > GETDATE();
--
SELECT *
FROM olist_orders_dataset
WHERE order_approved_at > GETDATE();
-- 
SELECT *
FROM olist_orders_dataset
WHERE order_delivered_carrier_date > GETDATE();
-- 
SELECT *
FROM olist_orders_dataset
WHERE order_delivered_customer_date > GETDATE();
-- 
SELECT *
FROM olist_orders_dataset
WHERE order_estimated_delivery_date > GETDATE();
--- 04/Relationship Check 
-- Find orphan Foreign Keys

-- 1. Orders → Customers
SELECT COUNT(*) AS Orphan_Orders
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 2. Order Items → Orders
SELECT COUNT(*) AS Orphan_Order_Items
FROM olist_order_items_dataset oi
LEFT JOIN olist_orders_dataset o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 3. Order Items → Products
SELECT COUNT(*) AS Orphan_Product_Links
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;


-- 4. Order Items → Sellers
SELECT COUNT(*) AS Orphan_Seller_Links
FROM olist_order_items_dataset oi
LEFT JOIN olist_sellers_dataset s
    ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;


-- 5. Order Payments → Orders
SELECT COUNT(*) AS Orphan_Payments
FROM olist_order_payments_dataset op
LEFT JOIN olist_orders_dataset o
    ON op.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 6. Order Reviews → Orders
SELECT COUNT(*) AS Orphan_Reviews
FROM olist_order_reviews_dataset r
LEFT JOIN olist_orders_dataset o
    ON r.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 7. Products → Category Translation
SELECT COUNT(*) AS Untranslated_Categories
FROM olist_products_dataset p
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL
  AND t.product_category_name IS NULL;
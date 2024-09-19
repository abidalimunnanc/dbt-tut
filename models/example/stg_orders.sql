
-- Use the `ref` function to select from other models-

SELECT
    o.order_id,
    c.customer_id,
    c.Customer_Name,
    p.product_id,
    p.product_name,
    o.quantity,
    o.order_date
FROM
    raw.orders o
JOIN
    {{ ref("stg_customers") }} c ON o.customer_id = c.customer_id
JOIN
    raw.products p ON o.product_id = p.product_id
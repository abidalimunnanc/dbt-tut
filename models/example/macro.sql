-- Use the `ref` function to select from other models-

SELECT
    o.order_id,
    c.customer_id,
    c.customer_name,
    p.product_id,
    p.product_name,
    o.quantity,
    {{get_date_parts('order_date')}} as date_extract
FROM
    raw.orders o
JOIN
    {{ ref("stg_customers") }} c ON o.customer_id = c.customer_id
JOIN
    raw.products p ON o.product_id = p.product_id
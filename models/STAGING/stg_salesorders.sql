
SELECT 
ro.id As order_id,
ri.id As item_id,
ro.customer As customer_id,
ro.store_id,
ri.sku As product_id,
rp.price As subtotal,
(rp.price * tax_rate) As tax_paid,
rp.price + (rp.price * tax_rate) As order_total,
TRY_CAST(ordered_at As TIMESTAMP) As ordered_date,
ro._AIRBYTE_EXTRACTED_AT
FROM {{ source('jaffle_shop', 'raw_orders') }} as ro
JOIN {{ source('jaffle_shop', 'raw_items') }} as ri
ON ro.id=ri.order_id
LEFT JOIN {{ source('jaffle_shop', 'raw_products') }} as rp
ON ri.sku=rp.sku
LEFT JOIN {{ source('jaffle_shop', 'raw_stores') }} as rs
ON ro.store_id=rs.id
-- Queremos saber os 10 produtos com maiores preços
SELECT product_id, product_name, unit_price from products
ORDER BY 3 DESC -- 3 = UNIT_PRICE
LIMIT 10
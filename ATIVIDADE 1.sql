/*Queremos saber se temos feito muitas vendas com valores abaixo do preço de tabela. 
Além disso, seria interessante ver a quantidade de produtos vendidos nessas transações, 
ordenadas pela diferença entre o preço de tabela e o preço praticado na venda.*/

SELECT 
    p.product_id, 
    p.product_name, 
    o.quantity, 
    p.unit_price, 
    o.unit_price AS sale_price, 
    ROUND((p.unit_price - o.unit_price)::numeric, 2) AS price_difference
FROM 
    order_details AS o
INNER JOIN 
    products AS p 
    ON p.product_id = o.product_id
WHERE 
    o.unit_price < p.unit_price
ORDER BY 
    price_difference DESC;


/* OUTRA OPÇÃO DE CONSULTA:
SELECT 
    p.product_id, 
    p.product_name, 
    SUM(o.quantity) AS total_quantity_sold, 
    p.unit_price AS price_list, 
    o.unit_price AS sale_price, 
    ROUND((p.unit_price - o.unit_price)::numeric, 2) AS price_difference
FROM 
    order_details AS o
INNER JOIN 
    products AS p 
    ON p.product_id = o.product_id
WHERE 
    o.unit_price < p.unit_price 
GROUP BY 
    p.product_id, p.product_name, p.unit_price, o.unit_price
ORDER BY 
    price_difference DESC;
*/



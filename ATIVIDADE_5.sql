-- QUEREMOS AJUDAR UM ANALISTA A CRIAR UM DASHBOARD, O PEDIDO DELE É O SEGUINTE
/*Preciso criar um Dashboard com as categorias mais vendidas por ano, porém só
liste as 5 maiores de cada ano... */

SELECT category, year, total 
FROM (
    SELECT 
        c.category_id, 
        c.category_name AS category, 
        DATE_PART('year', o.order_date) AS year, 
        ROUND(SUM(od.quantity * od.unit_price - od.discount)::numeric, 2) AS total, 
        ROW_NUMBER() OVER (
            PARTITION BY DATE_PART('year', o.order_date) 
            ORDER BY SUM(od.unit_price * od.quantity - od.discount) DESC
        ) AS ranking
    FROM 
        products p
    INNER JOIN 
        categories c 
        ON c.category_id = p.category_id
    INNER JOIN 
        order_details od 
        ON od.product_id = p.product_id
    INNER JOIN 
        orders o 
        ON od.order_id = o.order_id
    GROUP BY 
        c.category_id, 
        c.category_name, 
        year
) ranked
WHERE 
    ranking <= 5
ORDER BY 
    year, 
    ranking;

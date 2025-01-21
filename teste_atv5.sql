-- QUERY DE ESTUDO E TESTE PARA REALIZAR A ATIVIDADE 5
WITH from_2020 AS (
    SELECT 
        c.category_id, 
        c.category_name, 
        ROUND(SUM(od.quantity * od.unit_price - od.discount)::numeric, 2) AS total 
    FROM 
        products p 
    INNER JOIN 
        categories c ON c.category_id = p.category_id
    INNER JOIN 
        order_details od ON od.product_id = p.product_id
    INNER JOIN 
        orders o ON od.order_id = o.order_id
    WHERE 
        DATE_PART('year', o.order_date) = 2020
    GROUP BY 
        c.category_name, c.category_id
), 
from_2021 AS (
    SELECT 
        c.category_id, 
        c.category_name, 
        ROUND(SUM(od.quantity * od.unit_price - od.discount)::numeric, 2) AS total 
    FROM 
        products p 
    INNER JOIN 
        categories c ON c.category_id = p.category_id
    INNER JOIN 
        order_details od ON od.product_id = p.product_id
    INNER JOIN 
        orders o ON od.order_id = o.order_id
    WHERE 
        DATE_PART('year', o.order_date) = 2021
    GROUP BY 
        c.category_name, c.category_id
), 
from_2022 AS (
    SELECT 
        c.category_id, 
        c.category_name, 
        ROUND(SUM(od.quantity * od.unit_price - od.discount)::numeric, 2) AS total 
    FROM 
        products p 
    INNER JOIN 
        categories c ON c.category_id = p.category_id
    INNER JOIN 
        order_details od ON od.product_id = p.product_id
    INNER JOIN 
        orders o ON od.order_id = o.order_id
    WHERE 
        DATE_PART('year', o.order_date) = 2022
    GROUP BY 
        c.category_name, c.category_id 
), 
agrupar AS (
    SELECT 
        f22.category_id, 
        f22.category_name, 
        f20.total AS total_2020, 
        f21.total AS total_2021, 
        f22.total AS total_2022 
    FROM 
        from_2022 AS f22
    FULL JOIN 
        from_2021 f21 ON f21.category_id = f22.category_id
    FULL JOIN 
        from_2020 f20 ON f20.category_id = f22.category_id
)

SELECT 
    * 
FROM 
    agrupar
ORDER BY 
    total_2020 DESC, 
    total_2021 DESC
LIMIT 5;

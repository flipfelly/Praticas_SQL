/* Queremos saber a performance do funcionário robert em comparação com a de outros funcionários
no ano de 2022*/

WITH RobertSales AS (
    SELECT 
        ROUND(SUM(od.unit_price * od.quantity - od.discount)::numeric, 2) AS total_sales
    FROM orders AS o 
    INNER JOIN employees e ON (e.employee_id = o.employee_id)
    INNER JOIN order_details od ON (od.order_id = o.order_id)
    WHERE DATE_PART('year', o.order_date) = '2022' 
    AND e.first_name = 'Robert'
)
SELECT 
    e.first_name || ' ' || e.last_name AS name, 
    ROUND(SUM(od.unit_price * od.quantity - od.discount)::numeric, 2) AS total_sales,
    rs.total_sales AS Robert_Sales,
    ROUND(SUM(od.unit_price * od.quantity - od.discount)::numeric, 2) - rs.total_sales AS total_difference,
	CASE
        WHEN ROUND(SUM(od.unit_price * od.quantity - od.discount)::numeric, 2) - rs.total_sales < 0 THEN 'Melhor'
        WHEN ROUND(SUM(od.unit_price * od.quantity - od.discount)::numeric, 2) - rs.total_sales > 0 THEN 'Pior'
        ELSE 'Igual'
    END AS performance_ROBERT
FROM orders AS o 
INNER JOIN employees e ON (e.employee_id = o.employee_id)
INNER JOIN order_details od ON (od.order_id = o.order_id)
CROSS JOIN RobertSales AS rs
WHERE DATE_PART('year', o.order_date) = '2022'
GROUP BY name, rs.total_sales
ORDER BY total_difference DESC;

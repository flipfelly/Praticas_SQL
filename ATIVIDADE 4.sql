-- QUEREMOS SABER A DIFERENÇA ENTRE O FATURAMENTO TOTAL DE 2021 E O DE 2020, POR FORNECEDOR.

WITH Sales_2021 AS (
	SELECT 
	    s.supplier_id,
	    s.company_name,
	    ROUND(SUM(od.quantity * od.unit_price - od.discount)::numeric, 2) AS Total
	FROM orders AS o
	INNER JOIN order_details od ON (od.order_id = o.order_id)
	INNER JOIN products p ON (p.product_id = od.product_id)
	INNER JOIN suppliers s ON (s.supplier_id = p.supplier_id)
	WHERE DATE_PART('year', o.order_date) = 2021
	GROUP BY s.supplier_id, s.company_name
),
Sales_2020 AS (
	SELECT 
	    s.supplier_id,
	    s.company_name,
	    ROUND(SUM(od.quantity * od.unit_price - od.discount)::numeric, 2) AS Total
	FROM orders AS o
	INNER JOIN order_details od ON (od.order_id = o.order_id)
	INNER JOIN products p ON (p.product_id = od.product_id)
	INNER JOIN suppliers s ON (s.supplier_id = p.supplier_id)
	WHERE DATE_PART('year', o.order_date) = 2020
	GROUP BY s.supplier_id, s.company_name
), diferenca AS(
	SELECT
		s21.supplier_id,
		s20.company_name,
		s21.Total - s20.Total as Total
	FROM sales_2021 as s21 
	INNER JOIN sales_2020 as s20 on (s21.supplier_id = s20.supplier_id)
	ORDER BY total desc	
)

SELECT * from diferenca

-- 7-Veículos mais visitados por marca
-- brand, model, visitas (#)

SELECT 
    pro.brand, 
	pro.model,
	COUNT(visit_page_date) AS  "visitas (#)"
FROM sales.products AS pro
LEFT JOIN sales.funnel AS fun
    ON pro.product_id = fun.product_id
	GROUP BY pro.brand, pro.model
	ORDER BY pro.brand, pro.model, "visitas (#)";
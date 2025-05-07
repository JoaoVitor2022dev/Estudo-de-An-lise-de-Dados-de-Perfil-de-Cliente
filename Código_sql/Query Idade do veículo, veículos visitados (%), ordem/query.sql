-- (Query 6) Idade dos veículos visitados
-- Colunas: Idade do veículo, veículos visitados (%), ordem

WITH faixa_de_idade_dos_veiculos AS ( 
    SELECT 
        fun.visit_page_date, 
        pro.model_year, 
        EXTRACT('year' FROM visit_page_date) - pro.model_year::int AS idade_veiculo,
        CASE 
            WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 2 THEN 'até 2 anos'
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 4 THEN 'até 2 á 4 anos'
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 6 THEN 'até 4 á 8 anos'
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 8 THEN 'até 8 á 10 anos'
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 10 THEN 'até 10 á 14 anos'
			ELSE 'acima de 10 anos'
			END AS "idade do veículo",
		 CASE 
            WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 2 THEN 1
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 4 THEN 2
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 6 THEN 3
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 8 THEN 4
			WHEN (EXTRACT('year' FROM visit_page_date) - pro.model_year::int) <= 10 THEN 5
			ELSE 6
			END AS "Ordem"
    FROM sales.funnel AS fun 
    LEFT JOIN sales.products AS pro 
         ON fun.product_id = pro.product_id
)
SELECT 
     "idade do veículo", 
	 COUNT(*)::float/(SELECT COUNT(*) FROM sales.funnel) AS "veículos visitados (%)",
	 "Ordem",
	 COUNT(*) AS "exemplo"
	 FROM faixa_de_idade_dos_veiculos
	 GROUP BY "idade do veículo","Ordem"
	 ORDER BY "Ordem";
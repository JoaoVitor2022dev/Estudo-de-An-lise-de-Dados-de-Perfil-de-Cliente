-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads(#)

SELECT * FROM temp_tables.ibge_genders; 

SELECT * FROM sales.customers; 


SELECT 
    CASE 
	    WHEN ibge.gender = 'male' THEN 'homens'
		WHEN ibge.gender = 'female' THEN 'mulheres'
		END AS "Gênero", 
		COUNT(*) AS "leads (#)"
FROM sales.customers AS cus
LEFT JOIN temp_tables.ibge_genders AS ibge
     ON LOWER(cus.first_name) = LOWER(ibge.first_name)
GROUP BY ibge.gender; 


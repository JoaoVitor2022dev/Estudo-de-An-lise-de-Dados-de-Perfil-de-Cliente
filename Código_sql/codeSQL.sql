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

-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)

SELECT 
     CASE 
	     WHEN professional_status = 'freelancer' THEN 'freelancer'
		 WHEN professional_status =  'retired' THEN 'aposentado'
		 WHEN professional_status =  'clt' THEN 'clt'
		 WHEN professional_status = 'other' THEN 'outros'
		 WHEN professional_status = 'civil_servant' THEN 'Funcionário(a) público(a)'
		 WHEN professional_status = 'student ' THEN 'estudante'
		 WHEN professional_status = 'self_employed' THEN 'autônomo'
		 WHEN professional_status = 'busine ' THEN 'Empressário'
		 WHEN professional_status = 'businessman' THEN 'Empressário'
		 END AS "status profissional", 
		 (COUNT(*)::float) /(SELECT COUNT(*) FROM sales.customers) AS "Leads %"
FROM sales.customers
GROUP BY professional_status
ORDER BY "Leads %"; 



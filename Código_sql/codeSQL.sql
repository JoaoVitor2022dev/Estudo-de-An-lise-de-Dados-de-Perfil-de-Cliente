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

-- (Query 3) Faixa etária dos leads
-- Colunas: faixa etária, leads (%)

SELECT 
      CASE 
	      WHEN datediff('years', birth_date, current_date) <= 20 THEN '0-20'
		  WHEN datediff('years', birth_date, current_date) < 40 THEN '20-40'
		  WHEN datediff('years', birth_date, current_date) < 60 THEN '40-60'
		  WHEN datediff('years', birth_date, current_date) < 80 THEN '60-80'
		  ELSE '80+' END "Faixa etária", 
		  COUNT(*)::float/(SELECT COUNT(*) FROM sales.customers) AS "leads (%)" 
FROM sales.customers
GROUP BY "Faixa etária"
ORDER BY "Faixa etária" DESC;  


-- (Query 4) Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem

SELECT 
      CASE 
	      WHEN income < 5000 THEN '0-5000'
		  WHEN income < 10000 THEN '5000-10000'
		  WHEN income < 15000 THEN '10000-15000'
		  WHEN income < 20000 THEN '15000-20000'
		  ELSE '20000+' END "Faixa Salarial", 
		  COUNT(*)::float/(SELECT COUNT(*) FROM sales.customers) AS "leads (%)",
      CASE 
	      WHEN income < 5000 THEN 1
		  WHEN income < 10000 THEN 2
		  WHEN income < 15000 THEN 3
		  WHEN income < 20000 THEN 4
		  ELSE 5 END "Ordem"
FROM sales.customers
GROUP BY "Faixa Salarial", "Ordem"
ORDER BY "Ordem" DESC;  


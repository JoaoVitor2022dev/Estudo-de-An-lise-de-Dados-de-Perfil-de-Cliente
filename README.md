# Análise de Perfil de Clientes

Este projeto realiza uma análise completa do perfil de clientes utilizando:
- Banco de dados em PostgreSQL
- Consultas SQL complexas
- Visualizações e dashboards criados no Excel

## Objetivo
Analisar e identificar características importantes dos clientes, como:
- Idade
- Gênero
- Status profissional
- Faixa salarial
- Outros dados demográficos relevantes

## Tecnologias Utilizadas
- PostgreSQL — para armazenamento e processamento dos dados
- SQL Avançado — para construção de consultas complexas e geração de visões analíticas
- Microsoft Excel — para criação de dashboards e gráficos interativos

## Funcionalidades do Projeto
- Cálculo da Idade dos Clientes
- Classificação por Gênero
- Análise do Status Profissional
- Determinação da Faixa Salarial
- Consultas SQL Complexas:
  - JOINs entre várias tabelas
  - CTEs (Common Table Expressions)
  - Subconsultas
  - Funções de agregação (COUNT, AVG, SUM)
  - CASE WHEN para categorização

- Dashboards em Excel:
  - Gráficos de distribuição de idade
  - Proporção de gêneros
  - Situação profissional
  - Faixa salarial
  - Filtros dinâmicos

## Estrutura do Projeto
consultas_sql/
- analise_idade.sql
- analise_genero.sql
- analise_status_profissional.sql
- analise_faixa_salarial.sql

dashboards_excel/
- dashboard_geral.xlsx
- dashboard_faixa_salarial.xlsx

database/
- script_criacao_tabelas.sql

## Como Executar
1. Subir o banco de dados PostgreSQL.
2. Rodar o script de criação de tabelas.
3. Inserir os dados de clientes.
4. Executar as consultas SQL.
5. Importar os dados no Excel para gerar os dashboards.

## Diferenciais
- Uso de SQL avançado e estruturado.
- Dashboards intuitivos.
- Flexível para expansão do projeto.

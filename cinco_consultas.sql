-- Pergunta 1

SELECT c.nome AS cliente, 
       c.email, 
       COUNT(v.id) AS numero_compras, 
       SUM(v.valor_venda) AS total_gasto 
FROM clientes c
JOIN vendas v ON c.id = v.cliente_id 
GROUP BY c.id 
ORDER BY total_gasto DESC 
LIMIT 10;


-- Pergunta 2
SELECT r.categoria, 
       SUM(v.valor_venda) AS receita_total 
FROM roupas r
JOIN vendas v ON r.id = v.roupa_id 
GROUP BY r.categoria 
ORDER BY receita_total DESC;

-- Pergunta 3
SELECT f.nome AS filial, 
       COUNT(v.id) AS total_vendas, 
       SUM(v.valor_venda) AS receita_total,
       AVG(v.valor_venda) AS media_venda_por_funcionario
FROM filiais f
JOIN vendas v ON f.id = v.filial_id
JOIN funcionarios func ON func.id_filial = f.id
GROUP BY f.id;

-- Pergunta 4

SELECT 
    nivel, 
    AVG(pontos_acumulados) AS media_pontos_acumulados,
    COUNT(cliente_id) AS numero_clientes
FROM 
    programa_fidelidade
WHERE 
    nivel IN ('Ouro', 'Prata')
GROUP BY 
    nivel;


-- Pergunta 5

SELECT EXTRACT(MONTH FROM data_venda) AS mes, 
       COUNT(id) AS total_vendas, 
       SUM(valor_venda) AS receita_total 
FROM vendas 
GROUP BY mes 
ORDER BY mes;


-- Pergunta 6: Obter a média de idade dos clientes que realizaram compras
SELECT AVG(c.idade) AS media_idade 
FROM clientes c 
JOIN vendas v ON c.id = v.cliente_id;

-- Pergunta 7: Listar todas as roupas disponíveis em uma filial específica, incluindo preço e quantidade total vendida
SELECT r.marca, 
       r.categoria, 
       r.tamanho, 
       r.cor, 
       r.preco, 
       COUNT(v.id) AS quantidade_vendida 
FROM roupas r
LEFT JOIN vendas v ON r.id = v.roupa_id
WHERE r.filial_id = 1 -- filial desejada
GROUP BY r.id;

-- Pergunta 8: Contar o número de funcionários por cargo em cada filial
SELECT f.cargo, 
       f.id_filial, 
       COUNT(f.id) AS total_funcionarios 
FROM funcionarios f 
GROUP BY f.cargo, f.id_filial;

-- Pergunta 9: Obter a lista de clientes que não realizaram nenhuma compra
SELECT c.nome, 
       c.email 
FROM clientes c 
LEFT JOIN vendas v ON c.id = v.cliente_id 
WHERE v.id IS NULL;

-- Pergunta 10: Consultar a receita total por filial e por mês
SELECT f.nome AS filial, 
       EXTRACT(MONTH FROM v.data_venda) AS mes, 
       SUM(v.valor_venda) AS receita_total 
FROM filiais f
JOIN vendas v ON f.id = v.filial_id 
GROUP BY f.id, mes 
ORDER BY f.nome, mes;

-- Pergunta 11: Identificar os 5 produtos mais vendidos, considerando a quantidade
SELECT r.marca, 
       COUNT(v.id) AS total_vendido 
FROM roupas r
JOIN vendas v ON r.id = v.roupa_id 
GROUP BY r.id 
ORDER BY total_vendido DESC 
LIMIT 5;

-- Pergunta 12: Calcular o total de pontos acumulados no programa de fidelidade por cliente
SELECT c.nome AS cliente, 
       SUM(p.pontos_acumulados) AS total_pontos 
FROM clientes c
JOIN programa_fidelidade p ON c.id = p.cliente_id 
GROUP BY c.id 
ORDER BY total_pontos DESC;

-- Pergunta 13: Listar as vendas que ocorreram em um mês específico
SELECT v.data_venda, 
       c.nome AS cliente, 
       r.marca, 
       v.valor_venda 
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN roupas r ON v.roupa_id = r.id
WHERE EXTRACT(MONTH FROM v.data_venda) = 2 -- mês desejado
ORDER BY v.data_venda;

-- Pergunta 14: Obter a quantidade total de roupas em estoque por filial
SELECT f.nome AS filial, 
       COUNT(r.id) AS total_roupas 
FROM filiais f
JOIN roupas r ON f.id = r.filial_id 
GROUP BY f.id;

-- Pergunta 15: Analisar a média de gastos dos clientes no programa de fidelidade por nível
SELECT p.nivel, 
       AVG(v.valor_venda) AS media_gastos 
FROM programa_fidelidade p
JOIN vendas v ON p.cliente_id = v.cliente_id 
GROUP BY p.nivel;

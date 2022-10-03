-- Aqui você deve colocar os códigos SQL referentes às Seleções de dados

-- 1)
SELECT 
	pedidos.*, produtos.*
FROM
	pedidos
JOIN 
	produtos_pedidos
ON 
	pedidos.id = produtos_pedidos.pedido_id
JOIN 
	produtos
ON 
	produtos_pedidos.produto_id  = produtos.id;
-- 2)
SELECT
	pedidos.id 
FROM 
	pedidos
JOIN 
	produtos_pedidos
ON 
	pedidos.id = produtos_pedidos.pedido_id 
JOIN 
	produtos
ON 
	produtos_pedidos.produto_id = produtos.id
WHERE
	produtos.nome = "Fritas";
-- 3)
SELECT 
	clientes.nome AS gostam_de_fritas
FROM 
	clientes
JOIN 
	pedidos
ON 
	clientes.id = pedidos.cliente_id
JOIN 
	produtos_pedidos
ON 
	pedidos.id = produtos_pedidos.pedido_id
JOIN 
	produtos
ON 
	produtos.id = produtos_pedidos.produto_id 
WHERE 
	produtos.nome = "Fritas";

-- 4)
SELECT 
	ROUND(CAST(SUM(produtos.preco) AS DECIMAL(10,2)),2) sum
FROM 
	produtos
JOIN 
	produtos_pedidos
ON 
	produtos.id = produtos_pedidos.produto_id
JOIN 
	pedidos
ON 
	pedidos.id = produtos_pedidos.pedido_id 
JOIN 
	clientes 
ON 
	pedidos.cliente_id = clientes.id
WHERE 
	clientes.id = (SELECT id FROM clientes WHERE nome = "Laura");
-- 5)
SELECT 
	produtos.nome, count(*)
FROM 
	produtos
JOIN 
	produtos_pedidos
ON 
	produtos.id = produtos_pedidos.produto_id
GROUP BY 
	produtos.nome
ORDER BY 
	produtos.nome ASC;
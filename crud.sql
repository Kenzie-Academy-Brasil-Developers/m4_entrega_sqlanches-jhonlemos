-- Aqui você deve colocar os códigos SQL referentes às simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes(nome, lealdade) VALUES ("Georgia", 0);


-- 2)
INSERT INTO pedidos (status, cliente_id)
VALUES("Recebido", (SELECT id FROM clientes WHERE nome = "Georgia"));


-- 3)
INSERT INTO produtos_pedidos(pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
  (6, 8);

-- Leitura

-- 1)
SELECT 
	clientes.*, pedidos.*, produtos.*
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
	produtos_pedidos.produto_id = produtos.id
WHERE 
	clientes.nome = "Georgia";


-- Atualização

-- 1)
UPDATE 
	clientes 
SET 
	lealdade = (
		SELECT 
			sum(pts_de_lealdade)
		FROM 
			produtos
		JOIN 
			produtos_pedidos
		ON 
			produtos.id = produtos_pedidos.produto_id 
		JOIN 
			pedidos
		ON 
			produtos_pedidos.pedido_id = pedidos.id 
		JOIN 
			clientes
		ON 
			pedidos.cliente_id = clientes.id
		WHERE 
			clientes.id = (SELECT id FROM clientes WHERE nome = "Georgia"))
WHERE 
	clientes.nome = "Georgia";


-- Deleção

-- 1)
DELETE FROM
  clientes
WHERE
  nome = "Marcelo" RETURNING *;


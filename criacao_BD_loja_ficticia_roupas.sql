-- Criação do Banco de Dados de uma Loja de Roupas fictícia

-- Tabela para armazenar informações sobre cidades
CREATE TABLE cidades (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  CEP VARCHAR(20) NOT NULL
);

-- Tabela para filiais da loja de roupas
CREATE TABLE filiais (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  numero_funcionarios INT NOT NULL,
  cidade_id INT NOT NULL,
  FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

-- Tabela para informações dos clientes
CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  idade INT NOT NULL,
  email VARCHAR(100) NOT NULL,
  preferencia_estilo VARCHAR(50),
  tamanho_favorito VARCHAR(5)
);

-- Tabela para catalogar as roupas disponíveis
CREATE TABLE roupas (
  id SERIAL PRIMARY KEY,
  categoria VARCHAR(50) NOT NULL,
  marca VARCHAR(50) NOT NULL,
  tamanho VARCHAR(5) NOT NULL,
  cor VARCHAR(20) NOT NULL,
  preco DECIMAL(10, 2) NOT NULL,
  material VARCHAR(50) NOT NULL,
  filial_id INT NOT NULL,
  FOREIGN KEY (filial_id) REFERENCES filiais(id)
);

-- Tabela para informações dos funcionários da loja
CREATE TABLE funcionarios (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  idade INT NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  data_contratacao DATE NOT NULL,
  id_filial INT NOT NULL,
  FOREIGN KEY (id_filial) REFERENCES filiais(id)
);

-- Tabela para registrar vendas de roupas
CREATE TABLE vendas (
  id SERIAL PRIMARY KEY,
  roupa_id INT NOT NULL,
  cliente_id INT NOT NULL,
  funcionario_id INT NOT NULL,
  data_venda DATE NOT NULL,
  metodo_pagamento VARCHAR(50) NOT NULL,
  valor_venda DECIMAL(10, 2) NOT NULL,
  filial_id INT NOT NULL,
  FOREIGN KEY (roupa_id) REFERENCES roupas(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
  FOREIGN KEY (filial_id) REFERENCES filiais(id)
);

-- Tabela para um programa de fidelidade dos clientes
CREATE TABLE programa_fidelidade (
  id SERIAL PRIMARY KEY,
  cliente_id INT NOT NULL,
  data_inscricao DATE NOT NULL,
  nivel VARCHAR(20),
  pontos_acumulados INT DEFAULT 0,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


-- Inserção de valores em cada tabela

-- Tabela cidades
INSERT INTO cidades (nome, CEP) VALUES
('São Paulo', '01000-000'),
('Rio de Janeiro', '20000-000'),
('Belo Horizonte', '30000-000');


-- Tabela filiais
INSERT INTO filiais (nome, endereco, numero_funcionarios, cidade_id) VALUES
('Filial São Paulo', 'Av. Paulista, 1000', 2, 1),
('Filial Rio de Janeiro', 'Rua da Carioca, 50', 2, 2),
('Filial Belo Horizonte', 'Av. Afonso Pena, 500', 2, 3);


-- Tabela clientes
INSERT INTO clientes (nome, CPF, telefone, idade, email, preferencia_estilo, tamanho_favorito) VALUES
('Carlos Silva', '12345678901', '(11) 91234-5678', 28, 'carlos.silva@email.com', 'Casual', 'M'),
('Maria Oliveira', '23456789012', '(21) 92345-6789', 34, 'maria.oliveira@email.com', 'Clássico', 'G'),
('José Santos', '34567890123', '(31) 93456-7890', 45, 'jose.santos@email.com', 'Esportivo', 'GG'),
('Ana Costa', '45678901234', '(41) 94567-8901', 22, 'ana.costa@email.com', 'Moderno', 'P'),
('Fernanda Almeida', '56789012345', '(51) 95678-9012', 31, 'fernanda.almeida@email.com', 'Boho', 'M'),
('Lucas Ferreira', '67890123456', '(61) 96789-0123', 27, 'lucas.ferreira@email.com', 'Casual', 'G'),
('Roberta Lima', '78901234567', '(71) 97890-1234', 30, 'roberta.lima@email.com', 'Clássico', 'GG'),
('Felipe Pereira', '89012345678', '(81) 98901-2345', 29, 'felipe.pereira@email.com', 'Esportivo', 'P'),
('Patrícia Ribeiro', '90123456789', '(91) 99012-3456', 35, 'patricia.ribeiro@email.com', 'Moderno', 'M'),
('Rafael Martins', '01234567890', '(11) 91123-4567', 38, 'rafael.martins@email.com', 'Boho', 'G'),
('Juliana Santos', '12345678902', '(21) 92234-5678', 24, 'juliana.santos@email.com', 'Casual', 'GG'),
('Danilo Gomes', '23456789013', '(31) 93345-6789', 33, 'danilo.gomes@email.com', 'Clássico', 'P'),
('Camila Rocha', '34567890124', '(41) 94456-7890', 26, 'camila.rocha@email.com', 'Esportivo', 'M'),
('André Silva', '45678901235', '(51) 95567-8901', 42, 'andre.silva@email.com', 'Moderno', 'G'),
('Letícia Alves', '56789012346', '(61) 96678-9012', 39, 'leticia.alves@email.com', 'Boho', 'GG'),
('Gustavo Costa', '67890123457', '(71) 97789-0123', 28, 'gustavo.costa@email.com', 'Casual', 'P'),
('Luana Ferreira', '78901234568', '(81) 98890-1234', 30, 'luana.ferreira@email.com', 'Clássico', 'M'),
('Tiago Lima', '89012345679', '(91) 99901-2345', 36, 'tiago.lima@email.com', 'Esportivo', 'G'),
('Bruna Martins', '90123456780', '(11) 91012-3456', 32, 'bruna.martins@email.com', 'Moderno', 'GG'),
('Leonardo Pereira', '01234567891', '(21) 92123-4567', 25, 'leonardo.pereira@email.com', 'Boho', 'P'),
('Michele Santos', '12345678903', '(31) 93234-5678', 29, 'michele.santos@email.com', 'Casual', 'M'),
('Samuel Almeida', '23456789014', '(41) 94345-6789', 40, 'samuel.almeida@email.com', 'Clássico', 'G'),
('Aline Costa', '34567890125', '(51) 95456-7890', 27, 'aline.costa@email.com', 'Esportivo', 'GG'),
('Fernando Rocha', '45678901236', '(61) 96567-8901', 34, 'fernando.rocha@email.com', 'Moderno', 'P'),
('Sofia Ribeiro', '56789012347', '(71) 97678-9012', 31, 'sofia.ribeiro@email.com', 'Boho', 'M'),
('Ricardo Martins', '67890123458', '(81) 98789-0123', 28, 'ricardo.martins@email.com', 'Casual', 'G'),
('Tamires Lima', '78901234569', '(91) 99890-1234', 37, 'tamires.lima@email.com', 'Clássico', 'GG'),
('Júlio Santos', '89012345670', '(11) 90912-3456', 22, 'julio.santos@email.com', 'Esportivo', 'P'),
('Vanessa Almeida', '90123456781', '(21) 92023-4567', 26, 'vanessa.almeida@email.com', 'Moderno', 'M'),
('Gabriel Ferreira', '01234567892', '(31) 93134-5678', 39, 'gabriel.ferreira@email.com', 'Boho', 'G'),
('Natalia Costa', '12345678904', '(41) 94245-6789', 35, 'natalia.costa@email.com', 'Casual', 'GG'),
('Victor Rocha', '23456789015', '(51) 95356-7890', 30, 'victor.rocha@email.com', 'Clássico', 'P');


-- Tabela roupas
INSERT INTO roupas (categoria, marca, tamanho, cor, preco, material, filial_id) VALUES
('Camiseta', 'Nike', 'M', 'Azul', 79.90, 'Algodão', 1),
('Camiseta', 'Puma', 'P', 'Preto', 69.90, 'Algodão', 3),
('Camiseta', 'C&A', 'G', 'Amarelo', 39.90, 'Algodão', 2),
('Camiseta', 'Calvin Klein', 'P', 'Cinza', 89.90, 'Algodão', 2),
('Calça Jeans', 'Levi’s', 'G', 'Preto', 149.90, 'Denim', 1),
('Vestido', 'Zara', 'P', 'Vermelho', 199.90, 'Poliéster', 1),
('Blusa', 'Adidas', 'M', 'Branco', 89.90, 'Algodão', 2),
('Saia', 'H&M', 'G', 'Rosa', 99.90, 'Seda', 2),
('Bermuda', 'Quiksilver', 'M', 'Verde', 89.90, 'Tecido Sintético', 2),
('Jaqueta', 'Columbia', 'GG', 'Cinza', 299.90, 'Poliéster', 3),
('Calça Jogger', 'Reebok', 'M', 'Camo', 129.90, 'Tecido Flex', 3),
('Camisa', 'Tommy Hilfiger', 'G', 'Branco', 159.90, 'Algodão', 2),
('Shorts', 'Adidas', 'P', 'Azul', 89.90, 'Poliéster', 3),
('Vestido Longo', 'Lojas Renner', 'M', 'Florido', 249.90, 'Viscose', 3),
('Calça de Moletom', 'C&A', 'GG', 'Preto', 79.90, 'Algodão', 3),
('Regata', 'Riachuelo', 'P', 'Branco', 49.90, 'Viscose', 3),
('Camisa de Manga Longa', 'Marisa', 'M', 'Verde', 109.90, 'Algodão', 1),
('Calça de Sarja', 'Hering', 'G', 'Bege', 119.90, 'Sarja', 2),
('Camiseta Estampada', 'Forever 21', 'M', 'Rosa', 59.90, 'Algodão', 3),
('Casaco', 'Gap', 'GG', 'Preto', 349.90, 'Lã', 3),
('Shorts Jeans', 'Morrison', 'G', 'Azul Claro', 79.90, 'Denim', 2),
('Saia Midi', 'Lojas Americanas', 'P', 'Preto', 99.90, 'Poliéster', 2),
('Blusa de Frio', 'Puma', 'M', 'Bordeaux', 139.90, 'Poliéster', 1),
('Bermuda de Praia', 'Speedo', 'G', 'Azul Marinho', 69.90, 'Nylon', 2),
('Vestido de Festa', 'Dudalina', 'GG', 'Dourado', 399.90, 'Seda', 2),
('Camiseta Listrada', 'Zara', 'P', 'Listras', 59.90, 'Algodão', 1),
('Calça Skinny', 'Levi’s', 'M', 'Preto', 199.90, 'Denim', 3),
('Regata Básica', 'H&M', 'G', 'Verde Claro', 39.90, 'Algodão', 2),
('Calça Clássica', 'Riachuelo', 'GG', 'Cinza', 109.90, 'Tecido Sintético', 3),
('Saia Longa', 'C&A', 'M', 'Branca', 89.90, 'Algodão', 3),
('Camiseta de Manga Curta', 'Adidas', 'P', 'Azul', 49.90, 'Algodão', 1),
('Calça de Alfaiataria', 'Tommy Hilfiger', 'G', 'Marinho', 169.90, 'Lã', 3);


-- Tabela funcionarios
INSERT INTO funcionarios (nome, telefone, idade, endereco, cargo, data_contratacao, id_filial) VALUES
('Alice Costa', '11912345678', 25, 'Rua A, 100', 'Atendente', '2023-01-10', 1),
('Bruno Almeida', '11923456789', 30, 'Rua B, 200', 'Gerente', '2023-01-11', 1),
('Carlos Silva', '21912345678', 28, 'Rua C, 150', 'Atendente', '2023-01-10', 2),
('Daniele Santos', '21923456789', 26, 'Rua D, 250', 'Gerente', '2023-01-11', 2),
('Eduardo Ferreira', '31912345678', 35, 'Rua E, 300', 'Atendente', '2023-01-10', 3),
('Fernanda Nascimento', '31923456789', 31, 'Rua F, 350', 'Gerente', '2023-01-11', 3);


-- Tabela vendas
INSERT INTO vendas (roupa_id, cliente_id, funcionario_id, data_venda, metodo_pagamento, valor_venda, filial_id) VALUES
(1, 1, 1, '2024-01-15', 'Cartão de Crédito', 149.90, 1),
(2, 2, 1, '2024-01-16', 'Dinheiro', 159.90, 1),
(3, 3, 1, '2024-01-17', 'Cartão de Débito', 139.90, 1),
(4, 4, 1, '2024-01-18', 'Pix', 159.90, 1),
(5, 5, 1, '2024-01-19', 'Cartão de Crédito', 169.90, 1),
(6, 6, 1, '2024-01-20', 'Dinheiro', 89.90, 1),
(7, 7, 1, '2024-01-21', 'Cartão de Débito', 99.90, 1),
(8, 8, 1, '2024-01-22', 'Pix', 89.90, 1),
(9, 9, 1, '2024-01-23', 'Cartão de Crédito', 79.90, 1),
(10, 10, 1, '2024-01-24', 'Dinheiro', 69.90, 1),
(11, 11, 2, '2024-01-15', 'Cartão de Crédito', 149.90, 2),
(1, 1, 1, '2023-01-20', 'Cartão de Crédito', 79.90, 1),
(2, 2, 2, '2023-01-22', 'Dinheiro', 49.90, 1),
(3, 3, 3, '2023-01-25', 'Cartão de Débito', 99.90, 1),
(4, 4, 1, '2023-02-05', 'Pix', 89.90, 2),
(5, 5, 2, '2023-02-10', 'Cartão de Crédito', 120.00, 2),
(6, 6, 3, '2023-02-15', 'Dinheiro', 75.50, 2),
(7, 7, 1, '2023-03-01', 'Cartão de Débito', 65.00, 3),
(8, 8, 2, '2023-03-05', 'Pix', 110.00, 3),
(9, 9, 3, '2023-03-10', 'Cartão de Crédito', 150.00, 3),
(10, 10, 1, '2023-03-12', 'Dinheiro', 40.00, 3),
(11, 11, 2, '2023-03-20', 'Cartão de Débito', 85.00, 3),
(12, 12, 3, '2023-04-01', 'Pix', 55.00, 2),
(13, 13, 1, '2023-04-05', 'Cartão de Crédito', 95.00, 3),
(14, 14, 2, '2023-04-10', 'Dinheiro', 30.00, 1),
(15, 15, 3, '2023-04-15', 'Cartão de Débito', 150.00, 3),
(16, 16, 1, '2023-05-01', 'Pix', 70.00, 1),
(17, 17, 2, '2023-05-05', 'Cartão de Crédito', 110.00, 2),
(18, 18, 3, '2023-05-10', 'Dinheiro', 120.00, 1),
(19, 19, 1, '2023-06-01', 'Cartão de Débito', 45.00, 3),
(20, 20, 2, '2023-06-05', 'Pix', 85.00, 3),
(21, 21, 3, '2023-06-10', 'Cartão de Crédito', 95.00, 1),
(22, 22, 1, '2023-07-01', 'Dinheiro', 60.00, 2),
(23, 23, 2, '2023-07-05', 'Cartão de Débito', 130.00, 2),
(24, 24, 3, '2023-07-10', 'Pix', 150.00, 2),
(25, 25, 1, '2023-08-01', 'Cartão de Crédito', 75.00, 1),
(26, 26, 2, '2023-08-05', 'Dinheiro', 90.00, 3),
(27, 27, 3, '2023-08-10', 'Cartão de Débito', 60.00, 2),
(28, 28, 1, '2023-09-01', 'Pix', 150.00, 3),
(29, 29, 2, '2023-09-05', 'Cartão de Crédito', 80.00, 1),
(30, 30, 3, '2023-09-10', 'Dinheiro', 110.00, 3);


-- Tabela programa_fidelidade
INSERT INTO programa_fidelidade (cliente_id, data_inscricao, nivel, pontos_acumulados) VALUES
(1, '2024-01-01', 'Prata', 100),
(2, '2024-01-02', 'Ouro', 200),
(3, '2024-01-03', 'Prata', 150),
(4, '2024-01-04', 'Ouro', 300),
(5, '2024-01-05', 'Prata', 120),
(6, '2024-01-06', 'Ouro', 250),
(7, '2024-01-07', 'Prata', 180),
(8, '2024-01-08', 'Ouro', 350),
(9, '2024-01-09', 'Prata', 90),
(10, '2024-01-10', 'Ouro', 220),
(11, '2024-01-11', 'Prata', 110),
(12, '2024-01-12', 'Ouro', 280),
(13, '2024-01-13', 'Prata', 130),
(14, '2024-01-14', 'Ouro', 310),
(15, '2024-01-15', 'Prata', 140),
(16, '2024-01-16', 'Ouro', 260),
(17, '2024-01-17', 'Prata', 170),
(18, '2024-01-18', 'Ouro', 330),
(19, '2024-01-19', 'Prata', 160),
(20, '2024-01-20', 'Ouro', 290),
(21, '2024-01-21', 'Prata', 145),
(22, '2024-01-22', 'Ouro', 310),
(23, '2024-01-23', 'Prata', 155),
(24, '2024-01-24', 'Ouro', 340),
(25, '2024-01-25', 'Prata', 135),
(26, '2024-01-26', 'Ouro', 275),
(27, '2024-01-27', 'Prata', 125),
(28, '2024-01-28', 'Ouro', 315),
(29, '2024-01-29', 'Prata', 115),
(30, '2024-01-30', 'Ouro', 305);


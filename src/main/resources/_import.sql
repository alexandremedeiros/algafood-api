insert into cozinha(nome) values('Tailandesa');
insert into cozinha(nome) values('Indiana');
insert into cozinha (id, nome) values (3, 'Argentina');
insert into cozinha (id, nome) values (4, 'Brasileira');

insert into estado(nome) values('Santa Catarina');
insert into estado(nome) values('Paraná');
insert into estado(nome) values('Rio Grande do Sul');

insert into cidade(nome, estado_id) values('Tubarão', 1);
insert into cidade(nome, estado_id) values('Criciúma', 1);
insert into cidade(nome, estado_id) values('Maringá', 2);
insert into cidade(nome, estado_id) values('Curitiba', 2);
insert into cidade(nome, estado_id) values('Santa Cruz do Sul', 3);
insert into cidade(nome, estado_id) values('Novo Hamburgo', 3);

insert into restaurante(nome, taxa_frete, cozinha_id, endereco_cidade_id, data_cadastro, data_atualizacao, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values('Tigre asiático', 2.78, 1, 1, utc_timestamp, utc_timestamp, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
insert into restaurante(nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values('Taj Mahal', 0, 1, utc_timestamp, utc_timestamp);
insert into restaurante(nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values('Tuk Tuk  Comida Indiana', 0, 2, utc_timestamp, utc_timestamp);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);

insert into forma_pagamento(nome) values('Dinheiro');
insert into forma_pagamento(nome) values('Cartão de crédito');
insert into forma_pagamento(nome) values('PIX');

insert into permissao(nome, descricao) values('Permissao 1', 'Descrição da permissão 1');
insert into permissao(nome, descricao) values('Permissao 2', 'Descrição da permissão 2');
insert into permissao(nome, descricao) values('Permissao 3', 'Descrição da permissão 3');

insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
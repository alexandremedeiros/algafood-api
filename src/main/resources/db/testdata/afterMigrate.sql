set foreign_key_checks = 0;

delete from cidade;
delete from cozinha;
delete from estado;
delete from forma_pagamento;
delete from grupo;
delete from grupo_permissao;
delete from permissao;
delete from produto;
delete from restaurante;
delete from restaurante_forma_pagamento;
delete from usuario;
delete from usuario_grupo;

set foreign_key_checks = 1;

alter table cidade auto_increment = 1;
alter table cozinha auto_increment = 1;
alter table estado auto_increment = 1;
alter table forma_pagamento auto_increment = 1;
alter table grupo auto_increment = 1;
alter table permissao auto_increment = 1;
alter table produto auto_increment = 1;
alter table restaurante auto_increment = 1;
alter table usuario auto_increment = 1;


insert ignore into cozinha (id, nome) values (1, 'Tailandesa');
insert ignore into cozinha (id, nome) values (2, 'Indiana');
insert ignore into cozinha (id, nome) values (3, 'Argentina');
insert ignore into cozinha (id, nome) values (4, 'Brasileira');

insert ignore into estado(nome) values('Santa Catarina');
insert ignore into estado(nome) values('Paraná');
insert ignore into estado(nome) values('Rio Grande do Sul');

insert ignore into cidade(nome, estado_id) values('Tubarão', 1);
insert ignore into cidade(nome, estado_id) values('Criciúma', 1);
insert ignore into cidade(nome, estado_id) values('Maringá', 2);
insert ignore into cidade(nome, estado_id) values('Curitiba', 2);
insert ignore into cidade(nome, estado_id) values('Santa Cruz do Sul', 3);
insert ignore into cidade(nome, estado_id) values('Novo Hamburgo', 3);

insert ignore into restaurante(nome, taxa_frete, cozinha_id, endereco_cidade_id, data_cadastro, data_atualizacao, ativo, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values('Tigre asiático', 2.78, 1, 1, utc_timestamp, utc_timestamp, true, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
insert ignore into restaurante(nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo) values('Taj Mahal', 0, 1, utc_timestamp, utc_timestamp, true);
insert into restaurante(nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo) values('Tuk Tuk  Comida Indiana', 0, 2, utc_timestamp, utc_timestamp, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo) values (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo) values (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp, true);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo) values (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp, true);

insert into forma_pagamento(descricao) values('Dinheiro');
insert into forma_pagamento(descricao) values('Cartão de crédito');
insert into forma_pagamento(descricao) values('PIX');

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
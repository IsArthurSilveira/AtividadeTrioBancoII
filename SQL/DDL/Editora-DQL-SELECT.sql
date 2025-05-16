/*Comandos DQL - Select*/
-- 1. Lista de Funcionários com seus Cargos e Departamentos:
select f.NomeFunc,c.nome "Cargo", d.nome "Departamento"
	from Funcionario f
		join Trabalhar t on f.CPF_Func = t.Funcionario_CPF_Func
		join Cargo c on t.Cargo_cbo = c.cbo
		join Departamento d on t.Departamento_idDepartamento = d.idDepartamento;
-- 2. Livros por Área de Conhecimento:
select l.titulo "Livro", a.nome "Área Conhecimento"
	from Livros l
		join AreaConhecimento a on l.AreaConhecimento_idAreaConhecimento = a.idAreaConhecimento
			order by a.nome;
-- 3. Clientes que Fizeram Pedidos em um Determinado Período:
select c.nome "Cliente", p.DataPedido "Data Pedido"
	from Cliente c
		join Pedidos p on c.CPF_Cli = p.Cliente_CPF_Cli
			where p.DataPedido between '2024-01-01' and '2024-03-31';
-- 4. Vendas por Funcionário:
select f.NomeFunc "Funcionario", count(v.idVendas) "TotalVendas"
	from Funcionario f
		join Vendas v on f.CPF_Func = v.Funcionario_CPF_Func
			group by f.NomeFunc;
-- 5. Livros com Mais Exemplares em Estoque:
select l.titulo "Livro", count(e.Livros_ISBN) "Quantidade Exemplares"
	from Livros l
		join Exemplar e on l.ISBN = e.Livros_ISBN
			group by l.titulo
				order by count(e.Livros_ISBN) desc;
-- 6. Autores com Mais Livros Publicados:
select a.Nome "Autor", count(la.Livros_ISBN) "Quantidade de Livros Publicados"
	from Autor a
		join LivroAutores la on a.CPF_Autor = la.Autor_CPF_Autor
			group by a.Nome
				order by count(la.Livros_ISBN) desc;
-- 7. Pedidos com Status Específico:
select p.idPedidos, p.DataPedido, p.`Status`
	from Pedidos p
		where p.Status = 'concluído';
-- 8. Funcionários Gerentes de Departamento:
select f.NomeFunc "Gerente", d.nome "Departamento"
	from Funcionario f
join Departamento d on f.CPF_Func = d.Gerente_cpf;
-- 9. Valor Total de Vendas por Forma de Pagamento:
select fp.tipo "Forma de Pagamento", sum(v.valor) "Valor Total"
	from Vendas v
		join FormaPag fp on v.idVendas = fp.Vendas_idVendas
			group by fp.tipo;
-- 10. Livros Publicados em um Intervalo de Anos:
select titulo "Livro", data_publicacao "Data Publicação"
	from Livros
		where data_publicacao between '1890-01-01' and '2020-12-31';
-- 11. Clientes por Cidade:
select ec.cidade "Cidade", count(c.CPF_Cli) "Quantidade de Clientes"
	from Cliente c
		join EnderecoCli ec on c.CPF_Cli = ec.Cliente_CPF_Cli
			group by ec.cidade;
-- 12. Funcionários com Salário Acima da Média:
select NomeFunc "Funcionario", salario "Salário"
	from Funcionario
		where salario > (select avg(salario) from Funcionario);
-- 13. Livros e suas Palavras-Chave:
select l.titulo, group_concat( distinct p.Palavra separator " | ")
	from Livros l
		join LivroPalavras lp on l.ISBN = lp.Livros_ISBN
		join PalavraChave p on lp.PalavraChave_idPalavraChave = p.idPalavraChave
			group by l.titulo, p.Palavra;
-- 14. Pedidos com o Número de Exemplares Solicitados:
select p.idPedidos "Pedidos", count(pe.Exemplar_NumeroSerie) "Quantidade de Exemplares"
	from Pedidos p
		join PedidoExemplares pe on p.idPedidos = pe.Pedidos_idPedidos
			group by p.idPedidos;
-- 15. Vendas com Detalhes do Cliente:
select v.idVendas "Venda", v.DataVenda "Data da Venda", c.nome "Cliente"
	from Vendas v
		join Pedidos p on v.Pedidos_idPedidos = p.idPedidos
		join Cliente c on p.Cliente_CPF_Cli = c.CPF_Cli;
-- 16. Livros com Desconto Máximo:
select ISBN "Código ISBN", titulo "Livro", DescontoMaximo "Desconto"
	from Livros
		where DescontoMaximo > 0
			order by DescontoMaximo desc;
-- 17. Funcionários e seus Contatos:
select f.NomeFunc "Funcionário", c.Email "Email", c.Telefone "Telefone"
	from Funcionario f
		join Contato c on f.CPF_Func = c.Funcionario_CPF_Func;
-- 18. Livros por Gênero:
select genero "Gênero", count(ISBN) "Quantidade de Livros"
	from Livros
		group by genero;
-- 19. Funcionários e o Nome do Departamento onde trabalham
select f.NomeFunc "Funcionário", d.nome "Departamento"
	from Funcionario f
		join Trabalhar t on f.CPF_Func = t.Funcionario_CPF_Func
		join Departamento d on t.Departamento_idDepartamento = d.idDepartamento;
-- 20. Total de Livros por Área de Conhecimento
select a.nome "Área de Conhecimento", count(l.ISBN) "Total de Livros"
	from AreaConhecimento a
		left join Livros l on a.idAreaConhecimento = l.AreaConhecimento_idAreaConhecimento
			group by a.nome, l.ISBN
				order by count(l.ISBN) desc;
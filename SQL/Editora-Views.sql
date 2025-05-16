/*Comandos VIEW*/
-- 1.View - Exibe informações completas dos funcionários, incluindo cargo e departamento.
create view FuncionariosComInfoCompleta as
select f.CPF_Func "CPF Funcionário", f.NomeFunc "Nome", replace(replace(f.sexo, 'F', "Feminino"),'M', "Masculino") "Gênero", timestampdiff(year,dataNasc,now()),
	   concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário", c.nome "Cargo", d.nome "Departamento"
		from Funcionario f
			inner join Trabalhar t on f.CPF_Func = t.Funcionario_CPF_Func
			inner join Cargo c on t.Cargo_cbo = c.cbo
			inner join Departamento d on t.Departamento_idDepartamento = d.idDepartamento;
-- 2.View - Exibe os livros com uma lista concatenada dos nomes dos autores.
create view LivrosComAutoresConcatenados as
		select l.ISBN "Código ISBN", l.titulo "Livro", group_concat( distinct a.Nome separator ' | ') "Autores"
			from Livros l
				left join LivroAutores la on l.ISBN = la.Livros_ISBN
				left join Autor a on la.Autor_CPF_Autor = a.CPF_Autor
					group by l.ISBN, l.titulo;
-- 3.View - Exibe os clientes e o total de pedidos que fizeram.
create view ClientesComTotalPedidos as
	select c.CPF_Cli "CPF Cliente", c.nome "Cliente", COUNT(p.idPedidos) "Total de Pedidos"
		from Cliente c
			left join Pedidos p on c.CPF_Cli = p.Cliente_CPF_Cli
				group by c.CPF_Cli, c.nome;
-- 4.View - Exibe detalhes das vendas, incluindo o nome do funcionário e o valor total.
create view VendasDetalhadas as
	select v.idVendas "Venda", v.DataVenda "Data Venda", v.valor "Valor Venda" , f.NomeFunc "Funcionario"
		from Vendas v
			inner join Funcionario f on v.Funcionario_CPF_Func = f.CPF_Func;
-- 5.View - Exibe o número de livros por área de conhecimento.
create view LivrosPorAreaConhecimento AS
select ac.nome "Área Conhecimento", count(l.ISBN) "Total livros"
	from AreaConhecimento ac
		left join Livros l on ac.idAreaConhecimento = l.AreaConhecimento_idAreaConhecimento
		group by ac.nome;
-- 6.View - Exibe funcionários com salário acima da média.
create view FuncionariosComSalarioAcimaDaMedia as
	select CPF_Func "CPF", NomeFunc "Funcionário", salario
		from Funcionario
			where salario > (select avg(salario) from Funcionario);
-- 7.View - Exibe detalhes dos pedidos com informações do cliente.
create view PedidosComDetalhesCliente as
	select p.idPedidos "Pedido", p.DataPedido "Data Pedido", p.`Status`, c.nome "Cliente"
		from Pedidos p
			inner join Cliente c on p.Cliente_CPF_Cli = c.CPF_Cli;
-- 8.View - Exibe o número de exemplares por livro.
create view ExemplaresPorLivro as
	select l.ISBN "ISBN", l.titulo "Livro", count(e.NumeroSerie) "Total Exemplares"
		from Livros l
			left join Exemplar e on l.ISBN = e.Livros_ISBN
				group by l.ISBN, l.titulo;
-- 9.View - Exibe o total de vendas por forma de pagamento.
create view VendasPorFormaPagamento as
	select fp.tipo  "Forma de Pagamento", sum(v.valor) "Total de Vendas"
		from FormaPag fp
			inner join Vendas v on fp.Vendas_idVendas = v.idVendas
				group by fp.tipo;
-- 10.View - Exibe livros que têm mais de um autor.
create view LivrosComMaisDeUmAutor AS
	select l.ISBN "ISBN", l.titulo "Livro", count(la.Autor_CPF_Autor) "Quantidade Autores"
		from Livros l
			inner join LivroAutores la on l.ISBN = la.Livros_ISBN
				group by l.ISBN, l.titulo
					having count(la.Autor_CPF_Autor) > 1;
                    
                    
SELECT * FROM editora.clientescomtotalpedidos;
SELECT * FROM editora.exemplaresporlivro;
SELECT * FROM editora.funcionarioscominfocompleta;
SELECT * FROM editora.funcionarioscomsalarioacimadamedia;
SELECT * FROM editora.livroscomautoresconcatenados;
SELECT * FROM editora.livroscommaisdeumautor;
SELECT * FROM editora.livrosporareaconhecimento;
SELECT * FROM editora.pedidoscomdetalhescliente;
SELECT * FROM editora.vendasdetalhadas;
SELECT * FROM editora.vendasporformapagamento;
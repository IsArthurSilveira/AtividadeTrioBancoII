/*Comandos DDL - DROP */
-- 1. Apagar a tabela LivroPremios
drop table livroPremios;
-- 2. Apagar Tabela AvaliacoesLivros
drop table AvaliacoesLivros;
-- 3. Apagar tabela PremiosLiterarios
drop table PremiosLiterarios;
-- 4. Apagar tabela Fornecedores
drop table Fornecedores;
-- 5. Apagar tabela Categorias
drop table CategoriasLivros;
-- 6. Apagar tabela Estoque
drop table EstoqueLivros;

-- 7. Apagar view que Exibe os clientes e o total de pedidos que fizeram
drop view editora.ClientesComTotalPedidos;
-- 8. Apagar view que Exibe o número de exemplares por livro
drop view editora.ExemplaresPorLivro;
-- 9. Apagar view que Exibe informações completas dos funcionários, incluindo cargo e departamento
drop view editora.FuncionariosComInfoCompleta;
-- 10. Apagar view que Exibe funcionários com salário acima da média
drop view editora.FuncionariosComSalarioAcimaDaMedia;
-- 11. Apagar view que Exibe os livros com uma lista concatenada dos nomes dos autores
drop view editora.LivrosComAutoresConcatenados;
-- 12. Apagar view que Exibe livros que têm mais de um autor
drop view editora.LivrosComMaisDeUmAutor;
-- 13. Apagar view que Exibe o número de livros por área de conhecimento
drop view editora.LivrosPorAreaConhecimento;
-- 14. Apagar view que Exibe detalhes dos pedidos com informações do cliente
drop view editora.PedidosComDetalhesCliente;
-- 15. Apagar view que Exibe detalhes das vendas, incluindo o nome do funcionário e o valor total
drop view editora.VendasDetalhadas;
-- 16. Apagar view que Exibe o total de vendas por forma de pagamento.
drop view editora.VendasPorFormaPagamento;

-- Apagar tudo
drop schema editora;


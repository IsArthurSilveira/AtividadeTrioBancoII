/*Comandos DML - DELETE update*/

-- Scripts de Exclusão (DELETE)
-- 1. Excluir o funcionário 'Ana Lima':
delete from Funcionario where CPF_Func = '12345678901';
-- 2. Excluir o funcionário 'Roberto Dias':
delete from Funcionario where CPF_Func = '78901234567';
-- 3. Excluir o endereço do funcionário 'Lucas Braga':
delete from EnderecoFunc where FuncionarioCPF = '56789012345';
-- 4. Excluir o cargo 'Atendente':
delete from Cargo where cbo = 1005;
-- 5. Excluir o departamento 'TI':
delete from Departamento where idDepartamento = 5;
-- 6. Excluir o cliente 'Amanda Nunes':
delete from Cliente where CPF_Cli = '56789012345';
-- 7. Excluir o pedido com id 3:
delete from Pedidos where idPedidos = 3;
-- 8. Excluir a venda com id 10:
delete from Vendas where idVendas = 10;
-- 9. Excluir a forma de pagamento 'Pix' da venda 6:
delete from FormaPag where idFormaPag = 6;
-- 10. Excluir o endereço do cliente 'Diego Monteiro':
delete from EnderecoCli where Cliente_CPF_Cli = '01234567890';
-- 11. Excluir o contato de 'cliente2@email.com':
delete from Contato where idContato = 8;
-- 12. Excluir o livro 'Dom Casmurro':
delete from Livros where ISBN = '9780000000011';
-- 13. Excluir o exemplar com NumeroSerie 2:
delete from Exemplar where NumeroSerie = 2;
-- 14. Excluir o registro de PedidoExemplares para Pedido 1 e Exemplar 11:
delete from PedidoExemplares where Pedidos_idPedidos = 1 and Exemplar_NumeroSerie = 11;
-- 15. Excluir a palavra-chave 'ética':
delete from PalavraChave where idPalavraChave = 7;
-- 16. Excluir o registro de LivroPalavras para '9780000000016' e palavra-chave 'cálculo':
delete from LivroPalavras where Livros_ISBN = '9780000000016' and PalavraChave_idPalavraChave = 6;
-- 17. Excluir o autor 'Luis Fernando':
delete from Autor where CPF_Autor = '111.222.333-44';
-- 18. Excluir o registro de LivroAutores para o livro '9780000000015' e o autor 'Jéssica Ramos':
delete from LivroAutores where Livros_ISBN = '9780000000015' and Autor_CPF_Autor = '555.666.777-88';
-- 19. Excluir a área de conhecimento 'Filosofia':
delete from AreaConhecimento where idAreaConhecimento = 7;

-- Scripts de Atualização (update)
-- 20. Atualizar o salário de 'Carlos Souza' para 4800.00:
update Funcionario set salario = 4800.00 where CPF_Func = '23456789012';
-- 21. Atualizar o título do livro 'Lógica de Programação' para 'Lógica de Programação Avançada':
update Livros set titulo = 'Lógica de Programação Avançada' where ISBN = '9780000000013';
-- 22. Atualizar o status do pedido 5 para 'em trânsito':
update Pedidos set Status = 'em trânsito' where idPedidos = 5;
-- 23. Atualizar o valor da venda 12 para 130.00:
update Vendas set valor = 130.00 where idVendas = 12;
-- 24. Atualizar o email do contato de 'cliente1@email.com' para 'novo_email@email.com':
update Contato set Email = 'novo_email@email.com' where Cliente_CPF_Cli = '12345678901';
-- 25. Atualizar a biografia do autor 'Marina Torres':
update Autor set Biografia = 'Especialista em computação e escritora de ficção científica' where CPF_Autor = '222.333.444-55';
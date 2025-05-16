/* Comandos DDL - alter table*/
-- 1. Modificar a coluna Descricao na tabela CategoriasLivros para varchar(255)
alter table CategoriasLivros
modify Descricao varchar(255);
-- 2. Adicionar uma constraint CHECK para a coluna Nota na tabela AvaliacoesLivros
alter table AvaliacoesLivros
add constraint CHK_Nota check (Nota >= 1 and Nota <= 5);
-- 3. Modificar a coluna DescricaoPremio na tabela PremiosLiterarios para TEXT
alter table PremiosLiterarios
modify DescricaoPremio text;
-- 4. Modificar a coluna Comentario na tabela AvaliacoesLivros para TEXT
alter table AvaliacoesLivros
modify Comentario text;
-- 5. Adicionar a coluna DataCadastro na tabela Fornecedores
alter table Fornecedores
add DataCadastro date;
-- 6. Adicionar coluna para armazenar URL da capa do livro na tabela Livros
alter table Livros
add CapaURL varchar(255);
-- 7. Adicionar coluna para indicar se o livro é um lançamento
alter table Livros
add Lancamento varchar(45);
-- 8. Modificar a tabela EstoqueLivros para permitir valores nulos em Localizacao
alter table EstoqueLivros
modify Localizacao varchar(50) null;
-- 9. Adicionar uma coluna para armazenar o preço do livro
alter table Livros
add Preco decimal(10, 2);
-- 10. Adicionar coluna para data de publicação na tabela Fornecedores
alter table Fornecedores
add DataPublicacao date;
-- 11. Adicionar coluna para desconto máximo permitido
alter table Livros
add DescontoMaximo decimal (4,2);
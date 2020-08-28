DECLARE @id INT = (SELECT MAX(id) from nomes),
		@nome varchar(255)
WHILE (select count(nome) from nomes WHERE id IS NULL)>0
BEGIN
SET @nome = (select TOP(1) nome from nomes WHERE id IS NULL ORDER BY nome ASC)
UPDATE nomes
set id=@id
where nome=@nome
SET @id=@id+1
END
DECLARE @id INT = (SELECT TOP(1) MIN(id) FROM testeUser),
		@MaiorId INT = (SELECT TOP(1) MAX(id) FROM testeUser),
		@soma1 FLOAT,
		@soma0 FLOAT,
		@calc FLOAT,
		@Update DATETIME
WHILE @id<@MaiorId
BEGIN
	SET @soma1 = (select SUM(valor) from testeRepeticao with(nolock) where userId=@id and status=1)
	SET @soma0 = (select SUM(valor) from testeRepeticao with(nolock) where userId=@id and status=0)
	SET @calc = @soma1 - @soma0
	SET @Update = GETDATE()
	UPDATE testeUser
	SET Soma1=@soma1,Soma0=@soma0,calc=@calc,ultUpdate=@Update WHERE id=@id
	SET @id = @id + 1
END
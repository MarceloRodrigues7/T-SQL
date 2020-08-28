DECLARE @userId INT,
		@nome VARCHAR(255),
		@data DATETIME,
		@cidade VARCHAR(255),
		@valor FLOAT,
		@status BIT,
		@repetir INT
SET @repetir = 0

WHILE @repetir < 100000

BEGIN
SET @userId = (SELECT TOP 1 id FROM testeUser WITH(NOLOCK) ORDER BY NEWID())
SET @data = GETDATE()
SET @nome = (SELECT nome FROM testeUser WITH(NOLOCK) WHERE id=@userId)
SET @cidade = (SELECT cidade FROM testeUser WITH(NOLOCK) WHERE id=@userId)
SET @valor= ROUND(((1000 - 10 -1) * RAND() +10), 2)
SET @status=CONVERT(BIT, ROUND(1*RAND(),0))
INSERT INTO testeRepeticao(userId,nome,data,cidade,valor,status)
VALUES(@userId,@nome,@data,@cidade,@valor,@status)
SET @repetir = @repetir+1
END
GO
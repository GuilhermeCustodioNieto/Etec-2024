-- 1. Crie uma fun��o que informada uma data da matr�cula , retorne o dia da semana
CREATE FUNCTION fn_nomeDiaSemana(@DataEntrada date)
    RETURNS varchar(40) AS
BEGIN
    DECLARE @NomeDiaSemana varchar(40)
    DECLARE @NumeroDia int

    SET @NumeroDia = DATEPART(dw, @DataEntrada)

    IF @NumeroDia = 1
    BEGIN
        SET @NomeDiaSemana = 'DOMINGO'
    END
    IF @NumeroDia = 2
    BEGIN
        SET @NomeDiaSemana = 'SEGUNDA-FEIRA'
    END
    IF @NumeroDia = 3
    BEGIN
        SET @NomeDiaSemana = 'TER�A-FEIRA'
    END
    IF @NumeroDia = 4
    BEGIN
        SET @NomeDiaSemana = 'QUARTA-FEIRA'
    END
    IF @NumeroDia = 5
    BEGIN
        SET @NomeDiaSemana = 'QUINTA-FEIRA'
    END
    IF @NumeroDia = 6
    BEGIN
        SET @NomeDiaSemana = 'SEXTA-FEIRA'
    END
    IF @NumeroDia = 7
    BEGIN
        SET @NomeDiaSemana = 'S�BADO'
    END

    RETURN @NomeDiaSemana
END

-- 2. Crie uma fun��o que de acordo com a carga hor�ria do curso exiba curso r�pido ou curso extenso. (R�pido menos de 1000 horas).
CREATE FUNCTION fc_cargaCurso(@horasCurso INT)
RETURN VARCHAR(13)
AS BEGIN
	IF(@horasCurso < 1000) 
	BEGIN
		RETURN "Curso r�pido"
	END

	ELSE
	BEGIN
		RETURN "Curso extenso"
	END
END

-- 3. Crie uma fun��o que de acordo com o valor do curso exiba curso caro ou curso barato. (Curso caro acima de 400).
CREATE FUNCTION fc_precoCurso(@valor DECIMAL)
RETURN VARCHAR(12) 
AS BEGIN
	IF(@valor > 400)
	BEGIN
		RETURN "Curso caro"
	END

	ELSE
	BEGIN
		RETURN "Curso barato"
	END
END

-- 4. Criar uma fun��o que informada a data da matr�cula converta-a no formato dd/mm/aaaa.
CREATE FUNCTION fc_converterData(@data DATE)
RETURN VARCHAR(10)
AS
BEGIN 
	RETURN CONVERT(VARCHAR(10), @data, 103)
END



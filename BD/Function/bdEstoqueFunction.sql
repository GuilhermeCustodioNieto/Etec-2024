USE db_estoque

-- Criar uma fun��o que retorne o dia de semana da venda (no formato segunda, ter�a, etc) ao lado do c�digo da venda, valor total da venda e sua data
CREATE FUNCTION fc_diaSemanaVenda(@codVenda INT)
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @diaSemana VARCHAR(20);
    DECLARE @valorTotal FLOAT;
    DECLARE @dataVenda DATETIME;
    DECLARE @mensagem VARCHAR(255);

    SELECT 
        @diaSemana = FORMAT(dataVenda, 'dddd', 'pt-BR'),
        @valorTotal = valorTotalVenda,
        @dataVenda = dataVenda
    FROM 
        tblVenda
    WHERE 
        codVenda = @codVenda;

    IF @diaSemana IS NOT NULL
        SET @mensagem = 'A venda de c�digo ' + CAST(@codVenda AS VARCHAR) + 
                        ' foi realizada em ' + @diaSemana + 
                        ', com valor total de R$ ' + CAST(@valorTotal AS VARCHAR) +
                        ' na data ' + CONVERT(VARCHAR, @dataVenda, 103) + '.';
    ELSE
        SET @mensagem = 'Venda n�o encontrada para o c�digo fornecido.';

    RETURN @mensagem;
END;

-- Criar uma fun��o que receba o c�digo do cliente e retorne o total de vendas que o cliente j� realizou
CREATE FUNCTION fc_totalVendasCliente(@codCliente INT)
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @totalVendas INT;
    DECLARE @mensagem VARCHAR(255);

    SELECT 
        @totalVendas = COUNT(*)
    FROM 
        tblVenda
    WHERE 
        codCliente = @codCliente;

    IF @totalVendas > 0
        SET @mensagem = 'O cliente com c�digo ' + CAST(@codCliente AS VARCHAR) +
                        ' realizou um total de ' + CAST(@totalVendas AS VARCHAR) + ' vendas.';
    ELSE
        SET @mensagem = 'Nenhuma venda encontrada para o cliente com c�digo ' + CAST(@codCliente AS VARCHAR) + '.';

    RETURN @mensagem;
END;

-- Criar uma fun��o que receba o c�digo de um vendedor e o m�s e informe o total de vendas do vendedor no m�s informado
CREATE FUNCTION fc_totalVendasClienteMes(@codCliente INT, @mes INT, @ano INT)
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @totalVendas INT;
    DECLARE @mensagem VARCHAR(255);

    SELECT 
        @totalVendas = COUNT(*)
    FROM 
        tblVenda
    WHERE 
        MONTH(dataVenda) = @mes 
        AND YEAR(dataVenda) = @ano
        AND codCliente = @codCliente;

    IF @totalVendas > 0
        SET @mensagem = 'O cliente com c�digo ' + CAST(@codCliente AS VARCHAR) +
                        ' realizou um total de ' + CAST(@totalVendas AS VARCHAR) +
                        ' vendas no m�s ' + CAST(@mes AS VARCHAR) + '/' + CAST(@ano AS VARCHAR) + '.';
    ELSE
        SET @mensagem = 'Nenhuma venda encontrada para o cliente com c�digo ' + 
                        CAST(@codCliente AS VARCHAR) + ' no m�s ' + CAST(@mes AS VARCHAR) + '/' + CAST(@ano AS VARCHAR) + '.';

    RETURN @mensagem;
END;


-- � Criar uma fun��o que usando o bdEstoque diga se o cpf do cliente � ou n�o v�lido
CREATE FUNCTION fc_validaCPF(@CPF VARCHAR(11))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @INDICE INT,
            @SOMA INT,
            @DIG1 INT,
            @DIG2 INT,
            @CPF_TEMP VARCHAR(1),
            @DIGITOS_IGUAIS CHAR(1),
            @RESULTADO VARCHAR(50);

    SET @RESULTADO = 'CPF inv�lido';

    SET @CPF_TEMP = SUBSTRING(@CPF, 1, 1);
    SET @INDICE = 1;
    SET @DIGITOS_IGUAIS = 'S';

    WHILE (@INDICE <= 11)
    BEGIN
        IF SUBSTRING(@CPF, @INDICE, 1) <> @CPF_TEMP
            SET @DIGITOS_IGUAIS = 'N';
        SET @INDICE = @INDICE + 1;
    END;

    IF @DIGITOS_IGUAIS = 'N'
    BEGIN
      
        SET @SOMA = 0;
        SET @INDICE = 1;
        
        WHILE (@INDICE <= 9)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1)) * (11 - @INDICE);
            SET @INDICE = @INDICE + 1;
        END;

        SET @DIG1 = 11 - (@SOMA % 11);
        IF @DIG1 > 9 SET @DIG1 = 0;

        SET @SOMA = 0;
        SET @INDICE = 1;
        
        WHILE (@INDICE <= 10)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1)) * (12 - @INDICE);
            SET @INDICE = @INDICE + 1;
        END;

        SET @DIG2 = 11 - (@SOMA % 11);
        IF @DIG2 > 9 SET @DIG2 = 0;

        IF (@DIG1 = CONVERT(INT, SUBSTRING(@CPF, 10, 1)) AND 
            @DIG2 = CONVERT(INT, SUBSTRING(@CPF, 11, 1)))
            SET @RESULTADO = 'CPF v�lido';
        ELSE
            SET @RESULTADO = 'CPF inv�lido';
    END;

    RETURN @RESULTADO;
END;

USE db_estoque

-- Criar uma função que retorne o dia de semana da venda (no formato segunda, terça, etc) ao lado do código da venda, valor total da venda e sua data
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
        SET @mensagem = 'A venda de código ' + CAST(@codVenda AS VARCHAR) + 
                        ' foi realizada em ' + @diaSemana + 
                        ', com valor total de R$ ' + CAST(@valorTotal AS VARCHAR) +
                        ' na data ' + CONVERT(VARCHAR, @dataVenda, 103) + '.';
    ELSE
        SET @mensagem = 'Venda não encontrada para o código fornecido.';

    RETURN @mensagem;
END;

-- Criar uma função que receba o código do cliente e retorne o total de vendas que o cliente já realizou
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
        SET @mensagem = 'O cliente com código ' + CAST(@codCliente AS VARCHAR) +
                        ' realizou um total de ' + CAST(@totalVendas AS VARCHAR) + ' vendas.';
    ELSE
        SET @mensagem = 'Nenhuma venda encontrada para o cliente com código ' + CAST(@codCliente AS VARCHAR) + '.';

    RETURN @mensagem;
END;

-- Criar uma função que receba o código de um vendedor e o mês e informe o total de vendas do vendedor no mês informado
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
        SET @mensagem = 'O cliente com código ' + CAST(@codCliente AS VARCHAR) +
                        ' realizou um total de ' + CAST(@totalVendas AS VARCHAR) +
                        ' vendas no mês ' + CAST(@mes AS VARCHAR) + '/' + CAST(@ano AS VARCHAR) + '.';
    ELSE
        SET @mensagem = 'Nenhuma venda encontrada para o cliente com código ' + 
                        CAST(@codCliente AS VARCHAR) + ' no mês ' + CAST(@mes AS VARCHAR) + '/' + CAST(@ano AS VARCHAR) + '.';

    RETURN @mensagem;
END;


-- • Criar uma função que usando o bdEstoque diga se o cpf do cliente é ou não válido
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

    SET @RESULTADO = 'CPF inválido';

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
            SET @RESULTADO = 'CPF válido';
        ELSE
            SET @RESULTADO = 'CPF inválido';
    END;

    RETURN @RESULTADO;
END;

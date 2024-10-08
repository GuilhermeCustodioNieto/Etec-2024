USE db_estoque
CREATE TRIGGER tgAtualizaQuantidade
	ON tblItensVenda
	AFTER INSERT
	AS
	BEGIN
		DECLARE @quantidadeProduto INT, @produto INT
		SET @quantidadeProduto = (SELECT quantidadeItensVenda FROM inserted)
		set @produto = (SELECT codProduto FROM inserted)

		UPDATE tbProduto SET quantidade = @quantidadeProduto + quantidade WHERE codProduto = @produto
	END

CREATE TRIGGER tbAumentaQuantidadeProdutos
	ON tbEntradaProduto
	AFTER INSERT
	AS 
	BEGIN
		DECLARE @codProduto INT, @quantidade INT
		SET @codProduto = (SELECT codProduto FROM inserted)
		SET @quantidade = (SELECT quantidadeEntradaProduto FROM inserted)

		UPDATE tblProduto SET quantidadeProduto = quantidadeProduto + @quantidade WHERE codProduto = @codProduto
	END

CREATE TRIGGER tgVendaFeita
	ON tblItensVenda
	AFTER INSERT
	AS
	BEGIN
		DECLARE @quantidadeProduto INT, @produto INT
		SET @quantidadeProduto = (SELECT quantidadeItensVenda FROM inserted)
		set @produto = (SELECT codProduto FROM inserted)

		INSERT INTO tbSaidaProduto (dataSaidaProduto, codProduto, quantidadeSaidaProduto)
		VALUES (GETDATE(), @produto, @quantidadeProduto)

	END


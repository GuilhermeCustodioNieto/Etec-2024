USE db_estoque
CREATE TRIGGER tgAtualizaQuantidade
	ON tblItensVenda
	AFTER INSERT
	AS
	BEGIN
		DECLARE @quantidadeProduto INT, @produto INT
		SET @quantidadeProduto = (SELECT quantidadeItensVenda FROM inserted)
		set @produto = (SELECT idProduto FROM inserted)

		UPDATE tbProduto SET quantidade = @quantidadeProduto + quantidade
	END
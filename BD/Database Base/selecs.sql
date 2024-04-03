SELECT descricaoProduto, descricaoFabricante
FROM tblProduto
    INNER JOIN tblFabricante
        ON tblProduto.codFabricante = tblFabricante.codFabricante

SELECT descricaoProduto, nomeFornecedor
FROM tblProduto
    INNER JOIN tblFabricante
        ON tblProduto.codFornecedor = tblFornecedor.nomeFornecedor
package cadastroApp.services;


import cadastroApp.entities.Produto;
import cadastroApp.repositories.ProdutoRepository;

import java.util.List;

public class ProdutoService {

    private ProdutoRepository produtoRepository = new ProdutoRepository();

    public List<Produto> findAll() {
        return produtoRepository.findAll();
    }

    public void create(Produto produto) {
         produtoRepository.create(produto);
    }
}

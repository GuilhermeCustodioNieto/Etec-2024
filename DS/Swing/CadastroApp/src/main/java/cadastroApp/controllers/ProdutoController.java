package cadastroApp.controllers;


import cadastroApp.entities.Produto;
import cadastroApp.services.ProdutoService;
import java.util.List;

public class ProdutoController {

    private ProdutoService produtoService = new ProdutoService();


    public String findAll(){
        List<Produto> produtos = produtoService.findAll();

        String dados = "";
        for(Produto produto : produtos){
            dados += produto.getName();
            dados += "\t" + produto.getPrice();
            dados += "\n";
        }

        return dados;
    }

}

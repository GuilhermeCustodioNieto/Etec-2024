import entities.Conteudo;
import entities.Filme;
import entities.Serie;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Conteudo> catalogo = new ArrayList<>();

        catalogo.add(new Filme("Ação", "Vingadores: Ultimato", 181));
        catalogo.add(new Filme("Comédia", "A Noite dos Mortos-Vivos", 100));
        catalogo.add(new Filme("Drama", "À Espera de um Milagre", 189));
        catalogo.add(new Filme("Terror", "O Exorcista", 122));
        catalogo.add(new Filme("Ficção Científica", "Duna", 155));

        catalogo.add(new Serie("Ação", "The Witcher", 60, 16, 2));
        catalogo.add(new Serie("Drama", "This Is Us", 43, 88, 6));
        catalogo.add(new Serie("Comédia", "Brooklyn Nine-Nine", 22, 153, 8));
        catalogo.add(new Serie("Terror", "Stranger Things", 50, 34, 4));
        catalogo.add(new Serie("Ficção Científica", "Westworld", 60, 28, 4));

        for(Conteudo conteudo : catalogo){
            System.out.println(conteudo.descricao());
            System.out.println();
        }
    }
}

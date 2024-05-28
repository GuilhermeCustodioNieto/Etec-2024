package com.application;

import com.model.entities.Livro;
import com.model.entities.Publicacao;
import com.model.entities.Revista;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);



        //Publicação
        System.out.println("PUBLICAÇÃO");

        System.out.print("Digite o titulo da publicação: ");
        String titulo = scan.nextLine();
        System.out.print("Digite o autor da publicação: ");
        String autor = scan.nextLine();
        System.out.print("Digite o ano de publicação da publicação: ");
        int anoPublicacao = scan.nextInt();

        scan.nextLine();

        Publicacao publicacao = new Publicacao(titulo, autor, anoPublicacao);

        System.out.println();
        System.out.println(publicacao.exibirDetalhes());
        System.out.println();

        //livro

        System.out.println("LIVRO");

        System.out.print("Digite o titulo do livro: ");
        titulo = scan.nextLine();

        System.out.print("Digite o autor do livro: ");
        autor = scan.nextLine();

        System.out.print("Digite o ano de publicação do livro:  ");
        anoPublicacao = scan.nextInt();

        scan.nextLine();

        System.out.print("Digite a editora do livro: ");
        String editora = scan.nextLine();

        System.out.print("Digite o número de páginas do livro: ");
        int numPaginas = scan.nextInt();

        System.out.print("Incluir editora na hora de exibir detalhes? (S/N) ");
        boolean incluirEditora = scan.next().charAt(0) == 'S';

        scan.nextLine();

        Livro livro = new Livro(titulo, autor, anoPublicacao,editora, numPaginas);

        System.out.println();
        System.out.println(livro.exibirDetalhes(incluirEditora));
        System.out.println();

        // Revista
        System.out.println("REVISTA");

        System.out.print("Digite o titulo da revista:  ");
        titulo = scan.nextLine();

        System.out.print("Digite o autor da revista:  ");
        autor = scan.nextLine();

        System.out.print("Digite o ano de publicação da revista:   ");
        anoPublicacao = scan.nextInt();

        scan.nextLine();

        System.out.print("Digite o número da edição da revista: ");
        int numEdicao = scan.nextInt();

        System.out.print("Digite o mes de publicação da revista: ");
        String mesPublicado = scan.next();

        System.out.print("Incluir mês de publicação na hora de exibir detalhes? (S/N) ");
        boolean incluirMes = scan.next().charAt(0) == 'S';

        Revista revista = new Revista(titulo, autor, anoPublicacao, numEdicao, mesPublicado);

        System.out.println();
        System.out.println(revista.exibirDetalhes(incluirMes));


    }
}

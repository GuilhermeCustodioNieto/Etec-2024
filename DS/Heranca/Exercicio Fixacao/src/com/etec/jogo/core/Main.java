package com.etec.jogo.core;

import com.etec.jogo.model.entities.Jogo;
import com.etec.jogo.model.entities.JogoEletronico;
import com.etec.jogo.model.entities.JogoFisico;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        ArrayList<Jogo> jogos = new ArrayList<Jogo>();

        System.out.print("Deseja adicionar um jogo? (s/n) ");
        boolean desejaRodar = scan.next().equalsIgnoreCase("s");
        while(desejaRodar){
            System.out.print("Digite o nome do jogo: ");
            scan.nextLine();

            String nome = scan.nextLine();



            System.out.print("Digite o preço do jogo: ");
            double preco = scan.nextDouble();

            scan.nextLine();

            System.out.print("Digite a distribuidora do jogo: ");
            String distribuidora = scan.nextLine();

            System.out.println("Deseja adicionar um jogo fisico (1) ou eletrônico? (2)");
            String test = scan.next();
            if(test.equalsIgnoreCase("1")){
                System.out.print("Digite a quantidade de jogadores do jogo: ");
                int quantidadeJogadores = scan.nextInt();
                System.out.print("Digite a quantidade de tempo da partida (em minutos): ");

                int tempoPartida = scan.nextInt();
                jogos.add(new JogoFisico(nome, preco, distribuidora, quantidadeJogadores, tempoPartida));
            } else if(test.equalsIgnoreCase("2")){
                scan.nextLine();

                System.out.print("Escreva o genero do jogo: ");
                String genero = scan.nextLine();

                System.out.print("Escreva a plataforma do jogo: ");
                String plataforma = scan.nextLine();
                jogos.add(new JogoEletronico(nome, preco, distribuidora, genero, plataforma));
            }

            System.out.print("Deseja adicionar outro jogo? ");
            desejaRodar = scan.next().equalsIgnoreCase("s");
        }

        System.out.println("--------------------------------");

        System.out.println("JOGOS DA LOCADORA:");
        for (Jogo jogo:
             jogos) {
            System.out.println(jogo.toString());
        }
    }
}

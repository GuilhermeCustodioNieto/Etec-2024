package Clientes;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		
		//Scanner 	
		Scanner in = new Scanner(System.in);
	
		//Variaveis	
		String nome1, nome2, endereco1, endereco2;
		int idade1, idade2;
		
		// Inst�ncia
		
		// Cliente Padr�o
		System.out.println("CADASTRO DE CLIENTE");

		System.out.print("Informe seu nome: ");
		String nome = in.next();

		System.out.print("Informe sua idade: ");
		int idade = in.nextInt();

		System.out.print("Informe seu endere�o: ");
		in.nextLine();

		String endereco = in.nextLine();

		System.out.print("Informe o valor de sua Compra: ");
		double valorOriginal  = in.nextDouble();

		Cliente clientePadrao = new Cliente(nome, idade, endereco, valorOriginal);


		System.out.println();

		//Cliente premium
		System.out.println("CADASTRO DE CLIENTE PREMIUM");

		System.out.print("Informe seu nome: ");
		nome = in.next();

		System.out.print("Informe sua idade: ");
		idade = in.nextInt();

		System.out.print("Informe seu endere�o: ");

		in.nextLine();

		endereco = in.nextLine();

		System.out.print("Informe o valor de sua Compra: ");
		valorOriginal = in.nextDouble();

		ClientePremium clientePremium = new ClientePremium(nome, idade, endereco, valorOriginal);
				
		// Apresenta��o
		System.out.println("------------------------------");
		System.out.println(clientePadrao.toString());
		System.out.println();
		System.out.println(clientePremium.toString());

		in.close();
	}
}

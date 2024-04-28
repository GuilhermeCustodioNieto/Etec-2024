package com.core;

import java.util.Scanner;

import com.entities.Produto;

public class TesteProduto {

	public static void main(String[] args) {	
		Scanner scan = new Scanner(System.in);
		
		//Entrada de dados
		System.out.print("Entre com o nome do produto 1: ");
		String nomeProduto1 = scan.nextLine();
		System.out.print("Entre com o preço do produto 1: ");
		double precoProduto1 = scan.nextDouble();
		
		System.out.println();
		
		System.out.print("Entre com o nome do produto 2: ");
		scan.nextLine();
		String nomeProduto2 = scan.nextLine();
		System.out.print("Entre com o preço do produto 2: ");
		double precoProduto2 = scan.nextDouble();
		
		//Uso dos construtores
		Produto produto1 = new Produto(0, nomeProduto1, precoProduto1);
		Produto produto2 = new Produto(1, nomeProduto2, precoProduto2);
		
		System.out.println("-------------------------------------------------");
		
		//Uso dos getters e setters
		System.out.print("Agora, vamos alterar o nome do produto 1: ");
		scan.nextLine();
		produto1.setNome(scan.nextLine());
		
		System.out.println();
		
		System.out.print("Agora, vamos alterar o preço do produto 2: ");
		produto2.setPreco(scan.nextDouble());
		
		System.out.println("-------------------------------------------------");
		
		//Método calcular desconto
		System.out.print("Entre com desconto do produto 1: ");
		double produto1Desconto = produto1.calcularDesconto(scan.nextDouble());
		
		System.out.print("Entre com desconto do produto 2: ");
		double produto2Desconto = produto2.calcularDesconto(scan.nextDouble());
		
		System.out.println("-------------------------------------------------");
		
		//Saída dos dados
		System.out.printf("Produto 1: %s, Preço com Desconto: %.2f%n", produto1.toString(), produto1Desconto);
		System.out.printf("Produto 2: %s, Preço com Desconto: %.2f", produto2.toString(), produto2Desconto);
		
		scan.close();
	}

}

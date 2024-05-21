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
		System.out.println("Cadastro de Cliente");
		
		// nome
		System.out.println("Informe seu nome:");
		nome1 = in.next();
		
		// idade
		System.out.println("Informe sua idade:");
		idade1 = in.nextInt();
		
		// endere�o
		System.out.println("Informe seu endere�o:");
		in.nextLine();
		endereco1 = in.nextLine();
		
		// Objeto
		Cliente clientePadrao = new Cliente(nome1, idade1, endereco1);
		
		// Compra do Cliente Padr�o
		System.out.println("Informe o valor de sua Compra");
		clientePadrao.setValorPedido(in.nextDouble());
		clientePadrao.setValorPromocional(clientePadrao.calcularDesconto());
		
		// Cliente Premium
		
		System.out.println("Cadastro de Cliente Premium");
		
		// nome
		System.out.println("Informe seu nome:");
		nome2 = in.next();
		
		// idade
		System.out.println("Informe sua idade:");
		idade2 = in.nextInt();
		
		// endere�o
		System.out.println("Informe seu endere�o:");
		in.nextLine();
		endereco2 = in.nextLine();
		
		// Objeto
		Cliente clientePremium = new ClientePremium(nome2, idade2, endereco2);
		
		// Compra do Cliente Padr�o
		System.out.println("Informe o valor de sua Compra");
		clientePremium.setValorPedido(in.nextDouble());
		clientePremium.setValorPromocional(clientePremium.calcularDesconto());
				
		// Apresenta��o
		System.out.printf("%n Valor final para o Cliente R$%.2f%n", clientePadrao.getValorPromocional());
		System.out.printf("%n Valor final para o Cliente Premium R$%.2f%n", clientePremium.getValorPromocional());		
		in.close();
	}
}

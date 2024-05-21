package automoveis;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		// Scanner
		
		Scanner in = new Scanner(System.in);
		
		// Objeto Carro
		
		System.out.println("Inserir o modelo do carro");
		String modelo = in.next();
		System.out.println("Inserir a marca do carro");
		String marca = in.next();
		System.out.println("Inseir a cor do carro");
		String cor = in.next();
		System.out.println("Inserir o ano do carro");
		int ano = in.nextInt();
		System.out.println("Inseir a quantidade de porta");
		int quantidadePortas = in.nextInt();

		Carro carro = new Carro(marca, modelo, cor, ano, quantidadePortas);
		
		// Objeto Moto
		

		
		System.out.println("Inserir o modelo do moto");
		modelo = in.next();
		System.out.println("Inserir a marca do moto");
		marca = in.next();
		System.out.println("Inseir a cor do moto");
		cor = in.next();
		System.out.println("Inserir o ano do moto");
		ano = in.nextInt();
		System.out.println("Inserir as cilidrandas da moto");
		int cilindradas = in.nextInt();

		Moto moto = new Moto(marca, modelo, cor, ano, cilindradas);


		// exibir 
		System.out.println(carro.toString());
		System.out.println(moto.toString());
	
		in.close();
	}

}


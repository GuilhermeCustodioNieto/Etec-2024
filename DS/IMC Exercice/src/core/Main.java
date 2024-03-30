package core;
import java.util.Locale;
import java.util.Scanner;

import entities.Imc;

public class Main {

	public static void main(String[] args) {
		Locale.setDefault(Locale.US);
		Scanner scan = new Scanner(System.in);
		
		System.out.print("Insira seu nome: ");
		String nome = scan.next();
		
		System.out.print("Insira sua idade: ");
		int idade = scan.nextInt();
		
		System.out.print("Insira seu peso: ");
		double peso = scan.nextDouble();		
		
		System.out.print("Insira sua altura (X,XX): ");
		double altura = scan.nextDouble();
		
		Imc imc = new Imc(nome, idade, peso, altura);
		
		System.out.println(imc.calcularImc());
		
		
		scan.close();
	}

}

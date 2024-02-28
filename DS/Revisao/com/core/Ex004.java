package com.core;

import java.util.Scanner;

public class Ex004 {

	public static void main(String[] args) {
		try {
			Scanner scan = new Scanner(System.in);
			
			System.out.println("Deseja calcular a idade uma pessoa?");
			String userChoice = scan.next();
			
			while (!userChoice.equalsIgnoreCase("NÃO")) {
				System.out.println("Entre com o ano de nascimento: ");
				int anoNasc = scan.nextInt();
				
				System.out.println("Entre com o ano atual: ");
				int anoAtual = scan.nextInt();
				
				System.out.println("Sua idade É: " + calcularIdade(anoNasc, anoAtual));
				
				System.out.println("Deseja calcular a idade mais uma pessoa?");
				userChoice = scan.next();
			}
			
			scan.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
	public static int calcularIdade(int anoNasc, int anoAtual) {
		return anoAtual - anoNasc;
	}

}

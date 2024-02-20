package com.core;

import java.util.Scanner;

public class Ex003 {
	static int password = 2002;
	public static void main(String[] args) {
		try {
			Scanner scan = new Scanner(System.in);
			
			int inputUser = scan.nextInt();
			while(inputUser != password) {
				System.out.println("Senha incorreta!");
				inputUser = scan.nextInt();
			}
			System.out.println("Senha correta");
			System.out.println("Fim do Programa");
		
			scan.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//1)Escreva um programa que repita a leitura de uma senha até que ela seja válida. Para cada leitura de senha incorreta informada, escrever a mensagem "Senha Invalida". Quando a senha for informada corretamente deve ser impressa a mensagem "Acesso Permitido" e o algoritmo encerrado. Considere que a senha correta é o valor 2002.
	}

}

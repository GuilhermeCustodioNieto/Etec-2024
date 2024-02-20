package com.core;

import java.util.Scanner;

public class Ex001 {

	public static void main(String[] args) {
		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("Entre com um número: ");
			int numero = scan.nextInt();
			
			if(numero <0) {
				System.out.println("É negativo");
			} else {
				System.out.println("É positivo");
			}
			
			scan.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		

	}

}

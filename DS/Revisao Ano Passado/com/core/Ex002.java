package com.core;

import java.util.Scanner;

public class Ex002 {

	public static void main(String[] args) {
	
		try {
			Scanner scan = new Scanner(System.in);
			int numero = scan.nextInt();
			if(numero % 2 == 0) {
				System.out.println("� par");
			} else {
				System.out.println("� impar");
			}	
			
			scan.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

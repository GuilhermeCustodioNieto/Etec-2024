package com.core;

import java.util.Scanner;

public class ex006 {

	public static void main(String[] args) {
		
		try {
			Scanner scan = new Scanner(System.in);
			
			int[] vetor = {3,2,8,7,5,4};
			
			for(int i=0; i<vetor.length; i++ ) {
				System.out.printf("Na posição %d temos o valor %d%n", i, vetor[i]);
			}
			
			scan.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

package com.core;

import java.util.Locale;
import java.util.Scanner;

public class Ex001 {

	public static void main(String[] args) {
		Locale.setDefault(Locale.US);
		try {
			Scanner scan = new Scanner(System.in);
			double[][] notas = new double[3][4];
			for(int i=0; i<notas.length; i++) {
				System.out.printf("Entre com as notas do aluno %d%n", i+1);
				for(int j=0; j<notas[i].length; j++) {
					System.out.printf("Entre com a nota %d: %n", j+1);
					double notaAtual = scan.nextDouble();
					
					notas[i][j] = notaAtual;
				}
				System.out.println("-----------------------------------");
			}
			
			
			for(int i=0; i<notas.length; i++) {
				System.out.printf("Aluno %d notas: ", i+1);
				for(int j=0; j<notas[i].length; j++) {
					System.out.print(notas[i][j]);
					System.out.print(j==notas[i].length - 1 ? "" : "; " );
				}
				System.out.println();
			}
			
			scan.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

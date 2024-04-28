package com.core;

import com.entities.Calculadora;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        Calculadora calculadora = new Calculadora();

        System.out.println("Entre com o numero decimal 1");
        double doubleN1=scan.nextDouble();
        System.out.println("Entre com o numero decimal 2");
        double doubleN2= scan.nextDouble();

        System.out.println("Entre com o numero inteiro 1");
        int intN1 = scan.nextInt();

        System.out.println("Entre com o numero inteiro 2");
        int intN2 = scan.nextInt();

        double[] doubleValues = {9.8,7.5, 8,9, 3.2};
        int[] intValues = {1,2,5,9,8};

        System.out.println("FUNÇÕES DE SOMA: \n");

        calculadora.soma(intN1, intN2);
        System.out.println("Função de soma com inteiros: " + calculadora.getResultado());

        calculadora.soma(doubleN1, doubleN2);
        System.out.println("Funçao de soma com decimais: " + calculadora.getResultado());

        calculadora.soma(intValues);
        System.out.println("Funcão de soma com array de inteiros:" + calculadora.getResultado());

        calculadora.soma(doubleValues);
        System.out.println("Função de soma com array de decimais: " + calculadora.getResultado());

        System.out.println();

        System.out.println("FUNÇÕES DE SUBTRAÇãO: \n");


        calculadora.subtracao(intN1, intN2);
        System.out.println("Função de soma com inteiros: " + calculadora.getResultado());

        calculadora.subtracao(doubleN1, doubleN2);
        System.out.println("Funçao de soma com decimais: " + calculadora.getResultado());

        calculadora.subtracao(intValues);
        System.out.println("Funcão de soma com array de inteiros:" + calculadora.getResultado());

        calculadora.subtracao(doubleValues);
        System.out.println("Função de soma com array de decimais: " + calculadora.getResultado());


    }

}

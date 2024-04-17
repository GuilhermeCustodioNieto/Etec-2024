package com.entities;

public class Calculadora {
    private String nome;
    private Double resultado;

    /*CONSTRUTOR*/
    public Calculadora(String nome) {
        this.nome = nome;
    }

    public Calculadora(){}

    /*GETTERS E SETTERS*/
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getResultado() {
        return resultado;
    }

    public void setResultado(Double resultado) {
        this.resultado = resultado;
    }

    /*REGRAS DE NEGÓCIO*/

    /*SOMA*/
    public void soma(int valor1, int valor2) {
        resultado = (double) (valor1 + valor2);
    }

    public void soma(double valor1, double valor2) {
        resultado = valor1 + valor2;
    }

    public void soma(int[] valores) {
        int resultado = 0;
        for(int valor : valores) {
            resultado += valor;
        }

        this.resultado =  (double) resultado;
    }

    public void soma(double[] valores) {
        double resultado = 0;
        for(double valor : valores) {
            resultado += valor;
        }

        this.resultado = resultado;
    }

    /*SUBTRAÇÃO*/

    public void subtracao(int valor1, int valor2) {
        resultado = (double) valor1 - valor2;
    }

    public void subtracao(double valor1, double valor2) {
        resultado = valor1 - valor2;
    }

    public void subtracao(int[] valores) {
        int resultado = valores[0];
        for(int i=1; i<=valores.length;  i++) {
            resultado -= valores[i];
        }

        this.resultado = (double) resultado;
    }


    public void subtracao(double[] valores) {
        double resultado = 0;
        for(int i=1; i<=valores.length;  i++) {
            resultado -= valores[i];
        }
        this.resultado = resultado;
    }

}

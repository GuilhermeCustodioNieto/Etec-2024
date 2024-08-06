package org.example.entities;

public class Circulo {
    private Ponto centro;
    private double raio;

    public Circulo(Ponto centro, double raio) {
        this.centro = centro;
        this.raio = raio;
    }

    public String forma() {
        return "Circulo: centro =" + centro.forma() + "; raio = " + raio;
    }

    public void mostrar(){
        System.out.println(forma());
    }


}

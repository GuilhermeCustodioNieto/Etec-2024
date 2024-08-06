package org.example.entities;

public class Cilindro {
    private Circulo base;
    private double altura;

    public Cilindro(Circulo b, double a) {
        this.base = b;
        this.altura = a;
    }

    public String forma() {
        return "Circulo: altura =" + base.forma() + "; altura = " + altura;
    }

    public void mostrar(){
        System.out.println(forma());
    }


}

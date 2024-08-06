package org.example;

import org.example.entities.Cilindro;
import org.example.entities.Circulo;
import org.example.entities.Ponto;

public class Principal {
    public static void main(String[] args) {
        Ponto p = new Ponto(2, 3);
        Circulo c = new Circulo(p, 10);
        Cilindro d = new Cilindro(c, 5);
        p.mostrar();
        c.mostrar();
        d.mostrar();

    }
}
package org.example.entities;

public class Ponto extends FormaGeometrica{
    private double coordx;
    private double coordy;

    public Ponto(double coordx, double coordy) {
        this.coordx = coordx;
        this.coordy = coordy;
    }

    public String forma(){
        return "Ponto: (" + coordx + ", " + coordy + ")";
    }
}

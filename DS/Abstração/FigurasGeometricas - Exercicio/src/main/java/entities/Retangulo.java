package entities;

import java.util.Objects;

public class Retangulo extends FormaGeometrica{
    private double lado;
    private double altura;

    public Retangulo(double lado, double altura) {
        this.lado = lado;
        this.altura = altura;
    }

    public double getLado() {
        return lado;
    }

    public void setLado(double lado) {
        this.lado = lado;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    @Override
    public double area() {
        return lado * altura;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Retangulo quadrado = (Retangulo) o;
        return Double.compare(lado, quadrado.lado) == 0 && Double.compare(altura, quadrado.altura) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(lado, altura);
    }

    @Override
    public String toString() {
        return "Quadrado{" +
                "lado=" + lado +
                ", altura=" + altura +
                '}';
    }


}

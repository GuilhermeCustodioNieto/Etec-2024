package entities;

public class Lucros {
    private double soma;

    public void registra(Conta c){
        soma += c.getSaldo();
    }

    public double getSoma(){
        return soma;
    }
}

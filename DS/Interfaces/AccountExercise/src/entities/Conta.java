package entities;

public interface Conta {
    void depositar(double saldo);
    double sacar(double saldo) throws Exception;
    double pegarSaldo();

}
package entities;

public class ContaCorrente extends Conta{
    private double tarifaMensal;

    public ContaCorrente(String name, String cpf, String numeroConta, double tarifaMensal) {
        super(name, cpf, numeroConta);
        this.tarifaMensal = tarifaMensal;
    }
}

package entities;

public class ContaPoupanca extends Conta{
    private double percentualRendimento = 0.01;

    public ContaPoupanca(String name, String cpf, String numeroConta) {
        super(name, cpf, numeroConta);
    }

    public double getPercentualRendimento() {
        return percentualRendimento;
    }

    public double atualizarSaldo(){
        return getSaldo() + (getSaldo() * percentualRendimento);
    }
}

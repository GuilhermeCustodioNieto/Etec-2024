package entities;

public class ContaPoupanca extends ContaGenerica{

    public ContaPoupanca(double saldo) {
        super(saldo);
    }

    public double rendimentoMensal(double percential) {
        setSaldo(getSaldo() + (getSaldo() * percential));
        return getSaldo();
    }


    @Override
    public void depositar(double saldo) {
        this.setSaldo(getSaldo() + saldo);
    }

    @Override
    public double sacar(double saldo) throws Exception {
        if(saldo <= getSaldo()) {
            setSaldo(getSaldo() - saldo);
            return saldo;
        } else {
            throw new Exception("O valor é maior que o saldo");
        }
    }

    @Override
    public double pegarSaldo() {
        return getSaldo();
    }
}


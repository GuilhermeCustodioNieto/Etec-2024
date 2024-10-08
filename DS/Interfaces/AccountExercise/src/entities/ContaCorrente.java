package entities;

import java.util.Objects;

public class ContaCorrente extends ContaGenerica{
    private double chequeEspecial;

    public ContaCorrente(double saldo, double chequeEspecial) {
        super(saldo);
        this.chequeEspecial = chequeEspecial;
    }

    public double getChequeEspecial() {
        return chequeEspecial;
    }

    public void setChequeEspecial(double chequeEspecial) {
        this.chequeEspecial = chequeEspecial;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + Objects.hash(chequeEspecial);
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        ContaCorrente other = (ContaCorrente) obj;
        return Double.doubleToLongBits(chequeEspecial) == Double.doubleToLongBits(other.chequeEspecial);
    }

    @Override
    public String toString() {
        return "ContaCorrente [chequeEspecial=" + chequeEspecial + "]";
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
        } else if(saldo <= getChequeEspecial()){
            double saldoTotal = saldo - getSaldo();
            setChequeEspecial(getChequeEspecial() - saldoTotal);
            setSaldo(0);
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
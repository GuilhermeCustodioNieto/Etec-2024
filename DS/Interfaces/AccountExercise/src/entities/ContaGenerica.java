package entities;
import java.util.Objects;

public abstract class ContaGenerica implements Conta {
    private double saldo;

    public ContaGenerica(double saldo) {
        super();
        this.saldo = saldo;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public int hashCode() {
        return Objects.hash(saldo);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ContaGenerica other = (ContaGenerica) obj;
        return Double.doubleToLongBits(saldo) == Double.doubleToLongBits(other.saldo);
    }

    @Override
    public String toString() {
        return "ContaGenerica [saldo=" + saldo + "]";
    }

}
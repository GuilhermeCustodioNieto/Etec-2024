package entities;

import java.util.Objects;

public abstract class Conta {
    private String name;
    private String cpf;
    private String numeroConta;
    private double saldo;

    public Conta() {
    }

    public Conta(String name, String cpf, String numeroConta) {
        this.name = name;
        this.cpf = cpf;
        this.numeroConta = numeroConta;
        this.saldo = 0;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(String numeroConta) {
        this.numeroConta = numeroConta;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Conta conta = (Conta) o;
        return Double.compare(saldo, conta.saldo) == 0 && Objects.equals(name, conta.name) && Objects.equals(cpf, conta.cpf) && Objects.equals(numeroConta, conta.numeroConta);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, cpf, numeroConta, saldo);
    }


    // REGRAS DE NEGÓCIO
    public double depositar(double quantia){
        saldo += quantia;
        return saldo;
    }


    public double sacar(double quantia) throws Exception {
        if(quantia > saldo){
            throw new Exception("A quantia não pode ser maior que o valor na conta");

        }else{
            saldo -= quantia;
            return saldo;
        }
    }
    public void imprimitSaldo() {
        System.out.println("saldo: " + saldo);
    }



}

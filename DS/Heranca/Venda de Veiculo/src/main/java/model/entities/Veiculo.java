package model.entities;

import java.util.Objects;

public abstract class Veiculo {
    private String modelo;
    private Double valorTabela;
    private String cor;
    private String combustivel;
    private Double ipva;

    public Veiculo(String modelo, double valorTabela, String cor, String combustivel) {
        this.modelo = modelo;
        this.valorTabela = valorTabela;
        this.cor = cor;
        this.combustivel = combustivel;

    }

    public Veiculo() {
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public double getValorTabela() {
        return valorTabela;
    }

    public void setValorTabela(double valorTabela) {
        this.valorTabela = valorTabela;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public void setCombustivel(String combustivel) {
        this.combustivel = combustivel;
    }

    public double getIpva() {
        return ipva;
    }

    public void setIpva(double ipva) {
        this.ipva = ipva;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Veiculo veiculo = (Veiculo) o;
        return Double.compare(valorTabela, veiculo.valorTabela) == 0 && Double.compare(ipva, veiculo.ipva) == 0 && Objects.equals(modelo, veiculo.modelo) && Objects.equals(cor, veiculo.cor) && Objects.equals(combustivel, veiculo.combustivel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(modelo, valorTabela, cor, combustivel, ipva);
    }

    // A classe é abstrata para ser obrigatória a implementação do método em uma classe filha.
    public abstract double calcularIpva();

    public String imprimirFicha() {
        return "Carro: " + getModelo() + "\n" +
                "\tValor de tabela: " + valorTabela + '\n' +
                "\tCor: " + cor + '\n' +
                "\tTipo de Combustivel: " + combustivel + '\n' +
                "\tValor do IPVA: " + ipva;
    }
}

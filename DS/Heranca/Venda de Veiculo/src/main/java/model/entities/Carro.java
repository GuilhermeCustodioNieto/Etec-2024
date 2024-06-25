package model.entities;

public class Carro extends Veiculo{
    public Carro(String modelo, double valorTabela, String cor, String combustivel) {
        super(modelo, valorTabela, cor, combustivel);
        super.setIpva(calcularIpva());
    }

    public Carro() {
    }

    @Override
    public double calcularIpva(){
        return super.getValorTabela() * 0.04;
    }

}

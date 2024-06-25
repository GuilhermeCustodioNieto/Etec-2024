package model.entities;

public class Moto extends Veiculo{
    public Moto(String modelo, double valorTabela, String cor, String combustivel) {
        super(modelo, valorTabela, cor, combustivel);
        super.setIpva(calcularIpva());
    }

    public Moto() {
    }

    @Override
    public double calcularIpva(){
        return super.getValorTabela() * 0.02;
    }
}

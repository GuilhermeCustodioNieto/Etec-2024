package Clientes;

public class ClientePremium extends Cliente{

	public ClientePremium(String nome, int idade, String endereco) {
		super(nome, idade, endereco);
	}

	@Override
	public double calcularDesconto() {
		return super.getValorPedido() - (super.getValorPedido()*0.15)  ;
	}

}

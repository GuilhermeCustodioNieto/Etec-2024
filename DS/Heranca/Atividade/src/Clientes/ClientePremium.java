package Clientes;

public class ClientePremium extends Cliente {


	public ClientePremium(String nome, int idade, String endereco, double valorOriginal) {
		super(nome, idade, endereco, valorOriginal);
	}

	@Override
	public double calcularDesconto() {
		return super.getValorOriginal() * 0.15;
	}

}
package automoveis;

public class Carro extends Veiculo{

	private int quantidadePortas;

	public Carro(String marca, String modelo, String cor, int ano, int quantidadePortas) {
		super(marca, modelo, cor, ano);
		this.quantidadePortas = quantidadePortas;
	}

	// get e set do atributo
	
	public int getQuantidadePortas() {
		return quantidadePortas;
	}

	public void setQuantidadePortas(int quantidadePortas) {
		this.quantidadePortas = quantidadePortas;
	}

	@java.lang.Override
	public java.lang.String toString() {
		return super.toString() + " quantidade de portas: " + getQuantidadePortas();
	}
}

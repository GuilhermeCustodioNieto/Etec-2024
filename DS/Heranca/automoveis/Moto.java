package automoveis;


public class Moto extends Veiculo{
	
	private int cilidrada;

	public Moto(String marca, String modelo, String cor, int ano, int cilidrada) {
		super(marca, modelo, cor, ano);
		this.cilidrada = cilidrada;
	}

	public int getCilidrada() {
		return cilidrada;
	}

	public void setCilidrada(int cilidrada) {
		this.cilidrada = cilidrada;
	}

	@java.lang.Override
	public java.lang.String toString() {
		return super.toString() + " cilindrada: " + getCilidrada();
	}
}


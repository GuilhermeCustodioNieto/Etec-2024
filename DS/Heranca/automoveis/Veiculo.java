package automoveis;

public class Veiculo {

	private String marca; 
	private String modelo;
	private String cor;
	private int ano;

	public Veiculo(String marca, String modelo, String cor, int ano) {
		this.marca = marca;
		this.modelo = modelo;
		this.cor = cor;
		this.ano = ano;
	}

	// get e set dos atributos
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}

	@java.lang.Override
	public java.lang.String toString() {
		return "Marca: " + getMarca() + " Modelo: " + getModelo() + " Cor: " + getCor() + " Ano: " + getAno();
	}
}
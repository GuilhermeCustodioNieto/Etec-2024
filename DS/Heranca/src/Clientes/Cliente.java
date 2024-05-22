package Clientes;

public class Cliente {
	private String nome;
	private int idade;
	private String endereco;
	private double valorOriginal;
	private double descontoAplicado;
	private double valorPromocional;

	
	// Construtor

	public Cliente(String nome, int idade, String endereco, double valorOriginal) {
		this.nome = nome;
		this.idade = idade;
		this.endereco = endereco;
		this.valorOriginal = valorOriginal;

	}

	// Get e Set

	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public int getIdade() {
		return idade;
	}
	
	public void setIdade(int idade) {
		this.idade = idade;
	}
	
	public String getEndereco() {
		return endereco;
	}
	
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public double getValorPromocional() {
		valorPromocional = calcularDesconto();
		return valorPromocional;
	}
		
	public void setValorPromocional(double valorPromocional) {
		this.valorPromocional = valorPromocional;
	}


	public double getValorOriginal() {
		return valorOriginal;
	}

	public void setValorOriginal(double valorOriginal) {
		this.valorOriginal = valorOriginal;
	}

	public double getDescontoAplicado() {
		descontoAplicado = valorOriginal - calcularDesconto();
		return descontoAplicado;
	}

	public void setDescontoAplicado(double descontoAplicado) {
		this.descontoAplicado = descontoAplicado;
	}

	@Override
	public String toString() {
		return "Cliente: " + '\n' +
				"\tnome: " + nome + '\n' +
				"\tidade: " + idade + '\n' +
				"\tendereco: " + endereco + '\n' +
				"\tvalorOriginal: " + valorOriginal + '\n' +
				"\tvalorPromocional: " + getValorPromocional() + '\n' +
				"\tdescontoAplicado: " + getDescontoAplicado();
	}

	public double calcularDesconto() {

		return valorOriginal*0.10;
	}
	
	

}

package Clientes;

public class Cliente {
	private String nome;
	private int idade;
	private String endereco;
	private double valorPedido;
	private double valorPromocional;
	
	// Construtor
	
	public Cliente(String nome, int idade, String endereco) {
		this.nome = nome;
		this.idade = idade;
		this.endereco = endereco;
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
	
	public double getValorPedido() {
		return valorPedido;
	}
	
	public void setValorPedido(double valorPedido) {
		this.valorPedido = valorPedido;
	}
	
	public double getValorPromocional() {
		return valorPromocional;
	}
		
	public void setValorPromocional(double valorPromocional) {
		this.valorPromocional = valorPromocional;
	}



	@java.lang.Override
	public java.lang.String toString() {
		return "Cliente{" +
				"nome='" + nome + '\'' +
				", idade=" + idade +
				", endereco='" + endereco + '\'' +
				", valorPedido=" + valorPedido +
				", valorPromocional=" + valorPromocional +
				'}';
	}



	public double calcularDesconto() {
		return valorPedido -(valorPedido*0.10) ;
	}
	
	

}

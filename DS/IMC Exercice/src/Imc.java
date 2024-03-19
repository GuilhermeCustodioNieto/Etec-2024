public class Imc {
	private String nome;
	private Integer idade;
	private Double peso;
	private Double altura;
	
	public Imc(String nome, int idade, double peso, double altura) {
		super();
		this.nome = nome;
		this.idade = idade;
		this.peso = peso;
		this.altura = altura;
	}

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

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public double getAltura() {
		return altura;
	}

	public void setAltura(double altura) {
		this.altura = altura;
	}


	public String calcularImc() {
		double imc = peso / (altura * altura);
		
		if(imc < 18.5) {
			return "Abaixo do peso ";
		} else if(imc < 24.9) {
			return "peso normal ";
		} else if(imc < 29.9) {
			return "Sobrepeso ";
		} else if(imc < 34.9) {
			return "Obesidade grau 1 ";
		} else if(imc < 39.9) {
			return "Obesidade grau 2 ";
		} else {
			return "Obesidade grau 3 ";
		}
	}

	@Override
	public String toString() {
		return nome + ": \n\t" 
				+ "idade: " + idade + "\t\n"
				+ "Peso: " + peso+ "\t\n" 
				+ "altura: " + altura + "\t\n" ;
	}
	
	
}

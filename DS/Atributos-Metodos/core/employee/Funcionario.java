package core.employee;

public class Funcionario {
	String nome;
	double salarioBruto;
	double imposto;
	
	public Funcionario() {
		
	}
	
	public Funcionario(String nome, double salarioBruto, double imposto) {
		super();
		this.nome = nome;
		this.salarioBruto = salarioBruto;
		this.imposto = imposto;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getSalarioBruto() {
		return salarioBruto;
	}

	public void setSalarioBruto(double salarioBruto) {
		this.salarioBruto = salarioBruto;
	}

	public double getImposto() {
		return imposto;
	}

	public void setImposto(double imposto) {
		this.imposto = imposto;
	}

	
	
	double salarioLiquido() {
		double desconto =  (salarioBruto/100) * imposto;
		double salarioLiquido = salarioBruto - desconto;
		
		return salarioLiquido;
		}
	
	void aumentarSalario(double valorAumento) {
		salarioBruto = salarioBruto + valorAumento;
	}

	@Override
	public String toString() {
		return "Funcionario: \n \tnome: " + nome + "\n\tsalarioBruto: " + salarioBruto + "\n\timposto:" + imposto;
	}
	
	
 }

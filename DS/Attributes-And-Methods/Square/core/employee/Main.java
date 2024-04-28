package core.employee;

public class Main {
	public static void main(String[] args) {
		// FUNCIONARIO 
		
		Funcionario funcionario1 = new Funcionario();
		funcionario1.nome = "Pedro";
		funcionario1.salarioBruto = 1200;
		funcionario1.imposto = 11;
		
		Funcionario funcionario2 = new Funcionario();
		funcionario2.nome = "Vagner";
		funcionario2.salarioBruto = 2200;
		funcionario2.imposto = 10.0;
		
		double valorAumento  = 200;
		funcionario1.aumentarSalario(valorAumento);
		funcionario2.aumentarSalario(valorAumento);
		
		
		System.out.println("O salario liquido de "  + funcionario1.nome + " é " + funcionario1.salarioLiquido());
		
		System.out.println("O salario liquido de "  + funcionario2.nome + " é " + funcionario2.salarioLiquido());
		
		System.out.println();
		
		System.out.println(funcionario1);
		System.out.println();
		System.out.println(funcionario2);
	}

}

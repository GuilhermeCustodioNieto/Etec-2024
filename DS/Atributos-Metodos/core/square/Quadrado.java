package core.square;

public class Quadrado {
	double altura;
	double base;
	
	public Quadrado() {
		
	}
	
	public Quadrado(double altura, double base) {
		super();
		this.altura = altura;
		this.base = base;
	}

	public double getAltura() {
		return altura;
	}

	public void setAltura(double altura) {
		this.altura = altura;
	}

	public double getBase() {
		return base;
	}

	public void setBase(double base) {
		this.base = base;
	}

	public double calcularArea() {
		return base*altura;
	}

	@Override
	public String toString() {
		return "Quadrado: \nnaltura: " + altura + "\nbase: " + base;
	}
	
	
}

	

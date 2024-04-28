package core.square;

public class Main {

	public static void main(String[] args) {
		
		// QUADRADO

		Quadrado quadrado1 = new Quadrado();
		quadrado1.base = 2;
		quadrado1.altura = 4;
		
		Quadrado quadrado2 = new Quadrado();
		quadrado2.base = 5;
		quadrado2.altura = 8;
		
		
		System.out.println("Area quadrado 1: " + quadrado1.calcularArea());
		System.out.println("Area quadrado 2: " + quadrado2.calcularArea());
		

	}

}

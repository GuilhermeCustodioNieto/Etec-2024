import entities.Circulo;
import entities.FormaGeometrica;
import entities.Retangulo;
import entities.Triangulo;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class Main {
    static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {


        List<FormaGeometrica> formasGeometricas = new ArrayList<>();

        System.out.println("Quantas figuras você irá inserir? ");
        int quantFiguras = scanner.nextInt();

        for(int i=0; i<=quantFiguras; i++){
            formasGeometricas.add(lerFormaGeometrica());
        }

        System.out.println("-------------------------------------");
        System.out.println("A´rea de todas as figuras");

        for(FormaGeometrica forma : formasGeometricas){
            System.out.println(forma.area());
        }
    }

    public static FormaGeometrica lerFormaGeometrica(){
        System.out.println("\tCirculo = C \n\tRetangulo = r \n\tTriangulo = t");
        System.out.print("Qual forma geometrica você deseja ler?");

        String escolha = scanner.next();

        if(escolha.equalsIgnoreCase("c")){
            System.out.print("Escreva o raio do circulo: ");
            double raio = scanner.nextDouble();
            return new Circulo(raio);

        } else if (escolha.equalsIgnoreCase("r")) {
            System.out.print("Escreva o lado do retângulo: ");
            double lado = scanner.nextDouble();
            System.out.print("Escreva a altura do retângulo: ");
            double altura = scanner.nextDouble();

            return new Retangulo(lado, altura);
        } else if(escolha.equalsIgnoreCase("t")){
            System.out.print("Escreva a base do triângulo: ");
            double base = scanner.nextDouble();
            System.out.print("Escreva a altura do triângulo: ");
            double altura = scanner.nextDouble();

            return new Triangulo(base, altura);
        } else{
            throw new InputMismatchException("Dado inserido inválido");
        }
    }
}

import model.entities.Carro;
import model.entities.Moto;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        //Leitura do carro 1
        System.out.println("CARRO");
        System.out.print("Entre com o modelo do carro: ");
        String modelo = scan.nextLine();

        System.out.print("Entre com o valor de tabela do carro: ");
        double valorTabela = scan.nextDouble();

        System.out.print("Entre com a cor do carro: ");
        String cor = scan.next();

        System.out.print("Entre com o combustivel do carro: ");
        String combustivel = scan.next();

        Carro carro = new Carro(modelo, valorTabela, cor, combustivel);
        System.out.println();

        // Leitura da carro 2
        System.out.println("CARRO 2");
        System.out.print("Entre com o modelo da carro 2: ");
        scan.next();
        modelo = scan.nextLine();

        System.out.print("Entre com o valor de tabela da carro 2: ");
        valorTabela = scan.nextDouble();

        System.out.print("Entre com a cor da carro 2: ");
        cor = scan.next();

        System.out.print("Entre com o combustivel da carro 2: ");
        combustivel = scan.next();

        Carro carro2 = new Carro(modelo, valorTabela, cor, combustivel);
        System.out.println();

        //Leitura da moto 1
        System.out.println("MOTO 1");
        System.out.print("Entre com o modelo da moto 1: ");
        scan.next();
        modelo = scan.nextLine();

        System.out.print("Entre com o valor de tabela da moto 1: ");
        valorTabela = scan.nextDouble();

        System.out.print("Entre com a cor da moto 1: ");
        cor = scan.next();

        System.out.print("Entre com o combustivel da moto 1: ");
        combustivel = scan.next();

        Moto moto1 = new Moto(modelo, valorTabela, cor, combustivel);
        System.out.println();

        //Leitura da moto 2
        System.out.println("MOTO 2");
        System.out.print("Entre com o modelo da moto 2: ");
        scan.next();
        modelo = scan.nextLine();

        System.out.print("Entre com o valor de tabela da moto 2: ");
        valorTabela = scan.nextDouble();

        System.out.print("Entre com a cor da moto 2: ");
        cor = scan.next();

        System.out.print("Entre com o combustivel da moto 2: ");
        combustivel = scan.next();

        Moto moto2 = new Moto(modelo, valorTabela, cor, combustivel);
        System.out.println();

        // Apresentção dos dados
        System.out.println("-------------------------------------");

        System.out.println(carro.imprimirFicha() + '\n');
        System.out.println(carro2.imprimirFicha() + '\n');
        System.out.println(moto1.imprimirFicha() + '\n');
        System.out.println(moto1.imprimirFicha() + '\n');

    }
}
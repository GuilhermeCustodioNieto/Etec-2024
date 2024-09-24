import entities.Conta;
import entities.ContaCorrente;
import entities.ContaPoupanca;
import entities.Lucros;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner scan = new Scanner(System.in);
        ArrayList<Conta> contas = new ArrayList<Conta>();

        // Inserção de dados usando polimorfismo
        System.out.print("Digite a quantidade de contas: ");
        int quantidadeContas = scan.nextInt();


        for(int i=0; i<=quantidadeContas; i++){
            scan.nextLine();
            System.out.print("Digite seu nome: ");
            String nome = scan.nextLine();

            System.out.print("Digite seu CPF: ");
            String cpf = scan.next();

            System.out.print("Digite seu número de conta: ");
            String numConta = scan.next();

            System.out.print("Deseja uma Conta Corrente ou Conta Poupança? (C | P): ");
            String choose = scan.next();

            if(choose.equalsIgnoreCase("p")){
                contas.add(new ContaPoupanca(nome, cpf, numConta));
            } else if (choose.equalsIgnoreCase("c")) {
                System.out.print("Entre com a tarifa mensal: ");
                double tarifaMensal = scan.nextDouble();
                contas.add(new ContaCorrente(nome, cpf, numConta, tarifaMensal));
            } else{
                throw new InputMismatchException("Erro: valor inserido invalido");
            }
        }


        // Teste de funções
        if(contas.size() > 0){
            System.out.print("Com qual conta você deseja gerenciar? (1, 2, 3...) ");
            int conta = scan.nextInt() - 1;

            System.out.print("Entre com o valor a depositar: ");
            contas.get(conta).depositar(scan.nextDouble());

            System.out.print("Novo saldo: ");
            contas.get(conta).imprimitSaldo();

            System.out.print("Entre com o valor a sacar: ");
            contas.get(conta).sacar(scan.nextDouble());

            System.out.print("Novo saldo: ");
            contas.get(conta).imprimitSaldo();
        }
        
        // TESTE DE LUCROS
        Lucros lucros = new Lucros();
        for(Conta c : contas){
            lucros.registra(c);
        }

        System.out.println("Soma de saldos: " + lucros.getSoma());


    }
}
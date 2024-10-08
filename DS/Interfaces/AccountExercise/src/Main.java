import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import entities.Conta;
import entities.ContaCorrente;
import entities.ContaPoupanca;

public class Main {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        List<Conta> contas = new ArrayList<>();

        // Criar contas
        while (true) {
            System.out.print("Deseja criar uma nova conta? (s/n): ");
            if (!scan.next().equalsIgnoreCase("s")) {
                break;
            }

            System.out.print("Deseja uma conta poupança ou conta corrente (p/c)? ");
            String escolha =scan.next();
            if (escolha.equalsIgnoreCase("p")) {
                System.out.print("Digite o saldo da conta poupança: ");
                contas.add(new ContaPoupanca(scan.nextDouble()));
            } else if (escolha.equalsIgnoreCase("c")) {
                System.out.print("Digite o saldo: ");
                double saldo = scan.nextDouble();
                System.out.print("Digite o limite de cheque especial: ");
                double chequeEspecial = scan.nextDouble();
                contas.add(new ContaCorrente(saldo, chequeEspecial));
            } else {
                System.out.println("Digite uma conta válida");
            }
            System.out.println("************");
        }

        System.out.println("--------------------------");
        // Métodos
        while (true) {
            imprimeContas(contas);
            System.out.println("Digite o índice da conta escolhida (ou -1 para sair): ");
            int contaEscolhida = scan.nextInt();
            if (contaEscolhida == -1) {
                break;
            }
            Conta conta = contas.get(contaEscolhida);
            System.out.println("Escolha a operação: 1 - Depositar, 2 - Sacar, 3 - Verificar Saldo");

            if (conta instanceof ContaPoupanca) {
                System.out.println("4 - Rendimento Mensal");
            } else if (conta instanceof ContaCorrente) {
                System.out.println("4 - Usar Cheque Especial");
            }

            int operacao = scan.nextInt();

            switch (operacao) {
                case 1:
                    System.out.print("Digite o valor para depositar: ");
                    double valorDeposito = scan.nextDouble();
                    conta.depositar(valorDeposito);
                    System.out.println("Depósito realizado com sucesso!");
                    break;
                case 2:
                    System.out.print("Digite o valor para sacar: ");
                    double valorSaque = scan.nextDouble();
                    try {
                        conta.sacar(valorSaque);
                        System.out.println("Saque realizado com sucesso!");
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                case 3:
                    System.out.println("Saldo atual: " + conta.pegarSaldo());
                    break;
                case 4:
                    if (conta instanceof ContaPoupanca) {
                        System.out.print("Digite a porcentagem do rendimento mensal: ");
                        double percentual = scan.nextDouble();
                        double novoSaldo = ((ContaPoupanca) conta).rendimentoMensal(percentual / 100);
                        System.out.println("Novo saldo após rendimento: " + novoSaldo);
                    } else if (conta instanceof ContaCorrente) {
                        System.out.print("Digite o valor a ser sacado com cheque especial: ");
                        double valorChequeEspecial = scan.nextDouble();
                        try {
                            conta.sacar(valorChequeEspecial);
                            System.out.println("Saque com cheque especial realizado com sucesso!");
                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                        }
                    }
                    break;
                default:
                    System.out.println("Operação inválida.");
                    break;
            }
        }
        scan.close();
        System.out.println("Programa encerrado.");
    }

    public static void imprimeContas(List<Conta> contas) {
        for (int i = 0; i < contas.size(); i++) {
            System.out.println(i + ": " + contas.get(i));
        }
    }
}
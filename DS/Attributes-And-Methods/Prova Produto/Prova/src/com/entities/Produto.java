package com.entities;

public class Produto {
	private int id;
	private String nome;
	private double preco;
	
	public Produto(int id, String nome, double preco) {
		//CONSTRUTOR COM TODOS OS ELEMENTOS
		this.id = id;
		this.nome = nome;
		this.preco = preco;
	}


	public Produto() {
		//Consrtutor vazio
	}
	
	//GETTERS E SETTERS
	
	public int getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}
	
	
	//REGRAS DE NEGÓCIO
	public double calcularDesconto(double desconto) {
		double descontoCalculado = preco / 100 * desconto;
		return preco - descontoCalculado;
	}

	@Override
	public String toString() {
		return "ID=" + id + ", Nome=" + nome + ", Preco=" + preco;
	}
	
	
	}

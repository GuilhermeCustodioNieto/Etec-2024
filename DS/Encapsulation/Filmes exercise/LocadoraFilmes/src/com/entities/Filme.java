package com.entities;

import java.security.InvalidParameterException;

public class Filme {

	private String titulo;
	private Integer duracaoEmMinutos;
	private Integer duracaoEmHoras;
	
	public Filme() {}

	public Filme(String titulo, Integer duracaoEmMinutos, Integer duracaoEmHoras) {
		super();
		this.titulo = titulo;
		this.duracaoEmMinutos = duracaoEmMinutos;
		this.duracaoEmHoras = duracaoEmHoras;
	}

	
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Integer getDuracaoEmMinutos() {
		return duracaoEmMinutos;
	}

	public void setDuracaoEmMinutos(Integer duracaoEmMinutos) {
		if(duracaoEmMinutos < 60) {
			throw new InvalidParameterException("Erro: tamanho de filme muito pequeno");
		} else {
			this.duracaoEmMinutos = duracaoEmMinutos;
			this.duracaoEmHoras = duracaoEmMinutos / 60;
		}
		
		 
	}

	public Integer getDuracaoEmHoras() {
		return duracaoEmHoras;
	}

	public void setDuracaoEmHoras(Integer duracaoEmHoras) {
		if(duracaoEmHoras < 1) {
			throw new InvalidParameterException("Erro: tamanho de filme muito pequeno");
		} else {
			this.duracaoEmHoras = duracaoEmHoras;
		}
	}

	public String exibirDuracaoEmHoras() {
		return duracaoEmHoras + ":" + duracaoEmMinutos;
	}

	@Override
	public String toString() {
		return "Filme\n \ttitulo: " + titulo + "\n\t duracaoEmMinutos:" + duracaoEmMinutos
				+ "\n\t duracaoEmHoras:" + duracaoEmHoras;
	}

	
	
	
	
	

}

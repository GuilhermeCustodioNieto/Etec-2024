package com.core;

import com.entities.Filme;

public class Main {

	public static void main(String[] args) {
		Filme filme1 = new Filme();
		filme1.setTitulo("Os Vingadores");
		filme1.setDuracaoEmMinutos(142);
		
		System.out.printf("A duração em horas do filme %s é %s %n",filme1.getTitulo(), filme1.exibirDuracaoEmHoras());
		
		
		Filme filme2 = new Filme();
		filme2.setTitulo("Hotel Transilvânia");
		filme2.setDuracaoEmMinutos(93);
		System.out.printf("A duração em horas do filme %s é %s %n",filme2.getTitulo(), filme2.exibirDuracaoEmHoras());
		
		System.out.printf("Os filmes em cartaz são %s e %s %n", filme1.getTitulo(), filme2.getTitulo());
		
		
	}

}

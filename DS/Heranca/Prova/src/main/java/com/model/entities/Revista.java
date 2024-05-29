package com.model.entities;

public class Revista extends Publicacao{
    private int numeroEdicao;
    private String mesPublicado;

    public Revista(String titulo, String autor, int anoPublicacao, int numeroEdicao, String mesPublicado) {
        super(titulo, autor, anoPublicacao);
        this.numeroEdicao = numeroEdicao;
        this.mesPublicado = mesPublicado;
    }

    public int getNumeroEdicao() {
        return numeroEdicao;
    }

    public void setNumeroEdicao(int numeroEdicao) {
        this.numeroEdicao = numeroEdicao;
    }

    public String getMesPublicado() {
        return mesPublicado;
    }

    public void setMesPublicado(String mesPublicado) {
        this.mesPublicado = mesPublicado;
    }

    @Override
    public String exibirDetalhes() {
        return getTitulo() + "\n\t" +
                "autor: " + getAutor() + "\n\t" +
                "Data Publicação: " + mesPublicado + "/" + getAnoPublicacao() +  "\n\t" +
                "Numero Edicao: " + numeroEdicao + "\n\t"
                ;
    }

    public String exibirDetalhes(boolean incluirMes) {
        if(!incluirMes) {
            return getTitulo() + "\n\t" +
                    "autor: " + getAutor() + "\n\t" +
                    "Data Publicação: " + getAnoPublicacao() +  "\n\t" +
                    "Numero Edicao: " + numeroEdicao + "\n\t"
                    ;
        }

        return getTitulo() + "\n\t" +
                "autor: " + getAutor() + "\n\t" +
                "Data Publicação: " + mesPublicado + "/" + getAnoPublicacao() +  "\n\t" +
                "Numero Edicao: " + numeroEdicao + "\n\t"
                ;

    }

}

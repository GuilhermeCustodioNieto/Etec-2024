package com.model.entities;

public class Livro extends Publicacao{

    private String editora;
    private int numPaginas;


    public Livro(String titulo, String autor, int anoPublicacao, String editora, int numPaginas) {
        super(titulo, autor, anoPublicacao);
        this.editora = editora;
        this.numPaginas = numPaginas;
    }

    public int getNumPaginas() {
        return numPaginas;
    }

    public void setNumPaginas(int numPaginas) {
        this.numPaginas = numPaginas;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    @Override
    public String exibirDetalhes() {
        return getTitulo() + "\n\t" +
                "autor: " + getAutor() + "\n\t" +
                "Ano Publicação: " + getAnoPublicacao() + "\n\t" +
                "editora: " + editora + "\n\t" +
                "Numero Paginas: " + numPaginas
                ;
    }

    public String exibirDetalhes(boolean incluirEditora) {
        if(!incluirEditora) {
            return getTitulo() + "\n\t" +
                    "autor: " + getAutor() + "\n\t" +
                    "Ano Publicação: " + getAnoPublicacao() + "\n\t" +
                    "Numero Paginas: " + numPaginas
                    ;
        }

        return getTitulo() + "\n\t" +
                "autor: " + getAutor() + "\n\t" +
                "Ano Publicação: " + getAnoPublicacao() + "\n\t" +
                "editora: " + editora + "\n\t" +
                "Numero Paginas: " + numPaginas
                ;
    }
}

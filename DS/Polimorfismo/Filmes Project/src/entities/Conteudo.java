package entities;

public abstract class Conteudo{
    private String categoria;
    private String titulo;

    public Conteudo(String categoria, String titulo) {
        this.categoria = categoria;
        this.titulo = titulo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String descricao() {
        return "Conteudo: \n\t" +
                "categoria: " + categoria + "\n" +
                "\ttitulo: " + titulo;
    }



}

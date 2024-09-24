package entities;

public class Filme extends Conteudo{
    private Integer duracao;

    public Filme(String categoria, String titulo, int duracao) {
        super(categoria, titulo);
        this.duracao = duracao;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    @Override
    public String descricao() {
        return "Filme: \n\t" +
                "titulo: " + getTitulo() + "\n" +
                "\tcategoria: " + getCategoria() + "\n" +
                "\tduracao: " + duracao + " minutos";
    }

}

package entities;

public class Serie extends Conteudo{
    private Integer duracao;
    private Integer quantEpisodios;
    private Integer quantTemps;

    public Serie(String categoria, String titulo, Integer duracao, Integer quantEpisodios, Integer quantTemps) {
        super(categoria, titulo);
        this.duracao = duracao;
        this.quantEpisodios = quantEpisodios;
        this.quantTemps = quantTemps;
    }

    public Integer getDuracao() {
        return duracao;
    }

    public void setDuracao(Integer duracao) {
        this.duracao = duracao;
    }

    public Integer getQuantEpisodios() {
        return quantEpisodios;
    }

    public void setQuantEpisodios(Integer quantEpisodios) {
        this.quantEpisodios = quantEpisodios;
    }

    public Integer getQuantTemps() {
        return quantTemps;
    }

    public void setQuantTemps(Integer quantTemps) {
        this.quantTemps = quantTemps;
    }

    @Override
    public String descricao() {
        return "Serie: \n\t" +
                "titulo: " + getTitulo() + "\n" +
                "\tcategoria: " + getCategoria() + "\n" +
                "\tduracao: " + duracao + " minutos por episódio\n" +
                "\tquantEpisodios: " + quantEpisodios + "\n" +
                "\tquantTemporadas: " + quantTemps;
    }

}

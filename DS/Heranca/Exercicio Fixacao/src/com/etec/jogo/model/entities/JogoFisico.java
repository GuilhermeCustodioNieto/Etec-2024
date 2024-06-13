package com.etec.jogo.model.entities;
import java.util.Objects;

public class JogoFisico extends Jogo{
    private Integer quantidadeJogadores;
    private int tempoPartida;

    public JogoFisico(String nome, Double preco, String distribuidora, Integer quantidadeJogadores, int tempoPartida) {
        super(nome, preco, distribuidora);
        this.quantidadeJogadores = quantidadeJogadores;
        this.tempoPartida = tempoPartida;
    }

    public JogoFisico() {
    }

    public Integer getQuantidadeJogadores() {
        return quantidadeJogadores;
    }

    public void setQuantidadeJogadores(Integer quantidadeJogadores) {
        this.quantidadeJogadores = quantidadeJogadores;
    }

    public int getTempoPartida() {
        return tempoPartida;
    }

    public void setTempoPartida(int tempoPartida) {
        this.tempoPartida = tempoPartida;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        JogoFisico that = (JogoFisico) o;
        return Objects.equals(quantidadeJogadores, that.quantidadeJogadores) && Objects.equals(tempoPartida, that.tempoPartida);
    }

    @Override
    public int hashCode() {
        return Objects.hash(quantidadeJogadores, tempoPartida);
    }

    @Override
    public String toString() {
        return super.toString() + '\t' +
                quantidadeJogadores + '\t' +
                tempoPartida + '\t';
    }

    public int calcularTempoTotal(int quantidadePartidas){

        return tempoPartida * quantidadePartidas;

    }


}

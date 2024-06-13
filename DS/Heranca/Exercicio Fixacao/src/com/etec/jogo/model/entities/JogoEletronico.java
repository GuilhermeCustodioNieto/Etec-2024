package com.etec.jogo.model.entities;

import java.util.Objects;

public class JogoEletronico extends Jogo{
    private String plataforma;
    private String genero;

    public JogoEletronico(String nome, Double preco, String distribuidora, String genero, String plataforma) {
        super(nome, preco, distribuidora);
        this.genero = genero;
        this.plataforma = plataforma;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        JogoEletronico that = (JogoEletronico) o;
        return Objects.equals(plataforma, that.plataforma) && Objects.equals(genero, that.genero);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), plataforma, genero);
    }

    @Override
    public String toString() {
        return super.toString() +"\n" + "\t" +
                 plataforma + "\n" +
                "\t" + genero;
    }

    public String jogarOnline(int quantidadeJogadores){
        return "Jogando online com " + quantidadeJogadores + " jogadores";
    }


}

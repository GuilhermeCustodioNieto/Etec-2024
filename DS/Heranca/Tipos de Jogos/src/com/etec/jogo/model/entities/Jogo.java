package com.etec.jogo.model.entities;

import java.util.Objects;

public class Jogo {
    private String nome;
    private Double preco;
    private String distribuidora;

    public Jogo(){

    }

    public Jogo(String nome, Double preco, String distribuidora) {
        this.nome = nome;
        this.preco = preco;
        this.distribuidora = distribuidora;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public String getDistribuidora() {
        return distribuidora;
    }

    public void setDistribuidora(String distribuidora) {
        this.distribuidora = distribuidora;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Jogo jogo = (Jogo) o;
        return Objects.equals(nome, jogo.nome) && Objects.equals(preco, jogo.preco) && Objects.equals(distribuidora, jogo.distribuidora);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nome, preco, distribuidora);
    }

    @Override
    public String toString() {
        return getNome() + "\n" +
                "\t" + preco + "\n" +
                "\t" +distribuidora;
    }
}

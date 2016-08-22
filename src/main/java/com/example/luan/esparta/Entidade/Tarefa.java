package com.example.luan.esparta.Entidade;

import com.example.luan.esparta.util.StatusTarefa;

/**
 * Created by Luan on 22/08/2016.
 */
public class Tarefa {

    private String nome;
    private StatusTarefa status;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public StatusTarefa getStatus() {
        return status;
    }

    public void setStatus(StatusTarefa status) {
        this.status = status;
    }
}

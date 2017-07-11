package dvgomez.listesparta;

import android.support.annotation.NonNull;

/**
 * Created by Lucas on 10/07/2017.
 */

public class Tarefa {

    private String titulo, descricao;
    private boolean finalizada;

    public Tarefa(@NonNull String titulo, String descricao) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.finalizada = false;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean isFinalizada() {
        return finalizada;
    }

    public void setFinalizada(boolean finalizada) {
        this.finalizada = finalizada;
    }
}

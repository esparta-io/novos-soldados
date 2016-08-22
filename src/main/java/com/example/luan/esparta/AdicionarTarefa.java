package com.example.luan.esparta;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.example.luan.esparta.Entidade.Tarefa;
import com.example.luan.esparta.util.StatusTarefa;

import java.util.List;

public class AdicionarTarefa extends AppCompatActivity {

    private List<Tarefa> listaTarefas;
    private boolean validacao = true;

    private Tarefa tarefa;

    private EditText edtNome;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_adicionar_tarefa);

        listaTarefas = ControleTarefas.tarefasPendente;

        edtNome = (EditText) findViewById(R.id.edtNome);

    }

    public void adicionar(View view) {

        validacao = true;
        String nome = edtNome.getText().toString();

        if (nome == null || "".equals(nome)) {
            edtNome.setError("Informe o nome da tarefa");
        }
        else{
            for (Tarefa t : listaTarefas) {
                if (t.getNome().equals(nome)) {
                    validacao = false;
                    edtNome.setError("Tarefa já cadastrada");
                }
            }

            if (validacao) {
                tarefa = new Tarefa();
                tarefa.setNome(nome);
                tarefa.setStatus(StatusTarefa.PENDENTE);

                listaTarefas.add(tarefa);

                Intent i = new Intent(this, ControleTarefas.class);
                startActivity(i);
            }
        }
    }

}

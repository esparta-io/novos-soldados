package com.example.luan.esparta;

import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.example.luan.esparta.Entidade.Tarefa;
import com.example.luan.esparta.util.StatusTarefa;
import com.example.luan.esparta.util.TipoMsg;
import com.example.luan.esparta.util.Util;

import java.util.ArrayList;
import java.util.List;

public class ControleTarefaFinalizada extends AppCompatActivity {

    public static List<Tarefa> tarefasPendente;
    public static List<Tarefa> tarefasFinalizada = new ArrayList<>();

    private int posicaoSelecionada;

    private ListView listTarefasFinalizadas;

    private ArrayAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_controle_tarefa_finalizada);
        getSupportActionBar().setTitle("Tarefas Finalizadas");

        tarefasPendente = ControleTarefas.tarefasPendente;

        listTarefasFinalizadas = (ListView) findViewById(R.id.listTarefasFinalizadas);

        adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1);
        carregarTarefasFinalizadas();

        listTarefasFinalizadas.setOnCreateContextMenuListener(contextMenuListener);
        listTarefasFinalizadas.setOnItemLongClickListener(longClickListener);

    }

    private void carregarTarefasFinalizadas(){
        List<String> valores = new ArrayList<>();

        for(Tarefa t : tarefasFinalizada){

            valores.add(t.getNome());
        }

        adapter.clear();
        adapter.addAll(valores);
        listTarefasFinalizadas.setAdapter(adapter);
    }

    private AdapterView.OnItemLongClickListener longClickListener = new AdapterView.OnItemLongClickListener() {
        @Override
        public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
            posicaoSelecionada = position;
            return false;
        }
    };

    private View.OnCreateContextMenuListener contextMenuListener = new View.OnCreateContextMenuListener(){

        @Override
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            contextMenu.setHeaderTitle("Opções").add(1,10,1, "Deletar Tarefa");
            contextMenu.add(1,20,2, "Pendente Tarefa");
        }
    };

    public boolean onContextItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 10:
                Util.showMsgConfirm(ControleTarefaFinalizada.this, "Remover Tarefa", "Deseja realmente remover essa tarefa?", TipoMsg.ALERTA, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        tarefasFinalizada.remove(posicaoSelecionada);
                        carregarTarefasFinalizadas();
                        adapter.notifyDataSetChanged();
                    }
                });
                break;
            case 20:
                Tarefa t = tarefasFinalizada.get(posicaoSelecionada);
                tarefasFinalizada.remove(posicaoSelecionada);
                t.setStatus(StatusTarefa.PENDENTE);
                tarefasPendente.add(t);
                carregarTarefasFinalizadas();
                adapter.notifyDataSetChanged();
                break;
        }
        return true;
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_tarefa_finalizada,menu);

        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menu_finalizada:
                finish();
                Intent i = new Intent(ControleTarefaFinalizada.this, ControleTarefas.class);
                startActivity(i);

                break;
        }
        return super.onOptionsItemSelected(item);
    }

}

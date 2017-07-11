package dvgomez.listesparta;

import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import dvgomez.listesparta.adapters.MainAdapter;

public class MainActivity extends AppCompatActivity implements OnListItemClickListener, View.OnClickListener{

    private static final int CODE_REQUEST = 99;
    private RecyclerView rcList;
    private MainAdapter adapter;

    private Button btnAdd;

    private List<Tarefa> listHelper;
    private List<Tarefa> list;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnAdd = (Button) findViewById(R.id.btnAdd);
        btnAdd.setOnClickListener(this);

        Tarefa tarefa1 = new Tarefa("Entrevista de Emprego", "Entevista na Esparta Tecnologia as 9:30am dia 10/07/2017");
        Tarefa tarefa2 = new Tarefa("Entrevista de Emprego 2 ", "Entevista na Esparta Tecnologia as 9:30am dia 10/07/2017");
        Tarefa tarefa3 = new Tarefa("Entrevista de Emprego 3 ", "Entevista na Esparta Tecnologia as 9:30am dia 10/07/2017");

        rcList = (RecyclerView) findViewById(R.id.rcLista);
        rcList.setLayoutManager(new LinearLayoutManager(this));

        list = new ArrayList<Tarefa>();
        listHelper = new ArrayList<Tarefa>();

        adapter = new MainAdapter(this, list, this);

        rcList.setAdapter(adapter);

        list.add(tarefa1);
        list.add(tarefa2);
        list.add(tarefa3);
    }

    @Override
    public void onItemClick(final int position) {

        final Tarefa tarefa = list.get(position);

        AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle(tarefa.getTitulo());
        alertDialog.setMessage(tarefa.getDescricao());
        alertDialog.setNegativeButton("Excluir", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        new AlertDialog.Builder(MainActivity.this)
                                .setTitle("Excluir Tarefa?")
                                .setMessage("Deseja realmente excluir a tarefa: " + tarefa.getTitulo())
                                .setPositiveButton("Sim", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        if(listHelper.contains(tarefa)){
                                            listHelper.remove(tarefa);
                                        }
                                        list.remove(list.remove(position));
                                        adapter.notifyDataSetChanged();
                                        Toast.makeText(MainActivity.this, "Excluída!", Toast.LENGTH_SHORT).show();
                                    }
                                })
                                .setNegativeButton("Não", null)
                                .show();
                    }
                });
        if(!tarefa.isFinalizada()){
            alertDialog.setPositiveButton("Finalizar", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    Toast.makeText(MainActivity.this, "Finalizada!", Toast.LENGTH_SHORT).show();
                    tarefa.setFinalizada(true);
                }
            });
        }else{
            alertDialog.setPositiveButton("Pendente", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    Toast.makeText(MainActivity.this, "Pendente!", Toast.LENGTH_SHORT).show();
                    tarefa.setFinalizada(false);
                }
            });
        }
        alertDialog.create();
        alertDialog.show();
    }

    @Override
    public void onClick(View v) {
        if(v == btnAdd){
            Intent acAdd = new Intent(this, CadastroActivity.class);
            startActivityForResult(acAdd, CODE_REQUEST);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {

        if(requestCode == CODE_REQUEST && resultCode == RESULT_OK){

            mostrarTodosEventos();

            String titulo = data.getStringExtra("titulo");
            String desc = data.getStringExtra("descricao");

            Tarefa tarefa = new Tarefa(titulo, desc);

            if(listHelper.size() > list.size()){
                listHelper.add(tarefa);
            }else{
                list.add(tarefa);
            }

        }


        super.onActivityResult(requestCode, resultCode, data);
    }

    private void mostrarEventosFinalizados(){

        for(Tarefa tarefa : list){
            if(!listHelper.contains(tarefa)){
                listHelper.add(tarefa);
            }
        }

        list.clear();

        for (Tarefa tarefa : listHelper){
            if(tarefa.isFinalizada()){
                list.add(tarefa);
            }
        }

        if(list.isEmpty()){
            Toast.makeText(this, "Nenhuma tarefa encontrada!", Toast.LENGTH_SHORT).show();
            for (Tarefa tarefa : listHelper){
                list.add(tarefa);
            }
            listHelper.clear();
            adapter.notifyDataSetChanged();
        }else{
            adapter.notifyDataSetChanged();
        }


    }


    private void mostrarEventosPendentes() {

        for(Tarefa tarefa : list){
            if(!listHelper.contains(tarefa)){
                listHelper.add(tarefa);
            }
        }

        list.clear();

        for (Tarefa tarefa : listHelper){
            if(!tarefa.isFinalizada()){
                list.add(tarefa);
            }
        }

        if(list.isEmpty()){
            Toast.makeText(this, "Nenhuma tarefa encontrada!", Toast.LENGTH_SHORT).show();
            for (Tarefa tarefa : listHelper){
                list.add(tarefa);
            }
            listHelper.clear();
            adapter.notifyDataSetChanged();
        }else{
            adapter.notifyDataSetChanged();
        }


    }

    private void mostrarTodosEventos(){

        if(list.size() < listHelper.size()){
            list.clear();
            for(Tarefa tarefa : listHelper){
                list.add(tarefa);
            }
            listHelper.clear();
            adapter.notifyDataSetChanged();
        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        getMenuInflater().inflate(R.menu.main_menu, menu);
        return super.onCreateOptionsMenu(menu);

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        int id = item.getItemId();

        if(id == R.id.nav_reorder){

            String[] options = {"Todos", "Finalizados", "Pendentes"};

            //Toast.makeText(this, "Reorder", Toast.LENGTH_SHORT).show();
            AlertDialog dialog = new AlertDialog.Builder(this)
                    .setItems(options, new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            //Toast.makeText(MainActivity.this, ""+which, Toast.LENGTH_SHORT).show();
                            if(which == 0){
                                mostrarTodosEventos();
                            } else if(which == 1){
                                mostrarEventosFinalizados();
                            } else{
                                mostrarEventosPendentes();
                            }
                        }
                    })
                    .setTitle("Filtrar Eventos")
                    .create();
            dialog.show();
        }


        return super.onOptionsItemSelected(item);
    }
}

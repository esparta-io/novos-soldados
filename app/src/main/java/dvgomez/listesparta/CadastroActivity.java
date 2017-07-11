package dvgomez.listesparta;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class CadastroActivity extends AppCompatActivity {


    private Button btnAdicionar;
    private EditText edtTitulo, edtDesc;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        edtTitulo = (EditText) findViewById(R.id.edtTitulo);
        edtDesc = (EditText) findViewById(R.id.edtDesc);

        btnAdicionar = (Button) findViewById(R.id.btnAdicionar);
        btnAdicionar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                registerNewEvent(edtTitulo.getText().toString(), edtDesc.getText().toString());
            }
        });

    }

    void registerNewEvent(String titulo, String desc){
        if(TextUtils.isEmpty(titulo)){
            edtTitulo.setError("Informe um nome válido!");
        } else if(TextUtils.isEmpty(desc)){
            edtDesc.setError("Informe uma descrição válida!");
        } else{
            Intent returnAc = new Intent();
            returnAc.putExtra("titulo", titulo);
            returnAc.putExtra("descricao", desc);
            setResult(Activity.RESULT_OK, returnAc);
            finish();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        int id = item.getItemId();

        if(id == android.R.id.home){
            finish();
        }
        return super.onOptionsItemSelected(item);
    }

}

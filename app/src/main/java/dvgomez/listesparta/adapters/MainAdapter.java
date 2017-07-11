package dvgomez.listesparta.adapters;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import dvgomez.listesparta.OnListItemClickListener;
import dvgomez.listesparta.R;
import dvgomez.listesparta.Tarefa;

/**
 * Created by Lucas on 10/07/2017.
 */

public class MainAdapter extends RecyclerView.Adapter<MainAdapter.ViewHolder> {

    private OnListItemClickListener listener;
    List<Tarefa> list;
    Context context;


    public MainAdapter(Context context, List<Tarefa> list, OnListItemClickListener listener) {
        this.list = list;
        this.context = context;
        this.listener = listener;
    }

    @Override
    public MainAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.layout_lista, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(final MainAdapter.ViewHolder holder, int position) {

        final Tarefa tarefa = list.get(position);

        holder.txtTitle.setText(tarefa.getTitulo());
        holder.txtContent.setText(tarefa.getDescricao());
        holder.view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onItemClick(holder.getAdapterPosition());
            }
        });

    }

    @Override
    public int getItemCount() {
        return list.size();
    }



    public class ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtTitle, txtContent;
        private View view;

        public ViewHolder(View itemView) {
            super(itemView);
            view = itemView;

            txtTitle = (TextView) itemView.findViewById(R.id.txtTitle);
            txtContent = (TextView) itemView.findViewById(R.id.txtContent);

        }
    }



}

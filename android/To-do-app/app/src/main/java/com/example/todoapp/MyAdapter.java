package com.example.todoapp;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.database.FirebaseDatabase;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyAdapter extends RecyclerView.Adapter<MyAdapter.MyViewHolder> {
    Context context;
    HashMap<String,Task> taskMap;
    List<String> keys;
    public MyAdapter(Context ct, HashMap<String,Task> taskMap){
        this.context = ct;
        this.taskMap=taskMap;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater=LayoutInflater.from(context);
        //Inflate the row xml file
        View view = inflater.inflate(R.layout.row,parent,false);

        return new MyViewHolder(view);
    }


    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        String key=keys.get(position);
        Task task=taskMap.get(key);
        holder.title_text.setText(task.getTitle());
        //if the description is empty the it'll be hidden
        if (task.getDesc().length() != 0) {
            holder.desc_text.setVisibility(View.VISIBLE);
            holder.desc_text.setText(task.getDesc());
        }
        //if there isn't a due date then it'll be hidden
        if (task.getDate().length() != 0 ) {
            holder.dueDate_text.setText("Due Date: " +task.getDate());
        }
        holder.key_text.setText(keys.get(position));
        holder.deleteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new AlertDialog.Builder(context)
                        .setTitle("Delete task")
                        .setMessage("This action is irreversible. Are you sure you want to delete the task")
                        .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                Log.i("mine","clicked");
                                FirebaseDatabase db= FirebaseDatabase.getInstance();
                                db.getReference().child("Tasks").child(keys.get(position)).removeValue();
                            }
                        })
                        .setNegativeButton("Cancel", null)
                        .show();

            }
        });
        holder.editButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(context);
                builder.setTitle("Edit Task");
                View viewInflated = LayoutInflater.from(context).inflate(R.layout.task_input, ScrollingActivity.vg, false);
                final EditText title_textView = (EditText) viewInflated.findViewById(R.id.title),
                        description_textView = (EditText) viewInflated.findViewById(R.id.description);
                TextView date_textView = (TextView) viewInflated.findViewById(R.id.due_date);
                title_textView.setText(task.getTitle());
                description_textView.setText(task.getDesc());
                date_textView.setText(task.getDate());
                builder.setView(viewInflated);
                builder.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Map<String,Object> newMap=new HashMap<>();
                        newMap.put("title",title_textView.getText().toString().trim());
                        newMap.put("desc",description_textView.getText().toString().trim());
                        newMap.put("date",date_textView.getText().toString().trim());
                        FirebaseDatabase db= FirebaseDatabase.getInstance();
                        db.getReference().child("Tasks").child(keys.get(position)).updateChildren(newMap);
                    }
                });
                builder.setNegativeButton("Cancel", null).show();
            }
        });
    }

    @Override
    public int getItemCount() {
        Collection<String> kc= taskMap.keySet();
        keys= new ArrayList<>(kc);
        return taskMap.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView title_text,desc_text,dueDate_text,key_text;
        FloatingActionButton deleteButton,editButton;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            title_text=itemView.findViewById(R.id.title_text);
            desc_text=itemView.findViewById(R.id.desc_text);
            dueDate_text=itemView.findViewById(R.id.dueDate);
            key_text=itemView.findViewById(R.id.key);
            deleteButton=itemView.findViewById(R.id.delete);
            editButton=itemView.findViewById(R.id.edit);

        }
    }
}

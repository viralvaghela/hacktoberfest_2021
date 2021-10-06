package com.example.note;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Notes_Adapter extends RecyclerView.Adapter<Notes_Adapter.Notes>{
    private List<Note_gettersetter> notes =new ArrayList<>();
    Context context;
    int col;
    String des;
    public Notes_Adapter(List<Note_gettersetter> notes, Context context) {
        this.notes = notes;
        this.context = context;
    }
    @NonNull
    @Override
    public Notes onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view;
        view= LayoutInflater.from(parent.getContext()).inflate(R.layout.notes,parent,false);
        return new Notes(view);
    }
    @SuppressLint("ResourceAsColor")
    @Override
    public void onBindViewHolder(@NonNull final Notes holder, final int position) {
            holder.title.setText(notes.get(position).getTitle());
            if(notes.get(position).getDesc().length()>300){
                des=notes.get(position).getDesc().substring(0,250);
                Log.i("rand", String.valueOf(des.length()));

            }
            else {
                des=notes.get(position).getDesc();
            }
            holder.content.setText(des);
            holder.date.setText(notes.get(position).getDatetime());
            col= new Random().nextInt(6);
            switch (col){
                case 0:
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        holder.cardView.setCardBackgroundColor(context.getColor(R.color.color1));
                    }
                    break;
                case 1:
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        holder.cardView.setCardBackgroundColor(context.getColor(R.color.color2));
                    }
                    break;
                case 2:
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        holder.cardView.setCardBackgroundColor(context.getColor(R.color.color3));
                    }
                    break;
                default:
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        holder.cardView.setCardBackgroundColor(context.getColor(R.color.colordef));
                    }
            }
            if(holder.content.getText().toString().equals("Voice Note")){
                holder.cardView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent intent=new Intent(context,ListemAudioFile.class);
                        try {
                            //Toast.makeText(context, ""+SingIn.id, Toast.LENGTH_SHORT).show();
                            StorageReference sref= FirebaseStorage.getInstance().getReference();
                            StorageReference storageReference = sref.child(SingIn.id).child("Audio").child(notes.get(position).getDatetime());
                            intent.putExtra("url",holder.date.getText().toString());
                            intent.putExtra("id",notes.get(position).getDocumentid());
                            context.startActivity(intent);
                        }catch (Exception e){
                            Toast.makeText(context, ""+e.toString(), Toast.LENGTH_SHORT).show();
                        }
                       // Toast.makeText(context, "adapter "+notes.get(position).getUrl(), Toast.LENGTH_SHORT).show();

                    }
                });
            }
            else {
                holder.cardView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent intent = new Intent(context, EditNote.class);
                        intent.putExtra("Title", holder.title.getText().toString());
                        intent.putExtra("Content", holder.content.getText().toString());
                        intent.putExtra("id", notes.get(position).getDocumentid());
                        context.startActivity(intent);
                    }
                });
            }
    }
    @Override
    public int getItemCount() {
        return notes.size();
    }


    public static class Notes extends RecyclerView.ViewHolder{
        TextView title,content,date;
        CardView cardView;
        public Notes(@NonNull View itemView) {
            super(itemView);
           title=itemView.findViewById(R.id.titlee);
           content=itemView.findViewById(R.id.contentss);
            cardView=itemView.findViewById(R.id.notte);
            date=itemView.findViewById(R.id.dateandtime);
        }
    }

}

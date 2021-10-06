package com.example.note;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.firestore.DocumentSnapshot;

import java.util.Calendar;

public class EditNote extends AppCompatActivity {
    EditText edtitle,edcontent;
    CardView edsave,eddelete,edshare;
    String title,cont,date;
    static String id;
    Calendar calendar;
    String deltit,delcont;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_note);
        edtitle=findViewById(R.id.edittitle);
        edcontent=findViewById(R.id.editcontent);
        edsave=findViewById(R.id.edsavee);
        Intent intent=getIntent();
        title=intent.getStringExtra("Title");
        edtitle.setText(title);
        cont=intent.getStringExtra("Content");
        edcontent.setText(cont);
        id=intent.getStringExtra("id");
        eddelete=findViewById(R.id.eddelete);
        edshare=findViewById(R.id.edshare);
       calendar=Calendar.getInstance();
        date=String.valueOf(calendar.getTime());
        edshare.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ShareNote();
            }
        });
        eddelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DeleteNote();
            }
        });
        edsave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SaveNotes();
            }
        });
    }
    public Void SaveNotes(){
        SingIn.db.collection("Note").document(SingIn.id).collection("child note").document(id).update("title",edtitle.getText().toString());
        SingIn.db.collection("Note").document(SingIn.id).collection("child note").document(id).update("desc",edcontent.getText().toString());
        SingIn.db.collection("Note").document(SingIn.id).collection("child note").document(id).update("datetime",date);
        Intent intent=new Intent(getApplicationContext(),SingIn.class);
        startActivity(intent);
        finish();
        return null;
    }
    public void DeleteNote(){
        deltit=edtitle.getText().toString();
        delcont=edcontent.getText().toString();
        SingIn.db.collection("Note").document(SingIn.id).collection("child note").document(id).delete().addOnSuccessListener(new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(Void aVoid) {
               // Toast.makeText(EditNote.this, "Note Deleted", Toast.LENGTH_SHORT).show();
            }
        });
        SingIn.del=1;
        Intent intent=new Intent(getApplicationContext(),SingIn.class);
        intent.putExtra("deltitle",deltit);
        intent.putExtra("delcont",delcont);
        intent.putExtra("date",date);
        startActivity(intent);
        finish();
    }
    public void ShareNote(){
        Intent share=new Intent(Intent.ACTION_SEND);
        String title,desc,note;
        note="Title :\n"+edtitle.getText().toString()+"\n"+"Description :\n"+edcontent.getText().toString();
        share.putExtra(Intent.EXTRA_TEXT,note);
        share.setType("text/plain");
        startActivity(share);
    }
}
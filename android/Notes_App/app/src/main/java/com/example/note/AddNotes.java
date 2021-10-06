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
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;

import java.util.Calendar;


public class AddNotes extends AppCompatActivity {
    EditText title,content;
    FirebaseFirestore db=FirebaseFirestore.getInstance();
    String id;
    Button save;
    CardView voice;
    static Calendar calendar;
    String date;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_notes);
        title=findViewById(R.id.newtitle);
        save=findViewById(R.id.savee);
        voice = findViewById(R.id.voicee);
        voice.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GoToVoice();
            }
        });
        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Save();
            }
        });
        content=findViewById(R.id.newcontent);
        Intent intent=getIntent();
        id=intent.getStringExtra("id");
        calendar=Calendar.getInstance();
        int hours=calendar.get(Calendar.HOUR_OF_DAY);
        int minute=calendar.get(Calendar.MINUTE);
        //time=String.valueOf(hours)+" : "+String.valueOf(minute);
        date=String.valueOf(calendar.getTime());
    }
    public void Save(){
        Note_gettersetter note_gettersetter=new Note_gettersetter(title.getText().toString(),content.getText().toString(),date);
        db.collection("Note").document(id).collection("child note").add(note_gettersetter).addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
            @Override
            public void onSuccess(DocumentReference documentReference) {
                Toast.makeText(AddNotes.this, "Added Successfully ", Toast.LENGTH_SHORT).show();
            }
        });
        Intent intent=new Intent(getApplicationContext(),SingIn.class);
        startActivity(intent);
        finish();
    }
    public void GoToVoice(){
        Intent intent=new Intent(getApplicationContext(),AudioRecorder.class);
        startActivity(intent);
        finish();
    }
}
package com.example.note;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.view.View;
import android.widget.Toast;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.io.IOException;

public class ListemAudioFile extends AppCompatActivity {
    CardView play,delete;
    MediaPlayer mediaPlayer;
    String uri1,id;
    StorageReference sref;
    HandlerThread handlerThread;
    StorageReference storageReference;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_listem_audio_file);
        play=findViewById(R.id.playaud);
        delete=findViewById(R.id.deleteaud);
        Intent intent=getIntent();
        uri1=intent.getStringExtra("url");
        id=intent.getStringExtra("id");

        sref= FirebaseStorage.getInstance().getReference();
        storageReference = sref.child(SingIn.id).child("Audio").child(uri1);
        play.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Play();
            }
        });
        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Delete();
            }
        });
    }
    public void Play(){
        handlerThread = new HandlerThread("TesHandlerThread");
        handlerThread.start();
        Looper looper = handlerThread.getLooper();
        Handler handler = new Handler(looper);
        handler.post(new Runnable() {
            @Override
            public void run() {
        mediaPlayer=new MediaPlayer();
            //mediaPlayer.setDataSource("https://firebasestorage.googleapis.com/v0/b/note-1-1599469373538.appspot.com/o/Audio%2F107680924475758183775?alt=media&token=fc4329e6-84d1-4e6c-b795-d34fabf4a998");
            // mediaPlayer.setDataSource("https://firebasestorage.googleapis.com/v0/b/note-1-1599469373538.appspot.com/o/107680924475758183775%2FAudio%2FTue%20Sep%2015%2016%3A07%3A33%20IST%202020?alt=media&token=71cfb060-34f2-45e6-85ae-f5bd79544857");A
           // sref= FirebaseStorage.getInstance().getReference();
           // storageReference = sref.child(SingIn.id).child("Audio").child(uri1);
            storageReference.getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                @Override
                public void onSuccess(Uri uri) {
                    try {
                        mediaPlayer.setDataSource(ListemAudioFile.this,uri);
                        mediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
                            @Override
                            public void onPrepared(MediaPlayer mp) {
                                mp.start();
                                Toast.makeText(ListemAudioFile.this, "playing", Toast.LENGTH_SHORT).show();
                            }
                        });
                        mediaPlayer.prepare();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
            }
        });
      }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        handlerThread.quit();
        mediaPlayer.stop();
    }
    public void Delete(){
        storageReference.delete();
        SingIn.db.collection("Note").document(SingIn.id).collection("child note").document(id).delete().addOnSuccessListener(new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(Void aVoid) {
                Toast.makeText(ListemAudioFile.this, "Note Deleted", Toast.LENGTH_SHORT).show();
            }
        });
        Intent intent=new Intent(getApplicationContext(),SingIn.class);
        startActivity(intent);
        finish();
    }
}
//https://firebasestorage.googleapis.com/v0/b/note-1-1599469373538.appspot.com/o/Audio%2F107680924475758183775?alt=media&token=1caf0215-f0e0-407e-a0b3-a0a8f935ca24
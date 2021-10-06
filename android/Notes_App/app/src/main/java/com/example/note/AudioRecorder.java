package com.example.note;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.contentcapture.ContentCaptureContext;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

public class AudioRecorder extends AppCompatActivity {
    TextView title;
    CardView record;
    static final int Permission_code=1;
    Calendar calendar;
    MediaRecorder recorder;
    String fileName=null;
    int temp=0;
    MediaPlayer mediaPlayer;
    EditText flname;
    String date;
    AudioLink audioLink;
    static StorageReference sref;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_voice_recorder);
        calendar=Calendar.getInstance();
        title=findViewById(R.id.voicetit);
        fileName=Environment.getExternalStorageDirectory().getAbsolutePath();
        fileName+="/recorded.mp3";
        sref= FirebaseStorage.getInstance().getReference();
        flname=findViewById(R.id.vocfile);
        calendar=Calendar.getInstance();
        date=String.valueOf(calendar.getTime());
        title.setText("Tap to Record");
        record=findViewById(R.id.recordd);
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)== PackageManager.PERMISSION_GRANTED &&
                ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO)== PackageManager.PERMISSION_GRANTED){
            Granted();
        }
        else{
            RequestPer();
        }

    }
    public void RequestPer(){
        ActivityCompat.requestPermissions(this,new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},Permission_code);
        ActivityCompat.requestPermissions(this,new String[]{Manifest.permission.RECORD_AUDIO},Permission_code);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        if(requestCode==Permission_code){
            if(permissions.length>0 && grantResults[0]==PackageManager.PERMISSION_GRANTED ){
                Granted();
            }
        }

    }
    public void Granted(){
        record.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(temp==0) {
                    title.setText("Recording.......\nTap to stop Recording");
                    temp = 1;
                    startRecording();
                }
                else {
                    title.setText("Recording Stopped.......");
                    temp = 0;
                    stopRecording();
                }
            }
        });
    }
    private void startRecording() {
        recorder = new MediaRecorder();

            recorder.setAudioSource(MediaRecorder.AudioSource.MIC);

        recorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
        recorder.setOutputFile(fileName);
        recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);

        try {
            recorder.prepare();
            recorder.start();
        } catch (IOException e) {
            //Log.e(LOG_TAG, "prepare() failed");
            Toast.makeText(this,""+e.toString(), Toast.LENGTH_SHORT).show();
        }


    }
    private void stopRecording() {
        recorder.stop();
        recorder.release();
        recorder = null;
        Upload();
    }
    public void Upload(){
        final StorageReference storageReference=sref.child(SingIn.id).child("Audio").child(calendar.getTime().toString());
        Uri uri=Uri.fromFile(new File(fileName));
        storageReference.putFile(uri).addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
            @Override
            public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                final Note_gettersetter note_gettersetter=new Note_gettersetter(flname.getText().toString(),"Voice Note",date);
                storageReference.getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                    @Override
                    public void onSuccess(Uri uri) {
                        note_gettersetter.setUrl(uri.toString());
                    }
                });
                SingIn.db.collection("Note").document(SingIn.id).collection("child note").add(note_gettersetter);
               // audioLink=new AudioLink("Audio Title","Audio Desc",date,storageReference.getDownloadUrl().toString());
            }
        })
        .addOnFailureListener(new OnFailureListener() {
            @Override
            public void onFailure(@NonNull Exception e) {
                Toast.makeText(AudioRecorder.this, e.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
        Intent intent=new Intent(getApplicationContext(),SingIn.class);
        startActivity(intent);
        finish();
    }
}
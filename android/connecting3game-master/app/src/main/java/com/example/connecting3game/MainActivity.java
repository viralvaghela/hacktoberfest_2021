package com.example.connecting3game;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.assist.AssistStructure;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.GridLayout;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.EventListener;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.FirebaseFirestoreException;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
                ImageView imageView0, imageView1, imageView2, imageView3, imageView4 ,imageView5, imageView6, imageView7, imageView8;
                int active=0;
                int[] gamespot={2,2,2,2,2,2,2,2,2};
                boolean gameactive = true;
                FirebaseFirestore db = FirebaseFirestore.getInstance();

                public void change(View view) {
                    ImageView counter = (ImageView) view;
                    int gametag = Integer.parseInt((counter.getTag().toString()));
                    if (gamespot[gametag] == 2 && gameactive) {
                        if (active == 0) {
                            counter.setImageResource(R.drawable.red);
                            counter.animate().rotation(3600).setDuration(1500);
                            gamespot[gametag] = active;
                            Map<String,String> data = new HashMap<>();
                            data.put("key",String.valueOf(gametag));
                            db.collection("check").document("check").set(data);
                            check();
                            active = 1;
                        } else {
                            counter.setImageResource(R.drawable.yellow);
                            counter.animate().rotation(3600).setDuration(1500);
                            gamespot[gametag] = active;
                            check();
                            active = 0;
            }


        }
    }

    public void fbchange(int key){
        int gametag = key;

        if(gametag==0){
            imageView0.setImageResource(R.drawable.red);
        }


        }


        public void check(){
        if(gamespot[0]==1&&gamespot[1]==1&&gamespot[2]==1){
            Toast.makeText(this, "yellow won", Toast.LENGTH_SHORT).show();
            tryagain();

        }
            else if(gamespot[3]==1&&gamespot[4]==1&&gamespot[5]==1){
                Toast.makeText(this, "yellow won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[6]==1&&gamespot[7]==1&&gamespot[8]==1){
                Toast.makeText(this, "yellow won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
           else if(gamespot[0]==1&&gamespot[3]==1&&gamespot[6]==1){
                Toast.makeText(this, "yellow won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[2]==1&&gamespot[5]==1&&gamespot[8]==1){
                Toast.makeText(this, " yellow won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[0]==1&&gamespot[4]==1&&gamespot[8]==1){
                Toast.makeText(this, " yellow won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[2]==1&&gamespot[4]==1&&gamespot[6]==1){
                Toast.makeText(this, "yellow won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[0]==0&&gamespot[1]==0&&gamespot[2]==0){
                Toast.makeText(this, "red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[3]==0&&gamespot[4]==0&&gamespot[5]==0){
                Toast.makeText(this, "red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[6]==0&&gamespot[7]==0&&gamespot[8]==0){
                Toast.makeText(this, "red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[0]==0&&gamespot[3]==0&&gamespot[6]==0){
                Toast.makeText(this, "red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[2]==0&&gamespot[5]==0&&gamespot[8]==0){
                Toast.makeText(this, " red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[0]==0&&gamespot[4]==0&&gamespot[8]==0){
                Toast.makeText(this, " red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }
            else if(gamespot[2]==0&&gamespot[4]==0&&gamespot[6]==0){
                Toast.makeText(this, "red won", Toast.LENGTH_SHORT).show();
                tryagain();
            }


        }
        public void tryagain(){
            Button b = (Button) findViewById(R.id.button);
            b.setVisibility(View.VISIBLE);
            gameactive=false;



        }
        public void refresh(View view){
            androidx.gridlayout.widget.GridLayout gridLayout = findViewById(R.id.gridLayout1);


            for(int i=0; i<gridLayout.getChildCount(); i++) {
                ImageView counter = (ImageView) gridLayout.getChildAt(i);
                // do stuff with child
                counter.setImageDrawable(null);

            }
             active=0;
            Button b = (Button) findViewById(R.id.button);
            b.setVisibility(View.INVISIBLE);
            gameactive = true;
            for(int i =0; i<9; i++){
                gamespot[i]=2;
            }
        }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        imageView0=findViewById(R.id.imageView1);
        imageView1=findViewById(R.id.imageView2);
        imageView2=findViewById(R.id.imageView3);
        imageView3=findViewById(R.id.imageView4);
        imageView4=findViewById(R.id.imageView5);
        imageView5=findViewById(R.id.imageView6);
        imageView6=findViewById(R.id.imageView7);
        imageView7=findViewById(R.id.imageView8);
        imageView8=findViewById(R.id.imageView9);
       db.collection("check").document("check").addSnapshotListener(this, new EventListener<DocumentSnapshot>() {
           @Override
           public void onEvent(@Nullable DocumentSnapshot documentSnapshot, @Nullable FirebaseFirestoreException e) {
               String  key =  documentSnapshot.getString("key");
               int k = Integer.parseInt(key);
               if(k>=0){
                 fbchange(k);
               }

           }
       });

    }
}

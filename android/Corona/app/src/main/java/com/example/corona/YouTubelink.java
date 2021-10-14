package com.example.corona;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.cardview.widget.CardView;

import com.google.android.youtube.player.YouTubeBaseActivity;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerView;

public class YouTubelink extends YouTubeBaseActivity {
    CardView cv;
    static Button button;
    //static YouTubePlayerView youTubePlayerView;
    //static YouTubePlayer.OnInitializedListener onInitializedListener;
    public void clicked(View v){
        //youTubePlayerView.initialize(Youtube.apikey,onInitializedListener);
        Intent intent=new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com/watch?v=9XujhDKBFOA"));
        startActivity(intent);
    }
    public void dail(View view){
        Intent intent=new Intent(Intent.ACTION_DIAL);
        intent.setData(Uri.parse("tel:"+"044-29510500"));
        startActivity(intent);
    }
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_home);
        button=(Button)findViewById(R.id.but);
        cv=(CardView) findViewById(R.id.dailer);
        /*onInitializedListener = new YouTubePlayer.OnInitializedListener() {
            @Override
            public void onInitializationSuccess(YouTubePlayer.Provider provider, YouTubePlayer youTubePlayer, boolean b) {
                youTubePlayer.loadVideo("FC4soCjxSOQ");
            }

            @Override
            public void onInitializationFailure(YouTubePlayer.Provider provider, YouTubeInitializationResult youTubeInitializationResult) {

            }
        };*/

    }
}

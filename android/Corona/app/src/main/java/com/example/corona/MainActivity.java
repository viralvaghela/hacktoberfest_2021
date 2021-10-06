package com.example.corona;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Toast;

import com.google.android.material.tabs.TabLayout;
import com.google.android.youtube.player.YouTubePlayerView;

public class MainActivity extends AppCompatActivity {
    private TabLayout tabLayout;
    private ViewPager viewPager;
    private Viewpageradapter viewPagerAdapter;

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater=getMenuInflater();
        menuInflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()){
            case R.id.map:
                Uri uri=Uri.parse("geo:0,0?q=covid+test+center");
                Intent map=new Intent(Intent.ACTION_VIEW,uri);
                map.setPackage("com.google.android.apps.maps");
                startActivity(map);
                return true;
            case R.id.call:
                //Toast.makeText(this, "call", Toast.LENGTH_SHORT).show();
                Intent i=new Intent(getApplicationContext(),Helpline.class);
                startActivity(i);
                return true;
            default:
                return false;
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tabLayout=(TabLayout) findViewById(R.id.tablay);
        viewPager=(ViewPager) findViewById(R.id.viewpager);
        viewPagerAdapter=new Viewpageradapter(getSupportFragmentManager());
        viewPagerAdapter.AddFragment(new Fragmenthome(),"Home");
        viewPagerAdapter.AddFragment(new Fragmentglobal(),"Global");
        viewPagerAdapter.AddFragment(new Fragmentstates(),"Country");
        viewPager.setAdapter(viewPagerAdapter);
        tabLayout.setupWithViewPager(viewPager);
        viewPager.setCurrentItem(1);

    }

    public void clicked(View view) {
        Intent intent=new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com/watch?v=9XujhDKBFOA"));
        startActivity(intent);
    }

    public void dail(View view) {
        Intent intent=new Intent(Intent.ACTION_DIAL);
        intent.setData(Uri.parse("tel:"+"044-29510500"));
        startActivity(intent);
    }
    public void share(View view){
        Intent share=new Intent(Intent.ACTION_SEND);
        String cases,todcases,death,toddeath,recovered,todrecovered,fin;
        cases=Fragmentglobal.mcases;
        todcases=Fragmentglobal.mtodcases;
        death=Fragmentglobal.mdeath;
        toddeath=Fragmentglobal.mtoddeath;
        recovered=Fragmentglobal.mrecover;
        todrecovered=Fragmentglobal.mtodrecover;
        fin="Total cases: "+cases+"\n Today cases: "+todcases+"\n Total death: "+death+"\n Today death: "+toddeath+"\n Total recovered: "+recovered+"\n Today recovered: "+todrecovered;
        share.putExtra(Intent.EXTRA_TEXT,fin);
        share.setType("text/plain");
        startActivity(share);

    }
}
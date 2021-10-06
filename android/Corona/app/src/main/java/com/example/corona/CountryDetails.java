package com.example.corona;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class CountryDetails extends AppCompatActivity {
    TextView totcase,todcase,totdeath,toddeath,totrecover,todrecover,active,critical,country;
    private int positioncountry;
    CardView iv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent=getIntent();
        positioncountry = intent.getIntExtra("position", 0);
        setContentView(R.layout.activity_country_details);
        getSupportActionBar().setTitle("Details of "+Fragmentstates.countrylists.get(positioncountry).getCountry());

        iv=findViewById(R.id.indicatior);
        totcase= findViewById(R.id.totalcase);
        todcase= findViewById(R.id.todaycase);
        totdeath= findViewById(R.id.totaldeath);
        toddeath=findViewById(R.id.todaydeath);
        totrecover= findViewById(R.id.totalrecovered);
        todrecover= findViewById(R.id.todayrecovered);
        active= findViewById(R.id.activecase);
        critical= findViewById(R.id.criticalcase);
        country= findViewById(R.id.countryname);
            country.setText(Fragmentstates.countrylists.get(positioncountry).getCountry());
            totcase.setText(Fragmentstates.countrylists.get(positioncountry).getCases());
            todcase.setText(Fragmentstates.countrylists.get(positioncountry).getTodcases());
            totdeath.setText(Fragmentstates.countrylists.get(positioncountry).getDeath());
            toddeath.setText(Fragmentstates.countrylists.get(positioncountry).getToddeath());
            totrecover.setText(Fragmentstates.countrylists.get(positioncountry).getRecovered());
            todrecover.setText(Fragmentstates.countrylists.get(positioncountry).getTodrecovered());
            active.setText(Fragmentstates.countrylists.get(positioncountry).getActive());
            critical.setText(Fragmentstates.countrylists.get(positioncountry).getCritical());

       if(Integer.parseInt(todcase.getText().toString())>1000){
            iv.setCardBackgroundColor(Color.rgb(255,0,0));
       }
        else if(Integer.parseInt(todcase.getText().toString())>600){
            iv.setCardBackgroundColor(Color.rgb(255,69,0));
        }
        else if(Integer.parseInt(todcase.getText().toString())>100){
            iv.setCardBackgroundColor(Color.rgb(255,255,0));
        }
        else if(Integer.parseInt(todcase.getText().toString())<100){
            iv.setCardBackgroundColor(Color.rgb(0,128,0));
        }
    }
    public void share(View view){
        Intent share=new Intent(Intent.ACTION_SEND);
        String cases,todcases,death,toddeaths,recovered,todrecovered,fin,countryname;
        countryname=country.getText().toString();
        cases=totcase.getText().toString();
        todcases=todcase.getText().toString();
        death=totdeath.getText().toString();
        toddeaths=toddeath.getText().toString();
        recovered=totrecover.getText().toString();
        todrecovered=todrecover.getText().toString();
        fin=" Country: "+countryname+"\n Total cases: "+cases+"\n Today cases: "+todcases+"\n Total death: "+death+"\n Today death: "+toddeath+"\n Total recovered: "+recovered+"\n Today recovered: "+todrecovered;
        share.putExtra(Intent.EXTRA_TEXT,fin);
        share.setType("text/plain");
        startActivity(share);

    }

}
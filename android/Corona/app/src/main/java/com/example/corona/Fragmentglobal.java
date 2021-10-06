package com.example.corona;

import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.eazegraph.lib.charts.PieChart;
import org.eazegraph.lib.models.PieModel;
import org.json.JSONObject;

public class Fragmentglobal extends Fragment {
    View v;
    static String mcases;
    static String mtodcases;
    static String mdeath;
    static String mtoddeath;
    static String mrecover;
    static String mtodrecover;
    PieChart mPieChart;
    TextView totcase,todcase,totdeath,toddeath,totrecover,todrecover,active,critical,test,country;
    public Fragmentglobal(){
    }
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        v=inflater.inflate(R.layout.fragment_global,container,false);
        mPieChart = (PieChart) v.findViewById(R.id.piechart);
        totcase=(TextView) v.findViewById(R.id.totalcase);
        todcase=(TextView) v.findViewById(R.id.todaycase);
        totdeath=(TextView) v.findViewById(R.id.totaldeath);
        toddeath=(TextView) v.findViewById(R.id.todaydeath);
        totrecover=(TextView) v.findViewById(R.id.totalrecovered);
        todrecover=(TextView) v.findViewById(R.id.todayrecovered);
        active=(TextView) v.findViewById(R.id.activecase);
        critical=(TextView) v.findViewById(R.id.criticalcase);
        test=(TextView) v.findViewById(R.id.test);
        country=(TextView) v.findViewById(R.id.country);
        showdetails();
        return v;
    }

    public void showdetails(){
        String url="https://corona.lmao.ninja/v2/all";
        StringRequest stringRequest=new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonObject = new JSONObject(response.toString());
                    totcase.setText(jsonObject.getString("cases"));
                    todcase.setText(jsonObject.getString("todayCases"));
                    totdeath.setText(jsonObject.getString("deaths"));
                    toddeath.setText(jsonObject.getString("todayDeaths"));
                    totrecover.setText(jsonObject.getString("recovered"));
                    todrecover.setText(jsonObject.getString("todayRecovered"));
                    active.setText(jsonObject.getString("active"));
                    critical.setText(jsonObject.getString("critical"));
                    test.setText(jsonObject.getString("tests"));
                    country.setText(jsonObject.getString("affectedCountries"));
                    mcases=totcase.getText().toString();
                    mtodcases=todcase.getText().toString();
                    mdeath=totdeath.getText().toString();
                    mtoddeath=toddeath.getText().toString();
                    mrecover=totrecover.getText().toString();
                    mtodrecover=totrecover.getText().toString();
                    mPieChart.addPieSlice(new PieModel("Cases", Integer.parseInt(totcase.getText().toString()), Color.parseColor("#FFEB37")));
                    mPieChart.addPieSlice(new PieModel("Death", Integer.parseInt(totdeath.getText().toString()), Color.parseColor("#FF0000")));
                    mPieChart.addPieSlice(new PieModel("Recovered", Integer.parseInt(totrecover.getText().toString()), Color.parseColor("#11FF00")));
                    mPieChart.addPieSlice(new PieModel("Active", Integer.parseInt(active.getText().toString()), Color.parseColor("#0EA4E8")));
                    mPieChart.startAnimation();
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(v.getContext(),error.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
        RequestQueue requestQueue= Volley.newRequestQueue(v.getContext());
        requestQueue.add(stringRequest);
    }
}

package com.example.corona;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Fragmentstates extends Fragment {//extends AppCompatActivity {
    public static List<Countrylist> countrylists=new ArrayList<>();
    Countrylist countrylist;
    View view;
    Custom_list custom_list;
    EditText search;
    ListView country;
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        //super.onCreate(savedInstanceState);
        view=inflater.inflate(R.layout.country,container,false);
        country=view.findViewById(R.id.cname);
        search=view.findViewById(R.id.find);

        fetchdata();
        return view;//call okkkk now try stoped ok wait okk now give a try stoped sena error kamikave matudu ama ama TRY already did SHIT STOPPED?yeeees wait i google one thingokki
    }
    public void fetchdata(){
        String url="https://corona.lmao.ninja/v2/countries";
        StringRequest stringRequest=new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONArray jsonArray=new JSONArray(response);
                    for(int i=0;i<jsonArray.length();i++){
                        JSONObject object=jsonArray.getJSONObject(i);
                        String countryname=object.getString("country");
                        String countrycase=object.getString("cases");
                        String countrytotcase=object.getString("todayCases");
                        String countrydeath=object.getString("deaths");
                        String countrytoddeath=object.getString("todayDeaths");
                        String countryrecovered=object.getString("recovered");
                        String countrytodrecovered=object.getString("todayRecovered");
                        String countryactive=object.getString("active");
                        String countrycritical=object.getString("critical");
                        JSONObject jsonObject=object.getJSONObject("countryInfo");
                        String flagurl=jsonObject.getString("flag");
                        //Toast.makeText(view.getContext(),countryname, Toast.LENGTH_SHORT).show();
                        //Toast.makeText(view.getContext(), countryname, Toast.LENGTH_SHORT).show();
                        countrylist=new Countrylist(flagurl,countryname,countrydeath,countrytoddeath,countrycase,countrytotcase,countryrecovered,countrytodrecovered,countryactive,countrycritical);
                        countrylists.add(countrylist);

                    }
                    custom_list=new Custom_list(view.getContext(),countrylists);
                    country.setAdapter(custom_list);
                    //Log.i("name",countrylists.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                    //Toast.makeText(view.getContext(),"error", Toast.LENGTH_LONG).show();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(view.getContext(),error.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });

        RequestQueue requestQueue= Volley.newRequestQueue(view.getContext());
        requestQueue.add(stringRequest);
        country.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent=new Intent(view.getContext(),CountryDetails.class);
                intent.putExtra("position",position);
                startActivity(intent);
            }
        });

    }
}


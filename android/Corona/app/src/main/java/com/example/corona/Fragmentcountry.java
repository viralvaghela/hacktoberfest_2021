package com.example.corona;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import java.util.ArrayList;
import java.util.List;

public class Fragmentcountry extends Fragment {
    //public static List<Countrylist> countrylists=new ArrayList<>();
    //Countrylist countrylist;
    View view;
    //Custom_list custom_list;
    //ListView country;
    public Fragmentcountry(){

    }
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view=inflater.inflate(R.layout.country,container,false);
        return view;
    }
}

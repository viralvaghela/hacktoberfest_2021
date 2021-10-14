package com.example.corona;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.bumptech.glide.Glide;

import java.util.List;

public class Custom_list extends ArrayAdapter<Countrylist> {
    private Context context;
    private List<Countrylist> countrylists;
    public Custom_list( Context context, List<Countrylist> countrylists) {
        super(context, R.layout.fragment_states,countrylists);
        this.context=context;
        this.countrylists=countrylists;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View view= LayoutInflater.from(parent.getContext()).inflate(R.layout.fragment_states,null,true);
        TextView countryname=view.findViewById(R.id.namec);
        ImageView flagv=view.findViewById(R.id.flag);
        countryname.setText(countrylists.get(position).getCountry());
        Glide.with(context).load(countrylists.get(position).getFlag()).into(flagv);
        return view;
    }
}

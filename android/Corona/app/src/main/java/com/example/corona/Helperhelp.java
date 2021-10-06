package com.example.corona;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

public class Helperhelp extends ArrayAdapter<Helperhgetset> {
    Context context;
    List<Helperhgetset> list;
    public Helperhelp(Context context,List<Helperhgetset> list){
        super(context,R.layout.helper,list);
        this.context=context;
        this.list=list;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View view= LayoutInflater.from(parent.getContext()).inflate(R.layout.helper,null,true);
        TextView state=view.findViewById(R.id.state);
        TextView hnumber=view.findViewById(R.id.number);
        state.setText(list.get(position).getStatename());
        hnumber.setText(list.get(position).getPhnumber());
        return view;
    }
}

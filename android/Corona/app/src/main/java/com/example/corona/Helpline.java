package com.example.corona;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class Helpline extends AppCompatActivity {
    ListView helpline;
    ArrayList<String> state;
    ArrayList<String> snum;
    public static List<Helperhgetset> arrayList;
    Helperhgetset helperhgetset;
    Helperhelp helperhelp;
    //ArrayAdapter<String> arrayAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_helpline);
        helpline=findViewById(R.id.helpnumber);
        arrayList=new ArrayList<>();
        state=new ArrayList<>();
        snum=new ArrayList<>();
        state.add("Andaman & Nicobar");
        state.add("Andhra Pradesh");
        state.add("Arunachal Pradesh");
        state.add("Assam");
        state.add("Bihar");
        state.add("Chandigarh");
        state.add("Chhattisgarh");
        state.add("Dadra Nagar Haveli");
        state.add("Delhi");
        state.add("Goa");
        state.add("Gujarat");
        state.add("Haryana");
        state.add("Himachal Pradesh");
        state.add("Jammu");
        state.add("Jharkhand");
        state.add("Karnataka");
        state.add("Kashmir");
        state.add("Kerala");
        state.add("Ladakh");
        state.add("Lakshadweep");
        state.add("Madhya Pradesh");
        state.add("Maharashtra");
        state.add("Manipur");
        state.add("Meghalaya");
        state.add("Mizoram");
        state.add("Nagaland");
        state.add("Odisha");
        state.add("Puducherry");
        state.add("Punjab");
        state.add("Rajasthan");
        state.add("Sikkim");
        state.add("Tamil Nadu");
        state.add("Telangana");
        state.add("Tripura");
        state.add("Uttarakhand");
        state.add("Uttar Pradesh");
        state.add("West Bengal");
        snum.add("03192-232102");
        snum.add("0866-2410978");
        snum.add("9436055743");
        snum.add("6913347770");
        snum.add("104");
        snum.add("9779558282");
        snum.add("104");
        snum.add("104");
        snum.add("011-22307145");
        snum.add("104");
        snum.add("104");
        snum.add("8558893911");
        snum.add("104");
        snum.add("01912520982");
        snum.add("104");
        snum.add("104");
        snum.add("01942440283");
        snum.add("0471-2552056");
        snum.add("01982256462");
        snum.add("104");
        snum.add("104");
        snum.add("020-26127394");
        snum.add("3852411668");
        snum.add("108");
        snum.add("102");
        snum.add("7005539653");
        snum.add("9439994859");
        snum.add("104");
        snum.add("104");
        snum.add("0141-2225624");
        snum.add("104");
        snum.add("044-29510500");
        snum.add("104");
        snum.add("0381-2315879");
        snum.add("104");
        snum.add("18001805145");
        snum.add("1800313444222");
        for(int i=0;i<state.size();i++){
            //Toast.makeText(this, snum.get(i), Toast.LENGTH_SHORT).show();
            String snaem=state.get(i);
            String sn=snum.get(i);
            helperhgetset=new Helperhgetset(snaem,sn);
            arrayList.add(helperhgetset);
        }
        helperhelp=new Helperhelp(this,arrayList);
        helpline.setAdapter(helperhelp);
        helpline.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Intent i=new Intent(Intent.ACTION_DIAL);
                i.setData(Uri.parse("tel:"+snum.get(position)));
                startActivity(i);
            }
        });
    }
}
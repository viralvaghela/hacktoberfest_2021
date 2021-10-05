package com.example.tables;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void displayTable(int num) {
        TextView TableView = (TextView) findViewById(R.id.text);
        TableView.setText(String.valueOf(num + "X" + 1 + " = " + num*1+ "\n"+
                num + " X " + 2 + " = " + num*2+ "\n"+
                num + " X " + 3 + " = " + num*3+ "\n"+
                num + " X " + 4 + " = " + num*4+ "\n"+
                num + " X " + 5 + " = " + num*5+ "\n"+
                num + " X " + 6 + " = " + num*6+ "\n"+
                num + " X " + 7 + " = " + num*7+ "\n"+
                num + " X " + 8 + " = " + num*8+ "\n"+
                num + " X " + 9 + " = " + num*9+ "\n"+
                num + " X " + 10 + " = " + num*10));
    }
    public void one(View view)
    {
        displayTable(1);
    }
    public void two(View view)
    {
        displayTable(2);
    }
    public void three(View view)
    {
        displayTable(3);
    }
    public void four(View view)
    {
        displayTable(4);
    }
    public void five(View view)
    {
        displayTable(5);
    }
    public void six(View view)
    {
        displayTable(6);
    }
    public void seven(View view)
    {
        displayTable(7);
    }
    public void eight(View view)
    {
        displayTable(8);
    }
    public void nine(View view)
    {
        displayTable(9);
    }
}

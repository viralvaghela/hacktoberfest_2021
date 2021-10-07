package com.example.todoapp;

import android.app.DatePickerDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;

import com.airbnb.lottie.LottieAnimationView;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.appbar.CollapsingToolbarLayout;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.appcompat.widget.Toolbar;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.widget.NestedScrollView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

public class ScrollingActivity extends AppCompatActivity implements DatePickerDialog.OnDateSetListener {

    static ViewGroup vg;
    static RecyclerView recycler;

    FirebaseDatabase mDatabase;
    DatabaseReference mRef;
    ChildEventListener mListener;
    HashMap<String, Task> tasksMap=new HashMap<>();
    MyAdapter newAdapter;
    private static Context context;
    public static Context getAppContext() {
        //This function is just to get the context.
        //I need to call setList() from the adapter class to refresh the recycler view
        //but getApplicationContext() and 'this' cannot be made static. And hence this function
        //the variable 'context' is assigned the context value in the on create method
        return ScrollingActivity.context;
    }

    static void deleteTask(String key){
//        mRef.child(key).removeValue();
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_scrolling);
        AppBarLayout appBar=findViewById(R.id.app_bar);
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.add_task);
        NestedScrollView sw=findViewById(R.id.scroll);
        ConstraintLayout cl=findViewById(R.id.cl);
        LottieAnimationView lv=findViewById(R.id.lv);

                new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                cl.setVisibility(View.GONE);
                lv.pauseAnimation();
                appBar.setVisibility(View.VISIBLE);
                fab.setVisibility(View.VISIBLE);
                sw.setVisibility(View.VISIBLE);
            }
        }, 2000);

        AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        CollapsingToolbarLayout toolBarLayout = (CollapsingToolbarLayout) findViewById(R.id.toolbar_layout);
        toolBarLayout.setTitle(getTitle());

        recycler=findViewById(R.id.recyclerView);
        //Assigning the context to the variable
        ScrollingActivity.context =this;
        vg=(ViewGroup) findViewById(android.R.id.content);
        mDatabase=FirebaseDatabase.getInstance();
        mRef=mDatabase.getReference().child("Tasks");
        newAdapter=new MyAdapter(getAppContext(),tasksMap);
        recycler.setLayoutManager(new LinearLayoutManager(this));
        recycler.setAdapter(newAdapter);
        mListener= new ChildEventListener() {
            @Override
            public void onChildAdded(@NonNull DataSnapshot snapshot, @Nullable String previousChildName) {
                Task newTask=snapshot.getValue(Task.class);
                tasksMap.put(snapshot.getKey(),newTask);
                newAdapter.notifyDataSetChanged();
            }

            @Override
            public void onChildChanged(@NonNull DataSnapshot snapshot, @Nullable String previousChildName) {
                tasksMap.put(snapshot.getKey(),snapshot.getValue(Task.class));
                newAdapter.notifyDataSetChanged();
            }

            @Override
            public void onChildRemoved(@NonNull DataSnapshot snapshot) {
                tasksMap.remove(snapshot.getKey());
                newAdapter.notifyDataSetChanged();
            }

            @Override
            public void onChildMoved(@NonNull DataSnapshot snapshot, @Nullable String previousChildName) {

            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        };
        mRef.addChildEventListener(mListener);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //New task input dialog is made and inflated
                AlertDialog.Builder builder = new AlertDialog.Builder(ScrollingActivity.this);
                builder.setTitle("New Task");
                View viewInflated = LayoutInflater.from(ScrollingActivity.this).inflate(R.layout.task_input,(ViewGroup) findViewById(android.R.id.content) , false);

                final EditText title_textView = (EditText) viewInflated.findViewById(R.id.title);
                final EditText description_textView = (EditText) viewInflated.findViewById(R.id.description);
                final TextView date_textView = (TextView) viewInflated.findViewById(R.id.due_date);

                DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker view, int year, int monthOfYear,
                                          int dayOfMonth) {
                        Log.i("mine","date set");

                        Calendar c=Calendar.getInstance();
                        c.set(Calendar.YEAR,year);
                        c.set(Calendar.MONTH,monthOfYear);
                        c.set(Calendar.DAY_OF_MONTH,dayOfMonth);
                        date_textView.setText(String.valueOf(dayOfMonth)+"/"+String.valueOf(monthOfYear)+"/"+String.valueOf(year));
                    }
                };

                //FAB button to inflate the date picker and set the due date
                FloatingActionButton calendar_button=viewInflated.findViewById(R.id.calendar);
                calendar_button.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Calendar c=Calendar.getInstance();
                        int this_year=c.get(Calendar.YEAR),this_month=c.get(Calendar.MONTH),this_day=c.get(Calendar.DAY_OF_MONTH);
                        DatePickerDialog datePickerDialog = new DatePickerDialog(
                                context, dateSetListener, this_year,this_month , this_day);
                        datePickerDialog.getDatePicker().setMinDate(c.getTimeInMillis());
                        datePickerDialog.show();
                        Log.i("mine","calendar opened");

                    }
                });
                builder.setView(viewInflated);
                builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //the onclick here is overridden and taken over by the dialog coming up next
                    }
                });
                builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });

                //creating a dialog of this so that the positive button can be overridden
                AlertDialog dialog=builder.create();
                dialog.show();
                //overriding the ok button so that it only closes if the title is not empty
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        String title = title_textView.getText().toString();
                        String description =description_textView.getText().toString();
                        String date=date_textView.getText().toString();
                        if(date.equals("No date set")){date="";}
                        if (title.length()!=0){
                            dialog.dismiss();
                            Toast.makeText(ScrollingActivity.this, "Task added successfully", Toast.LENGTH_SHORT).show();
                            Task task = new Task(title,description,date);
                            mRef.push().setValue(task);
                        }
                        else{
                            title_textView.setError(getString(R.string.title_blank));
                        }
                    }
                });
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_scrolling, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {

    }
}
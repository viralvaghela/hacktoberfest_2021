package com.example.note;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;

import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.bumptech.glide.Glide;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.EventListener;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.FirebaseFirestoreException;
import com.google.firebase.firestore.Query;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;
import java.util.List;

public class SingIn extends AppCompatActivity {
    GoogleSignInClient mGoogleSignInClient;
    CardView signout,filter;
    FloatingActionButton addnote;
    ImageView dp,startsearch,fil;
    TextView name,filaa,filda,filta,filtd;
    EditText search;
    String title,desc,deltit,delcont,deltime;
    CoordinatorLayout coordinatorLayout;
    RecyclerView recyclerView;
    List<Note_gettersetter> notearray;
    static FirebaseFirestore db=FirebaseFirestore.getInstance();
    CollectionReference noteref;
    static String  id;
    static int del=0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sing_in);
        signout=findViewById(R.id.signout);
        dp=findViewById(R.id.dp);
        name=findViewById(R.id.namee);
        addnote=findViewById(R.id.addnote);
        recyclerView=findViewById(R.id.notes);
        search=findViewById(R.id.searchh);
        startsearch=findViewById(R.id.startsearch);
        fil=findViewById(R.id.filterr);
        filter=findViewById(R.id.filters);
        filaa=findViewById(R.id.aphaacc);
        filda=findViewById(R.id.aphadec);
        filta=findViewById(R.id.dateacc);
        filtd=findViewById(R.id.datedec);
        coordinatorLayout=(CoordinatorLayout) findViewById(R.id.coordinte);
        Intent intent=getIntent();
        deltit=intent.getStringExtra("deltitle");
        delcont=intent.getStringExtra("delcont");
        deltime=intent.getStringExtra("date");
        if(del==1){
            del=0;
            Restore();
        }
        addnote.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                addNote();
            }
        });
        fil.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final AlertDialog.Builder builder=new AlertDialog.Builder(SingIn.this);
                builder.setTitle("Filter Notes");
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                    }
                });
                final View customLayout= getLayoutInflater().inflate(R.layout.custom_alert, null);
                builder.setView(customLayout);
                RadioGroup radioGroup=customLayout.findViewById(R.id.radiogroup);
                final AlertDialog alertDialog=builder.create();
                alertDialog.show();
                radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(RadioGroup group, int checkedId) {
                        switch (checkedId){
                            case R.id.filatoz:
                                alertDialog.dismiss();
                                FilterNote(1);
                                break;
                            case R.id.filztoa:
                                alertDialog.dismiss();
                                FilterNote(2);
                                break;
                            case R.id.fil1to31:
                                alertDialog.dismiss();
                                FilterNote(3);
                                break;
                            case R.id.fil31to1:
                                alertDialog.dismiss();
                                FilterNote(4);
                                break;

                        }
                    }
                });


            }
        });
        dp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AlertDialog.Builder builder=new AlertDialog.Builder(SingIn.this);
                builder.setTitle("Are you sure!");
                builder.setPositiveButton("SignOut", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        signOut();
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                    }
                });
                AlertDialog alertDialog=builder.create();
                alertDialog.show();
            }
        });
        GoogleSignInOptions gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
                .requestEmail()
                .build();
        mGoogleSignInClient = GoogleSignIn.getClient(this, gso);
        GoogleSignInAccount acct = GoogleSignIn.getLastSignedInAccount(this);
        if (acct != null) {
            String personName = acct.getDisplayName();
            id=acct.getId();
            Uri personPhoto = acct.getPhotoUrl();
            name.setText("Welcome "+personName+"\n Lets get start to make notes");
        }
        Glide.with(this).load("http://goo.gl/gEgYUd").into(dp);
        noteref=db.collection("Note").document(id).collection("child note");
        startsearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Search();
            }
        });

    }
    private void signOut() {
        mGoogleSignInClient.signOut()
                .addOnCompleteListener(this, new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        Toast.makeText(SingIn.this, "Signed out successfully", Toast.LENGTH_SHORT).show();
                        Intent intent=new Intent(getApplicationContext(),MainActivity.class);
                        startActivity(intent);
                        finish();
                    }
                });
    }
    public void addNote(){
        Intent intent=new Intent(this,AddNotes.class);
        intent.putExtra("id",id);
        startActivity(intent);
        finish();
    }

    @Override
    protected void onStart() {
        super.onStart();
        noteref.addSnapshotListener(this, new EventListener<QuerySnapshot>() {
            @Override
            public void onEvent(@Nullable QuerySnapshot value, @Nullable FirebaseFirestoreException error) {
                if(error!=null){
                    Toast.makeText(SingIn.this, "Error", Toast.LENGTH_SHORT).show();
                    return;
                }
                notearray=new ArrayList<>();
                for(QueryDocumentSnapshot documentSnapshot:value){
                    Note_gettersetter note=documentSnapshot.toObject(Note_gettersetter.class);
                    note.setDocumentid(documentSnapshot.getId());
                    String title=note.getTitle();
                    String desc=note.getDesc();
                   // notearray=new ArrayList<>();
                    notearray.add(note);
                    //String documentid=note.getDocumentid();
                  //  note.setDocumentid(documentid);
                }
               Notes_Adapter notesadapter=new Notes_Adapter(notearray,SingIn.this);
                recyclerView.setAdapter(notesadapter);
               // recyclerView.setLayoutManager(new GridLayoutManager(SingIn.this,2));
                StaggeredGridLayoutManager staggeredGridLayoutManager = new StaggeredGridLayoutManager(2, LinearLayoutManager.VERTICAL);
                recyclerView.setLayoutManager(staggeredGridLayoutManager);
            }
        });
    }
    public Void Search(){
        if(search.getText().toString().isEmpty()){
            Toast.makeText(this, "Nothing to Search", Toast.LENGTH_SHORT).show();
        }
        else{
            noteref.whereEqualTo("title",search.getText().toString()).get().addOnSuccessListener(new OnSuccessListener<QuerySnapshot>() {
                @Override
                public void onSuccess(QuerySnapshot queryDocumentSnapshots) {
                    notearray=new ArrayList<>();
                    for(QueryDocumentSnapshot documentSnapshot:queryDocumentSnapshots){
                        Note_gettersetter note=documentSnapshot.toObject(Note_gettersetter.class);
                        note.setDocumentid(documentSnapshot.getId());
                        String title=note.getTitle();
                        String desc=note.getDesc();
                        // notearray=new ArrayList<>();
                        notearray.add(note);
                        //String documentid=note.getDocumentid();
                        //  note.setDocumentid(documentid);
                    }
                    Notes_Adapter notesadapter=new Notes_Adapter(notearray,SingIn.this);
                    recyclerView.setAdapter(notesadapter);
                    recyclerView.setLayoutManager(new GridLayoutManager(SingIn.this,2));
                }
            });
        }
        return null;
    }
    public void FilterNote(int filtervalue){
                switch (filtervalue){
                    case 1:
                        noteref.orderBy("title", Query.Direction.ASCENDING).get().addOnSuccessListener(new OnSuccessListener<QuerySnapshot>() {
                            @Override
                            public void onSuccess(QuerySnapshot queryDocumentSnapshots) {
                                notearray=new ArrayList<>();
                                for(QueryDocumentSnapshot documentSnapshot:queryDocumentSnapshots){
                                    Note_gettersetter note=documentSnapshot.toObject(Note_gettersetter.class);
                                    note.setDocumentid(documentSnapshot.getId());
                                    String title=note.getTitle();
                                    String desc=note.getDesc();
                                    // notearray=new ArrayList<>();
                                    notearray.add(note);
                                    //String documentid=note.getDocumentid();
                                    //  note.setDocumentid(documentid);
                                }
                                Notes_Adapter notesadapter=new Notes_Adapter(notearray,SingIn.this);
                                recyclerView.setAdapter(notesadapter);
                                StaggeredGridLayoutManager staggeredGridLayoutManager = new StaggeredGridLayoutManager(2, LinearLayoutManager.VERTICAL);
                                recyclerView.setLayoutManager(staggeredGridLayoutManager);
                            }
                        });
                        filter.setVisibility(View.GONE);
                        break;
                    case 2:
                        noteref.orderBy("title", Query.Direction.DESCENDING).get().addOnSuccessListener(new OnSuccessListener<QuerySnapshot>() {
                            @Override
                            public void onSuccess(QuerySnapshot queryDocumentSnapshots) {
                                notearray=new ArrayList<>();
                                for(QueryDocumentSnapshot documentSnapshot:queryDocumentSnapshots){
                                    Note_gettersetter note=documentSnapshot.toObject(Note_gettersetter.class);
                                    note.setDocumentid(documentSnapshot.getId());
                                    String title=note.getTitle();
                                    String desc=note.getDesc();
                                    // notearray=new ArrayList<>();
                                    notearray.add(note);
                                    //String documentid=note.getDocumentid();
                                    //  note.setDocumentid(documentid);
                                }
                                Notes_Adapter notesadapter=new Notes_Adapter(notearray,SingIn.this);
                                recyclerView.setAdapter(notesadapter);
                                StaggeredGridLayoutManager staggeredGridLayoutManager = new StaggeredGridLayoutManager(2, LinearLayoutManager.VERTICAL);
                                recyclerView.setLayoutManager(staggeredGridLayoutManager);                            }
                        });
                        filter.setVisibility(View.GONE);
                        break;
                    case 3:
                        noteref.orderBy("desc", Query.Direction.ASCENDING).get().addOnSuccessListener(new OnSuccessListener<QuerySnapshot>() {
                            @Override
                            public void onSuccess(QuerySnapshot queryDocumentSnapshots) {
                                notearray=new ArrayList<>();
                                for(QueryDocumentSnapshot documentSnapshot:queryDocumentSnapshots){
                                    Note_gettersetter note=documentSnapshot.toObject(Note_gettersetter.class);
                                    note.setDocumentid(documentSnapshot.getId());
                                    String title=note.getTitle();
                                    String desc=note.getDesc();
                                    // notearray=new ArrayList<>();
                                    notearray.add(note);
                                    //String documentid=note.getDocumentid();
                                    //  note.setDocumentid(documentid);
                                }
                                Notes_Adapter notesadapter=new Notes_Adapter(notearray,SingIn.this);
                                recyclerView.setAdapter(notesadapter);
                                StaggeredGridLayoutManager staggeredGridLayoutManager = new StaggeredGridLayoutManager(2, LinearLayoutManager.VERTICAL);
                                recyclerView.setLayoutManager(staggeredGridLayoutManager);                            }
                        });
                        filter.setVisibility(View.GONE);
                        break;
                    case 4:
                        noteref.orderBy("desc", Query.Direction.DESCENDING).get().addOnSuccessListener(new OnSuccessListener<QuerySnapshot>() {
                            @Override
                            public void onSuccess(QuerySnapshot queryDocumentSnapshots) {
                                notearray=new ArrayList<>();
                                for(QueryDocumentSnapshot documentSnapshot:queryDocumentSnapshots){
                                    Note_gettersetter note=documentSnapshot.toObject(Note_gettersetter.class);
                                    note.setDocumentid(documentSnapshot.getId());
                                    String title=note.getTitle();
                                    String desc=note.getDesc();
                                    // notearray=new ArrayList<>();
                                    notearray.add(note);
                                    //String documentid=note.getDocumentid();
                                    //  note.setDocumentid(documentid);
                                }
                                Notes_Adapter notesadapter=new Notes_Adapter(notearray,SingIn.this);
                                recyclerView.setAdapter(notesadapter);
                                StaggeredGridLayoutManager staggeredGridLayoutManager = new StaggeredGridLayoutManager(2, LinearLayoutManager.VERTICAL);
                                recyclerView.setLayoutManager(staggeredGridLayoutManager);                            }
                        });
                        break;
                }

    }
    public void Restore(){
        Snackbar snackbar = Snackbar
                .make(coordinatorLayout, "Note deleted", Snackbar.LENGTH_LONG)
                .setAction("UNDO", new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Note_gettersetter note_gettersetter=new Note_gettersetter(deltit,delcont,deltime);
                        db.collection("Note").document(id).collection("child note").add(note_gettersetter);
                        Snackbar snackbar1 = Snackbar.make(coordinatorLayout, "Note restored!", Snackbar.LENGTH_SHORT);
                        snackbar1.show();
                    }
                });

        snackbar.show();

    }
}
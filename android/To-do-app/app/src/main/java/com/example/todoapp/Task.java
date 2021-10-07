package com.example.todoapp;

public class Task {
    public String title,desc,date;
    Task(String title,String desc,String date){
        this.title=title;
        this.desc=desc;
        this.date=date;
    }
    Task(){}
    String getTitle(){return title;}
    String getDesc(){return desc;}
    String getDate(){return date;}
    void setTitle(String newTitle){title=newTitle;}
    void setDesc(String newDesc){desc=newDesc;}
    void setDate(String newDate){date=newDate;}
}

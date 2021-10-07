package com.example.corona;

public class Helperhgetset {
    public Helperhgetset(){

    }
    String statename,phnumber;

    public String getStatename() {
        return statename;
    }

    public void setStatename(String statename) {
        this.statename = statename;
    }

    public String getPhnumber() {
        return phnumber;
    }

    public void setPhnumber(String phnumber) {
        this.phnumber = phnumber;
    }

    public Helperhgetset(String statename, String phnumber) {
        this.statename = statename;
        this.phnumber = phnumber;
    }
}

package com.example.corona;

public class Countrylist {
    String flag,country,death,toddeath,cases,todcases,recovered,todrecovered,active,critical;

    public Countrylist() {
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Countrylist(String flag, String country, String death, String toddeath, String cases, String todcases, String recovered, String todrecovered, String active, String critical) {
        this.flag = flag;
        this.country=country;
        this.death = death;
        this.toddeath = toddeath;
        this.cases = cases;
        this.todcases = todcases;
        this.recovered = recovered;
        this.todrecovered = todrecovered;
        this.active = active;
        this.critical = critical;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getDeath() {
        return death;
    }

    public void setDeath(String death) {
        this.death = death;
    }

    public String getToddeath() {
        return toddeath;
    }

    public void setToddeath(String toddeath) {
        this.toddeath = toddeath;
    }

    public String getCases() {
        return cases;
    }

    public void setCases(String cases) {
        this.cases = cases;
    }

    public String getTodcases() {
        return todcases;
    }

    public void setTodcases(String todcases) {
        this.todcases = todcases;
    }

    public String getRecovered() {
        return recovered;
    }

    public void setRecovered(String recovered) {
        this.recovered = recovered;
    }

    public String getTodrecovered() {
        return todrecovered;
    }

    public void setTodrecovered(String todrecovered) {
        this.todrecovered = todrecovered;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getCritical() {
        return critical;
    }

    public void setCritical(String critical) {
        this.critical = critical;
    }
}

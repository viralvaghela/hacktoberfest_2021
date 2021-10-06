package com.example.note;

import com.google.firebase.firestore.Exclude;

public class AudioLink {
    private String title;
    private String desc;
    private String documentid;
    private String datetime;
    private String url;



    public AudioLink(String title, String desc, String datetime,String url) {
        this.title = title;
        this.desc = desc;
        this.datetime=datetime;
        this.url=url;
    }
    public AudioLink() {
    }
    @Exclude
    public String getDocumentid() {
        return documentid;
    }

    public void setDocumentid(String documentid) {
        this.documentid = documentid;
    }

    public String getTitle() {
        return title;
    }

    public String getDesc() {
        return desc;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}

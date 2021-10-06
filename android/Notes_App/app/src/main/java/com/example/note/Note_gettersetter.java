package com.example.note;

import com.google.firebase.firestore.Exclude;

public class Note_gettersetter {
        private String title;
        private String desc;
        private String documentid;
        private String datetime;
        private String url;



    public Note_gettersetter(String title, String desc, String datetime) {
            this.title = title;
            this.desc = desc;
            this.datetime=datetime;
        }
        public Note_gettersetter() {
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
    @Exclude
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    }


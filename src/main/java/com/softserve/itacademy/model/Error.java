package com.softserve.itacademy.model;

public class Error {
    private String description;
    private String url;

    public Error(String description, String url){
        this.description = description;
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public String getUrl() {
        return url;
    }
}

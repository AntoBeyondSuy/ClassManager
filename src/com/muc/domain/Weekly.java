package com.muc.domain;

/**
 * Created by Kevin on 2017/3/29.
 */
public class Weekly {
    private Integer wid;
    private Integer author_id;
    private String author_name;
    private String content;
    private Integer year;
    private Integer month;
    private Integer day;

    public Integer getWid() {
        return wid;
    }
    public void setWid(Integer wid) {
        this.wid = wid;
    }

    public Integer getAuthor_id() {
        return author_id;
    }
    public void setAuthor_id(Integer author_id) {
        this.author_id = author_id;
    }

    public String getAuthor_name() {
        return author_name;
    }
    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public Integer getYear() {
        return year;
    }
    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }
    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getDay() {
        return day;
    }
    public void setDay(Integer day) {
        this.day = day;
    }
}

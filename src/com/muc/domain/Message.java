package com.muc.domain;

/**
 * Created by Kevin on 2017/2/19.
 */
public class Message
{
    private Integer mid;
    private Integer sender_id;
    private String sender_name;
    private Integer receiver_id;
    private String receiver_name;
    private String content;
    private Integer year;
    private Integer month;
    private Integer day;

    public Integer getMid() {
        return mid;
    }
    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getSender_id() {
        return sender_id;
    }
    public void setSender_id(Integer sender_id) {
        this.sender_id = sender_id;
    }

    public String getSender_name() {
        return sender_name;
    }
    public void setSender_name(String sender_name) {
        this.sender_name = sender_name;
    }

    public Integer getReceiver_id() {
        return receiver_id;
    }
    public void setReceiver_id(Integer receiver_id) {
        this.receiver_id = receiver_id;
    }

    public String getReceiver_name() {
        return receiver_name;
    }
    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
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

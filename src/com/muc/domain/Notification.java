package com.muc.domain;

/**
 * Created by Kevin on 2017/2/21.
 */
public class Notification {

    private Integer id;
    private String first_link;
    private String name;
    private String first_words;
    private String second_link;
    private String second_words;
    private Integer receiver_id;
    private Long time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirst_link() {
        return first_link;
    }

    public void setFirst_link(String first_link) {
        this.first_link = first_link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirst_words() {
        return first_words;
    }

    public void setFirst_words(String first_words) {
        this.first_words = first_words;
    }

    public String getSecond_link() {
        return second_link;
    }

    public void setSecond_link(String second_link) {
        this.second_link = second_link;
    }

    public String getSecond_words() {
        return second_words;
    }

    public void setSecond_words(String second_words) {
        this.second_words = second_words;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public Integer getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(Integer receiver_id) {
        this.receiver_id = receiver_id;
    }
}

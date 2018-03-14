package com.muc.domain;

import javax.persistence.*;

@Entity
@Table(name = "notification", schema = "class", catalog = "")
public class NotificationEntity {
    private int id;
    private String firstLink;
    private String name;
    private String firstWords;
    private String secondLink;
    private String secondWords;
    private Long time;
    private Integer receiverId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "first_link")
    public String getFirstLink() {
        return firstLink;
    }

    public void setFirstLink(String firstLink) {
        this.firstLink = firstLink;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "first_words")
    public String getFirstWords() {
        return firstWords;
    }

    public void setFirstWords(String firstWords) {
        this.firstWords = firstWords;
    }

    @Basic
    @Column(name = "second_link")
    public String getSecondLink() {
        return secondLink;
    }

    public void setSecondLink(String secondLink) {
        this.secondLink = secondLink;
    }

    @Basic
    @Column(name = "second_words")
    public String getSecondWords() {
        return secondWords;
    }

    public void setSecondWords(String secondWords) {
        this.secondWords = secondWords;
    }

    @Basic
    @Column(name = "time")
    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    @Basic
    @Column(name = "receiver_id")
    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NotificationEntity that = (NotificationEntity) o;

        if (id != that.id) return false;
        if (firstLink != null ? !firstLink.equals(that.firstLink) : that.firstLink != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (firstWords != null ? !firstWords.equals(that.firstWords) : that.firstWords != null) return false;
        if (secondLink != null ? !secondLink.equals(that.secondLink) : that.secondLink != null) return false;
        if (secondWords != null ? !secondWords.equals(that.secondWords) : that.secondWords != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (receiverId != null ? !receiverId.equals(that.receiverId) : that.receiverId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (firstLink != null ? firstLink.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (firstWords != null ? firstWords.hashCode() : 0);
        result = 31 * result + (secondLink != null ? secondLink.hashCode() : 0);
        result = 31 * result + (secondWords != null ? secondWords.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (receiverId != null ? receiverId.hashCode() : 0);
        return result;
    }
}

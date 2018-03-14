package com.muc.domain;

import javax.persistence.*;

@Entity
@Table(name = "leaveword", schema = "class", catalog = "")
public class LeavewordEntity {
    private int leaveWordsId;
    private String leaveWords;
    private int authorId;

    @Id
    @Column(name = "leaveWordsId")
    public int getLeaveWordsId() {
        return leaveWordsId;
    }

    public void setLeaveWordsId(int leaveWordsId) {
        this.leaveWordsId = leaveWordsId;
    }

    @Basic
    @Column(name = "leaveWords")
    public String getLeaveWords() {
        return leaveWords;
    }

    public void setLeaveWords(String leaveWords) {
        this.leaveWords = leaveWords;
    }

    @Basic
    @Column(name = "authorId")
    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LeavewordEntity that = (LeavewordEntity) o;

        if (leaveWordsId != that.leaveWordsId) return false;
        if (authorId != that.authorId) return false;
        if (leaveWords != null ? !leaveWords.equals(that.leaveWords) : that.leaveWords != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = leaveWordsId;
        result = 31 * result + (leaveWords != null ? leaveWords.hashCode() : 0);
        result = 31 * result + authorId;
        return result;
    }
}

package com.muc.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Kevin on 2017/2/4.
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String student_id;
    private String grade;
    private String student_group;
    private String email;
    private String phone_number;
    private String last_login;

    private Set<Task> setTask = new HashSet<Task>();

    public Set<Task> getSetTask() {
        return setTask;
    }
    public void setSetTask(Set<Task> setTask) {
        this.setTask = setTask;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getStudent_id() {
        return student_id;
    }
    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getGrade() {
        return grade;
    }
    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStudent_group() {
        return student_group;
    }
    public void setStudent_group(String student_group) {
        this.student_group = student_group;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getLast_login() {
        return last_login;
    }

    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }
}

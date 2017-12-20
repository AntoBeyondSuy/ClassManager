package com.muc.service;

import com.muc.domain.*;
import com.muc.web.form.LoginUser;

import java.util.List;

public interface UserService {

    boolean find(String username);
    void register(User user);
    User getUser(Integer uid);
    User login(LoginUser loginUser);

    void addTask(User user,Task task);
    List<Task> getAllTask(Integer uid);
    void editTask(User user,Task task);
    void deleteTask(User user,Task task);

    List<User> getAllUser();
    List<User> getUndergraduate();
    List<User> getGraduate();
    List<User> getAdmin();

    List<Agenda> getAllAgenda();
    void addAgenda(Agenda agenda);
    void editAgenda(Agenda agenda);
    void deleteAgenda(Agenda agenda);

    List<News> getAllNews();
    void addNews(News news);
    void deleteNews(News news);

    List<Weekly> getAllWeekly();
    void addWeekly(Weekly weekly);
    void updateWeekly(Weekly weekly);
    void deleteWeekly(Weekly weekly);

    List<Message> getAllMessage(Integer uid);
    List<Message> getAllSentMessage(Integer uid);
    void addMessage(Message message);
    void deleteMessage(Message message);
    Integer findReceiver(String name);

    void setting(User user, String password);
    void addNotification(Notification notification);
    List<Notification> getAllNotification(Integer uid);

    void addGrade();
    List<User> weeklyCheck();
}

package com.muc.dao;

import com.muc.domain.*;
import com.muc.web.form.LoginUser;

import java.util.List;

/**
 * Created by Kevin on 2017/2/3.
 */
public interface UserDao {

    User login(LoginUser loginUser);
    User getUser(Integer uid);
    void register(User user);
    boolean find(String username);

    List<Task> getAllTask(Integer uid);
    void addTask(User user,Task task);
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
    List<Message> getAllMessage(Integer uid);

    List<Weekly> getAllWeekly();
    void updateWeekly(Weekly weekly);
    void addWeekly(Weekly weekly);
    void deleteWeekly(Weekly weekly);

    List<Message> getAllSentMessage(Integer uid);
    void addMessage(Message message);
    void deleteMessage(Message message);
    Integer findReceiver(String name);

    void setting(User user);

    void addNotification(Notification notification);
    List<Notification> getAllNotification(Integer uid);

    void addGrade();
    List<User> weeklyCheck();
}

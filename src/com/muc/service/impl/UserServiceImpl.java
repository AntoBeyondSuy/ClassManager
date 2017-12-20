package com.muc.service.impl;

import com.muc.dao.UserDao;
import com.muc.domain.*;
import com.muc.service.UserService;
import com.muc.utils.ServiceUtils;
import com.muc.web.form.LoginUser;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Kevin on 2017/2/3.
 */
@Transactional
public class UserServiceImpl implements UserService {

    private UserDao userDao;
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }


    @Override
    public boolean find(String username) {
        if(userDao.find(username)) return true;
        return false;
    }

    @Override
    public void register(User user) {
        user.setPassword(ServiceUtils.md5(user.getPassword()));
        userDao.register(user);
    }

    @Override
    public User getUser(Integer uid) {
        return userDao.getUser(uid);
    }

    @Override
    public User login(LoginUser loginUser) {
        loginUser.setPassword(ServiceUtils.md5(loginUser.getPassword()));
        return userDao.login(loginUser);
    }

    @Override
    public void addTask(User user,Task task) {
        userDao.addTask(user,task);
    }

    @Override
    public void editTask(User user,Task task) {
        userDao.editTask(user,task);
    }

    @Override
    public List<Task> getAllTask(Integer uid) {
        return userDao.getAllTask(uid);
    }

    @Override
    public void deleteTask(User user,Task task) {
        userDao.deleteTask(user,task);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    @Override
    public List<User> getUndergraduate() {
        return userDao.getUndergraduate();
    }

    @Override
    public List<User> getGraduate() {
        return userDao.getGraduate();
    }

    @Override
    public List<User> getAdmin() {
        return userDao.getAdmin();
    }

    @Override
    public List<Agenda> getAllAgenda() {
        return userDao.getAllAgenda();
    }

    @Override
    public void addAgenda(Agenda agenda) {
        userDao.addAgenda(agenda);
    }

    @Override
    public void editAgenda(Agenda agenda) {
        userDao.editAgenda(agenda);
    }

    @Override
    public void deleteAgenda(Agenda agenda) {
        userDao.deleteAgenda(agenda);
    }

    @Override
    public List<News> getAllNews() {
        return userDao.getAllNews();
    }

    @Override
    public void addNews(News news) {
        userDao.addNews(news);
    }

    @Override
    public void deleteNews(News news) {
        userDao.deleteNews(news);
    }

    @Override
    public List<Weekly> getAllWeekly() {
        return userDao.getAllWeekly();
    }

    @Override
    public void addWeekly(Weekly weekly) {
        userDao.addWeekly(weekly);
    }

    @Override
    public void updateWeekly(Weekly weekly) {
        userDao.updateWeekly(weekly);
    }

    @Override
    public void deleteWeekly(Weekly weekly) {
        userDao.deleteWeekly(weekly);
    }

    @Override
    public List<Message> getAllMessage(Integer uid) {
        return userDao.getAllMessage(uid);
    }

    @Override
    public List<Message> getAllSentMessage(Integer uid) {
        return userDao.getAllSentMessage(uid);
    }

    @Override
    public void addMessage(Message message) {
        userDao.addMessage(message);
    }

    @Override
    public void deleteMessage(Message message) {
        userDao.deleteMessage(message);
    }

    @Override
    public Integer findReceiver(String name) {
        return userDao.findReceiver(name);
    }

    @Override
    public void setting(User user,String password) {
        if(!(user.getPassword()==null || user.getPassword().trim().equals("")))
            user.setPassword(ServiceUtils.md5(user.getPassword()));
        else
            user.setPassword(password);
        userDao.setting(user);
    }

    @Override
    public void addNotification(Notification notification) {
        userDao.addNotification(notification);
    }

    @Override
    public List<Notification> getAllNotification(Integer uid) {
        return userDao.getAllNotification(uid);
    }

    @Override
    public void addGrade() {
        userDao.addGrade();
    }

    @Override
    public List<User> weeklyCheck() {
        return userDao.weeklyCheck();
    }
}

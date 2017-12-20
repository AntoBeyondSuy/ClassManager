package com.muc.dao.impl;

import com.muc.dao.UserDao;
import com.muc.domain.*;
import com.muc.web.form.LoginUser;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Kevin on 2017/2/3.
 */
public class UserDaoImpl implements UserDao {

    private HibernateTemplate hibernateTemplate;
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public User login(LoginUser loginUser) {
        List<User> list = (List<User>) hibernateTemplate.find("from User where username=? and password=?", loginUser.getUsername(),loginUser.getPassword());
        if(list.size()>0) {
            User user = list.get(0);
            if(user.getLast_login() == null){
                user.setLast_login("first");
            }
            else{
                Date date = new Date();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String str = format.format(date);
                user.setLast_login(str);
            }
            hibernateTemplate.save(user);
            return user;
        }
        return null;
    }

    @Override
    public User getUser(Integer uid) {
        List<User> list = (List<User>) hibernateTemplate.find("from User where id = ? ", uid);
        if(list.size()>0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public void register(User user) {
        hibernateTemplate.save(user);
    }

    @Override
    public boolean find(String username) {
        List<User> list = (List<User>) hibernateTemplate.find("from User where username=?", username);
        if(list.size()>0) {
            return true;
        }
        return false;
    }

    @Override
    public void addTask(User user,Task task) {
        task.setUser(user);
        user.getSetTask().add(task);
        hibernateTemplate.update(user);
    }

    @Override
    public List<Task> getAllTask(Integer uid) {
        List<Task> list = (List<Task>) hibernateTemplate.find("from Task where uid =?", uid);
        return list;
    }

    @Override
    public void editTask(User user,Task task) {
        task.setUser(user);
        hibernateTemplate.update(task);
    }

    @Override
    public void deleteTask(User user,Task task) {
        for (Task task1 : user.getSetTask()) {
            if(task1.getTid().equals(task.getTid())) {
                user.getSetTask().remove(task1);
                break;
            }
        }
        hibernateTemplate.delete(task);
    }

    @Override
    public List<User> getAllUser() {
        List<User> list = (List<User>) hibernateTemplate.find("from User");
        return list;
    }

    @Override
    public List<User> getUndergraduate() {
        List<User> list = (List<User>) hibernateTemplate.find("from User where grade = ? or grade = ? or grade = ? or grade = ? ","大一","大二","大三","大四");
        return list;
    }

    @Override
    public List<User> getGraduate() {
        List<User> list = (List<User>) hibernateTemplate.find("from User where grade = ? or grade = ? or grade = ? ","研一","研二","研三");
        return list;
    }

    @Override
    public List<User> getAdmin() {
        List<User> list = (List<User>) hibernateTemplate.find("from User where grade = ?","已毕业");
        return list;
    }

    @Override
    public List<Agenda> getAllAgenda() {
        List<Agenda> list = (List<Agenda>) hibernateTemplate.find("from Agenda");
        return list;
    }

    @Override
    public void addAgenda(Agenda agenda) {
        hibernateTemplate.save(agenda);
    }

    @Override
    public void editAgenda(Agenda agenda) {
        hibernateTemplate.update(agenda);
    }

    @Override
    public void deleteAgenda(Agenda agenda) {
        hibernateTemplate.delete(agenda);
    }

    @Override
    public List<News> getAllNews() {
        List<News> list = (List<News>) hibernateTemplate.find("from News");
        return list;
    }

    @Override
    public void addNews(News news) {
        hibernateTemplate.save(news);
    }


    @Override
    public void deleteNews(News news) {
        hibernateTemplate.delete(news);
    }

    @Override
    public List<Weekly> getAllWeekly() {
        List<Weekly> list = (List<Weekly>) hibernateTemplate.find("from Weekly");
        return list;
    }

    @Override
    public void updateWeekly(Weekly weekly) {
        hibernateTemplate.update(weekly);
    }

    @Override
    public void addWeekly(Weekly weekly) {
        hibernateTemplate.save(weekly);
    }

    @Override
    public void deleteWeekly(Weekly weekly) {
        hibernateTemplate.delete(weekly);
    }

    @Override
    public List<Message> getAllMessage(Integer uid) {
        List<Message> list = (List<Message>) hibernateTemplate.find("from Message where receiver_id = ?",uid);
        return list;
    }

    @Override
    public List<Message> getAllSentMessage(Integer uid) {
        List<Message> list = (List<Message>) hibernateTemplate.find("from Message where sender_id = ?",uid);
        return list;
    }

    @Override
    public void addMessage(Message message) {
        hibernateTemplate.save(message);
    }

    @Override
    public void deleteMessage(Message message) {
        hibernateTemplate.delete(message);
    }

    @Override
    public Integer findReceiver(String name) {
        List<User> list = (List<User>) hibernateTemplate.find("from User where name=?", name);
        if(list.size()>0) {
            return list.get(0).getId();
        }
        return null;
    }

    @Override
    public void setting(User user) {
        hibernateTemplate.update(user);
    }

    @Override
    public void addNotification(Notification notification) {
        hibernateTemplate.save(notification);
    }

    @Override
    public List<Notification> getAllNotification(Integer uid) {
        List<Notification> list = (List<Notification>) hibernateTemplate.find("from Notification where receiver_id = ? or receiver_id = ?",0,uid);
        return list;
    }

    @Override
    public void addGrade() {

    }

    @Override
   public List<User> weeklyCheck() {
       List<User> list = (List<User>) hibernateTemplate.find("from User");
       List<User> users = (List<User>) hibernateTemplate.find("from User");
       List<Weekly> weeklies = (List<Weekly>) hibernateTemplate.find("from Weekly");
        Collections.reverse(weeklies);
        Calendar now = Calendar.getInstance();
        Calendar cal = Calendar.getInstance();
        for (Weekly weekly : weeklies) {
            cal.set(weekly.getYear(),weekly.getMonth()-1,weekly.getDay());
            if((now.getTimeInMillis()-cal.getTimeInMillis())/(1000*60*60*24)>7) break;
            for(User user : list)
            {
                if(weekly.getAuthor_id()==user.getId()) users.remove(user);
            }
        }
       return users;
    }
}

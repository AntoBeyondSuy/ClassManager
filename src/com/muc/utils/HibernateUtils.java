package com.muc.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Created by Kevin on 2017/2/4.
 */
public class HibernateUtils {
    static Configuration cfg = null;
    static SessionFactory sessionFactory = null;
    //静态代码块实现
    static {
        //加载核心配置文件
        cfg = new Configuration().configure();
        sessionFactory = cfg.buildSessionFactory();
    }

    public static Session getSessionobject() {
        return sessionFactory.getCurrentSession();
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void main(String[] args) {

    }
}


package com.learn.mavenproject2.dao;

import com.learn.mavenproject2.entities.User;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class UserDao {
 private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // xuat nguoi dung tu email va password
    
    public User getUserbyEmailAndPassword(String email, String password){
        User user = null;
        try{
            String query= "from User where userEmail =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();
            session.close();
                    
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}

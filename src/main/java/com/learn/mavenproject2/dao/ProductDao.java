package com.learn.mavenproject2.dao;

import com.learn.mavenproject2.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f =false;
        try{
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
            f=false;
        }
        return f;
    }
}

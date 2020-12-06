package com.learn.mavenproject2.dao;

import com.learn.mavenproject2.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
    public List<Product> getAllProducts(){
        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    
    public List<Product> getAllProductsById(int cid){
        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Product as p where p.category.categoryID =: id");
        query .setParameter("id",cid);
        List<Product> list = query.list();
        return list;
    }
}

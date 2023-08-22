/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository.impl;

import com.hmh.pojo.TaiKhoan;
import com.hmh.repository.QuanLyTaiKhoanRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Asus
 */
@Repository
@Transactional
public class QuanLyTaiKhoanRepositoryImpl implements QuanLyTaiKhoanRepository {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<TaiKhoan> getTaiKhoanAdmin(String username) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TaiKhoan> query = builder.createQuery(TaiKhoan.class);
        Root root = query.from(TaiKhoan.class);
        query = query.select(root);

//        String kw  = 
//        if (!username.isEmpty()) {
//            Predicate p = builder.equal(root.get("taiKhoan").as(String.class), username.trim());
//            query = query.where(p);
//        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean themTaiKhoan(TaiKhoan tk) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (tk.getIdTk() == null) {
                session.save(tk);
            } else {
                session.update(tk);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }

    }

    @Override
    public TaiKhoan getTaiKhoanById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        return session.get(TaiKhoan.class, id);
    }

    @Override
    public boolean xoaTaiKhoan(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        TaiKhoan tk = this.getTaiKhoanById(id);
        try {
            session.delete(tk);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<TaiKhoan> timKiemTK(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TaiKhoan> query = builder.createQuery(TaiKhoan.class);
        Root root = query.from(TaiKhoan.class);
        query = query.select(root);

        if (params != null) {
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p1 = builder.like(root.get("hoTen"), String.format("%%%s%%", kw));
                query.where(p1);
            }
        }
        
//        query.orderBy(builder.desc(root.get("idTk")));

        Query q = session.createQuery(query);
        return q.getResultList();
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository.impl;

import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.PhieuKhamBenh;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.hmh.repository.ThongKeBenhNhanRepository;

/**
 *
 * @author LENOVO
 */
@Repository
@Transactional
public class ThongKeBenhNhanRepositoryImpl implements ThongKeBenhNhanRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Integer> demBenhNhan() {
        List<Integer> thang = new ArrayList<>();
        try {
            Session session = this.factory.getObject().getCurrentSession();
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Tuple> query = builder.createTupleQuery();
            Root<PhieuDangKy> root = query.from(PhieuDangKy.class);
            CriteriaQuery<PhieuDangKy> q = builder.createQuery(PhieuDangKy.class);
            query.multiselect(builder.function("MONTH", Integer.class, root.get("chonNgaykham")).alias("month"), builder.count(root).alias("count"));
            query.groupBy(builder.function("MONTH", Integer.class, root.get("chonNgaykham")));
            TypedQuery<Tuple> typedQuery = session.createQuery(query);
            List<Tuple> results = typedQuery.getResultList();

            for (int month = 1; month <= 12; month++) {
                boolean timThang = false;
                for (Tuple result : results) {
                    Integer resultMonth = result.get("month", Integer.class);
                    if (resultMonth != null && resultMonth.equals(month)) {
                        Long count = result.get("count", Long.class);
                        thang.add(count.intValue());
                        timThang = true;
                        break;
                    }
                }
                if(!timThang)
                {
                    thang.add(0);
                }
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }

        return thang;
    }

    @Override
    public List<PhieuDangKy> loadDS(int year, int month) {
        Session s = this.factory.getObject().getCurrentSession();
        
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<PhieuDangKy> query = builder.createQuery(PhieuDangKy.class);
        Root root = query.from(PhieuDangKy.class);
        
        
        Predicate yearPre = builder.equal(builder.function("YEAR", Integer.class, root.get("chonNgaykham")), year);
        Predicate monthPre = builder.equal(builder.function("MONTH", Integer.class, root.get("chonNgaykham")), month);
        

        query = query.select(root).where(builder.and(yearPre, monthPre));
        Query q = s.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<PhieuDangKy> loadDsTheoQuy(int nam, int quy) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<PhieuDangKy> query = builder.createQuery(PhieuDangKy.class);
        Root root = query.from(PhieuDangKy.class);
        
        int startMonth = (quy -1)*3+1;
        int endMonth = startMonth + 2;
        
        Predicate yearPre = builder.equal(builder.function("YEAR", Integer.class, root.get("chonNgaykham")), nam);
        Predicate monthPre = builder.between(builder.function("MONTH", Integer.class, root.get("chonNgaykham")), startMonth, endMonth);
        
        query = query.select(root).where(builder.and(yearPre, monthPre));
        Query q = session.createQuery(query);
        return q.getResultList();
         }
    
    
    

}

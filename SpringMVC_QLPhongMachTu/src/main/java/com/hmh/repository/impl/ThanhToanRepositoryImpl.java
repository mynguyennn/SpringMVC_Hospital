/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository.impl;

import com.hmh.pojo.HoaDon;
import com.hmh.pojo.LoaiThanhToan;
import com.hmh.repository.ThanhToanRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Asus
 */
@Repository
@Transactional
public class ThanhToanRepositoryImpl implements ThanhToanRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactoryBean;

    @Override
    public List<HoaDon> getHoaDon(Map<String, String> params) {
        Session s = this.sessionFactoryBean.getObject().getCurrentSession();
        Query q = s.createQuery("From HoaDon");

        return q.getResultList();
    }

    @Override
    public List<LoaiThanhToan> getLoaiThanhToan(Map<String, String> params) {
        Session s = this.sessionFactoryBean.getObject().getCurrentSession();
        Query q = s.createQuery("From LoaiThanhToan");

        return q.getResultList();
    }

}

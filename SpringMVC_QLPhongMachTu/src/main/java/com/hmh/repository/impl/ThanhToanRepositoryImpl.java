/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository.impl;

import com.hmh.pojo.ChiTietThuoc;
import com.hmh.pojo.HoaDon;
import com.hmh.pojo.PhieuDangKy;
import com.hmh.repository.ThanhToanRepository;
import com.hmh.service.ThanhToanService;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.HibernateException;
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

    @Autowired
    private ThanhToanService thanhToanService;

    @Override
    public List<HoaDon> getHoaDon(Map<String, String> params) {
        Session s = this.sessionFactoryBean.getObject().getCurrentSession();
        Query q = s.createQuery("From HoaDon");

        return q.getResultList();
    }


    @Override
    public HoaDon getHoaDonById(int id) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        return session.get(HoaDon.class, id);
    }

    @Override
    public boolean xacNhanHD(int idHd) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
//        HoaDon hd = session.get(HoaDon.class, idHd);

        HoaDon hd = this.thanhToanService.getHoaDonById(idHd);
        
//        LoaiThanhToan ltt =
        
        java.util.Date currentDate = new java.util.Date();

        Timestamp timestamp = new Timestamp(currentDate.getTime());

        try {
            if (hd.getIdHoadon() == null) {
                session.save(hd);
            } else {
//                hd.setLoaiThanhToan(loaiThanhToan);
                hd.setNgayThanhToan(timestamp);
                session.update(hd);
            }

            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

}

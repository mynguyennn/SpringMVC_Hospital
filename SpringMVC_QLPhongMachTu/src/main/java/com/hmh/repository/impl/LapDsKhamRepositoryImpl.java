/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository.impl;

import com.hmh.pojo.DichVu;
import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.TaiKhoan;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.hmh.repository.LapDsKhamRepository;
import com.hmh.repository.UserRoleRepository;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;

/**
 *
 * @author Asus
 */
@Repository
@Transactional
public class LapDsKhamRepositoryImpl implements LapDsKhamRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<PhieuDangKy> getPhieuDangKy(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From PhieuDangKy");

        return q.getResultList();
    }

    @Override
    public List<TaiKhoan> getBacSi() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From TaiKhoan Where idRole=2");

        return q.getResultList();
    }

    @Override
    public Boolean trangThai(int id, TaiKhoan tk) {
        Session session = this.factory.getObject().getCurrentSession();
        PhieuDangKy pdk = session.get(PhieuDangKy.class, id);
        try {
            if (pdk.getTrangThaidky() == 1) {
                pdk.setTrangThaidky((short) 0);
                pdk.setIdYt(null);
                pdk.setIdBs(null);
            } else {
                pdk.setTrangThaidky((short) 1);
                pdk.setIdYt(tk);
                pdk.setIdBs(tk);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean themPhieuDangKy(PhieuDangKy pdk) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            session.save(pdk);
            return true;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        }
        return false;
    }

    @Override
    public TaiKhoan getIdBacSi(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TaiKhoan> query = builder.createQuery(TaiKhoan.class);
        Root<TaiKhoan> root = query.from(TaiKhoan.class);
        query.where(
                builder.and(
                        builder.equal(root.get("idTk"), id))
        );
        Query q = session.createQuery(query);
        List<TaiKhoan> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

    @Override
    public List<PhieuDangKy> timKiemPDK(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<PhieuDangKy> query = builder.createQuery(PhieuDangKy.class);
        Root<PhieuDangKy> root = query.from(PhieuDangKy.class);
        query = query.select(root);

        if (params != null) {
            String kwDate = params.get("kwDate");
            if (kwDate != null && !kwDate.isEmpty()) {
                Date date = Date.valueOf(kwDate); // Chuyển ngày thành kiểu Date
                Predicate p1 = builder.equal(root.get("chonNgaykham"), date);
                query.where(p1);
            }
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public PhieuDangKy getPhieuDangKyById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<PhieuDangKy> query = builder.createQuery(PhieuDangKy.class);
        Root<PhieuDangKy> root = query.from(PhieuDangKy.class);
        query.where(builder.equal(root.get("idPhieudk"), id));
        Query q = session.createQuery(query);
        List<PhieuDangKy> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

    @Override
    public boolean themVaCapNhat(PhieuDangKy pdk) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (pdk.getIdPhieudk() == null) {
                session.save(pdk);
                return true;
            } else {
                session.update(pdk);
                if (pdk.getTrangThaidky() != null && pdk.getTrangThaidky() == 1) {
                    pdk.setTrangThaidky((short) 0);
                    pdk.setIdYt(null);
                    pdk.setIdBs(null);
                } else {
                    pdk.setTrangThaidky((short) 1);
                }
                return true;
            }

        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}

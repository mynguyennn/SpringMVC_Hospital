/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository.impl;

import com.hmh.pojo.HoaDon;
import com.hmh.repository.ThongKeDoanhThuRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class ThongKeDoanhThuRepositoryImpl implements ThongKeDoanhThuRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<HoaDon> loadHoaDon(int year, int month) {
        Session s = this.factory.getObject().getCurrentSession();

        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<HoaDon> query = builder.createQuery(HoaDon.class);
        Root<HoaDon> root = query.from(HoaDon.class);

        Predicate yearPre = builder.equal(builder.function("YEAR", Integer.class, root.get("ngayThanhToan")), year);
        Predicate monthPre = builder.equal(builder.function("MONTH", Integer.class, root.get("ngayThanhToan")), month);

        query = query.select(root).where(builder.and(yearPre, monthPre));
        Query q = s.createQuery(query);

        List<HoaDon> hoaDonList = q.getResultList();

        return hoaDonList;
    }
}

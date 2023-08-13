package com.hmh.pojo;

import com.hmh.pojo.HoaDon;
import com.hmh.pojo.PhieuKhamBenh;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-13T11:55:34")
@StaticMetamodel(PhieuDangKy.class)
public class PhieuDangKy_ { 

    public static volatile SingularAttribute<PhieuDangKy, Date> ngayHkham;
    public static volatile SingularAttribute<PhieuDangKy, Integer> idPhieudk;
    public static volatile SingularAttribute<PhieuDangKy, Integer> idBn;
    public static volatile SingularAttribute<PhieuDangKy, Integer> idYt;
    public static volatile SingularAttribute<PhieuDangKy, PhieuKhamBenh> idPk;
    public static volatile SingularAttribute<PhieuDangKy, Short> trangThaidky;
    public static volatile SetAttribute<PhieuDangKy, HoaDon> hoaDonSet;
    public static volatile SingularAttribute<PhieuDangKy, Integer> idBs;
    public static volatile SingularAttribute<PhieuDangKy, Date> ngayDky;

}
package com.hmh.pojo;

import com.hmh.pojo.ChiTietThuoc;
import com.hmh.pojo.PhieuDangKy;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(PhieuKhamBenh.class)
public class PhieuKhamBenh_ { 

    public static volatile SetAttribute<PhieuKhamBenh, ChiTietThuoc> chiTietThuocSet;
    public static volatile SingularAttribute<PhieuKhamBenh, String> trieuChung;
    public static volatile SetAttribute<PhieuKhamBenh, PhieuDangKy> phieuDangKySet;
    public static volatile SingularAttribute<PhieuKhamBenh, Integer> idPhieukham;
    public static volatile SingularAttribute<PhieuKhamBenh, String> ketLuan;
    public static volatile SingularAttribute<PhieuKhamBenh, Date> ngayKhamBenh;

}
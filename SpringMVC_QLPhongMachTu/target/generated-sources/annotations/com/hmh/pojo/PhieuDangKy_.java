package com.hmh.pojo;

import com.hmh.pojo.ChiTietDv;
import com.hmh.pojo.HoaDon;
import com.hmh.pojo.PhieuKhamBenh;
import com.hmh.pojo.TaiKhoan;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(PhieuDangKy.class)
public class PhieuDangKy_ { 

    public static volatile SingularAttribute<PhieuDangKy, Date> chonNgaykham;
    public static volatile SingularAttribute<PhieuDangKy, Integer> idPhieudk;
    public static volatile SingularAttribute<PhieuDangKy, TaiKhoan> idBn;
    public static volatile SingularAttribute<PhieuDangKy, PhieuKhamBenh> idPk;
    public static volatile SingularAttribute<PhieuDangKy, TaiKhoan> idYt;
    public static volatile SingularAttribute<PhieuDangKy, Short> trangThaidky;
    public static volatile SingularAttribute<PhieuDangKy, String> thoiGianKham;
    public static volatile SetAttribute<PhieuDangKy, HoaDon> hoaDonSet;
    public static volatile SingularAttribute<PhieuDangKy, TaiKhoan> idBs;
    public static volatile SetAttribute<PhieuDangKy, ChiTietDv> chiTietDvSet;

}
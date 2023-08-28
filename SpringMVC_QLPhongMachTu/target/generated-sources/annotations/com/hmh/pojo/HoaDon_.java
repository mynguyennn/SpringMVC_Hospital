package com.hmh.pojo;

import com.hmh.pojo.PhieuDangKy;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-27T00:44:05")
@StaticMetamodel(HoaDon.class)
public class HoaDon_ { 

    public static volatile SingularAttribute<HoaDon, String> loaiThanhToan;
    public static volatile SingularAttribute<HoaDon, Integer> idHoadon;
    public static volatile SingularAttribute<HoaDon, Long> tienKham;
    public static volatile SingularAttribute<HoaDon, Date> ngayThanhToan;
    public static volatile SingularAttribute<HoaDon, Long> tienThuoc;
    public static volatile SingularAttribute<HoaDon, PhieuDangKy> idPhieudky;

}
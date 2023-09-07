package com.hmh.pojo;

import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.TienKham;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(HoaDon.class)
public class HoaDon_ { 

    public static volatile SingularAttribute<HoaDon, Integer> idHoadon;
    public static volatile SingularAttribute<HoaDon, TienKham> tienKham;
    public static volatile SingularAttribute<HoaDon, Date> ngayThanhToan;
    public static volatile SingularAttribute<HoaDon, Long> tienDv;
    public static volatile SingularAttribute<HoaDon, Long> tienThuoc;
    public static volatile SingularAttribute<HoaDon, PhieuDangKy> idPhieudky;

}
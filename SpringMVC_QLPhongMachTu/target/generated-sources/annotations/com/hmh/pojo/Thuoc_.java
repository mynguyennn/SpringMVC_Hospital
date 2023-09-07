package com.hmh.pojo;

import com.hmh.pojo.ChiTietThuoc;
import com.hmh.pojo.DonviThuoc;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(Thuoc.class)
public class Thuoc_ { 

    public static volatile SingularAttribute<Thuoc, DonviThuoc> donVi;
    public static volatile SetAttribute<Thuoc, ChiTietThuoc> chiTietThuocSet;
    public static volatile SingularAttribute<Thuoc, Long> giaThuoc;
    public static volatile SingularAttribute<Thuoc, Integer> idThuoc;
    public static volatile SingularAttribute<Thuoc, String> xuatXu;
    public static volatile SingularAttribute<Thuoc, String> tenThuoc;
    public static volatile SingularAttribute<Thuoc, Integer> soLuong;

}
package com.hmh.pojo;

import com.hmh.pojo.ChiTietThuoc;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-30T14:32:20")
@StaticMetamodel(Thuoc.class)
public class Thuoc_ { 

    public static volatile SingularAttribute<Thuoc, String> donVi;
    public static volatile SetAttribute<Thuoc, ChiTietThuoc> chiTietThuocSet;
    public static volatile SingularAttribute<Thuoc, Long> giaThuoc;
    public static volatile SingularAttribute<Thuoc, Integer> idThuoc;
    public static volatile SingularAttribute<Thuoc, String> xuatXu;
    public static volatile SingularAttribute<Thuoc, String> tenThuoc;
    public static volatile SingularAttribute<Thuoc, Integer> soLuong;

}
package com.hmh.pojo;

import com.hmh.pojo.PhieuKhamBenh;
import com.hmh.pojo.Thuoc;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(ChiTietThuoc.class)
public class ChiTietThuoc_ { 

    public static volatile SingularAttribute<ChiTietThuoc, Integer> soLuongSd;
    public static volatile SingularAttribute<ChiTietThuoc, Thuoc> idThuoc;
    public static volatile SingularAttribute<ChiTietThuoc, Integer> idChitietThuoc;
    public static volatile SingularAttribute<ChiTietThuoc, PhieuKhamBenh> idPhieukham;
    public static volatile SingularAttribute<ChiTietThuoc, String> hdsd;

}
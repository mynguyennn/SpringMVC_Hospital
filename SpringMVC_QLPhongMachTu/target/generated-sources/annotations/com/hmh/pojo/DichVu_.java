package com.hmh.pojo;

import com.hmh.pojo.ChiTietDv;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(DichVu.class)
public class DichVu_ { 

    public static volatile SingularAttribute<DichVu, Integer> idDv;
    public static volatile SingularAttribute<DichVu, String> tenDv;
    public static volatile SingularAttribute<DichVu, Long> giaDv;
    public static volatile SetAttribute<DichVu, ChiTietDv> chiTietDvSet;

}
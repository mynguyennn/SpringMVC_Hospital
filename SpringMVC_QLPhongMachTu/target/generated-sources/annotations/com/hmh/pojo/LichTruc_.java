package com.hmh.pojo;

import com.hmh.pojo.ChiTietLichTruc;
import com.hmh.pojo.TaiKhoan;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-04T17:35:42")
@StaticMetamodel(LichTruc.class)
public class LichTruc_ { 

    public static volatile SingularAttribute<LichTruc, Integer> idlichTruc;
    public static volatile SingularAttribute<LichTruc, TaiKhoan> idTk;
    public static volatile SingularAttribute<LichTruc, Short> trangThaitruc;
    public static volatile SetAttribute<LichTruc, ChiTietLichTruc> chiTietLichTrucSet;

}
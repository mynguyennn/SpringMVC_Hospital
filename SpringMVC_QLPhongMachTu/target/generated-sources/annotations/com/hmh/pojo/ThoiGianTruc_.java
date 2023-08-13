package com.hmh.pojo;

import com.hmh.pojo.ChiTietLichTruc;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-13T11:55:34")
@StaticMetamodel(ThoiGianTruc.class)
public class ThoiGianTruc_ { 

    public static volatile SingularAttribute<ThoiGianTruc, Date> ketThuc;
    public static volatile SingularAttribute<ThoiGianTruc, Date> batDau;
    public static volatile SingularAttribute<ThoiGianTruc, Integer> idtgTruc;
    public static volatile SingularAttribute<ThoiGianTruc, String> buoiTruc;
    public static volatile SetAttribute<ThoiGianTruc, ChiTietLichTruc> chiTietLichTrucSet;

}
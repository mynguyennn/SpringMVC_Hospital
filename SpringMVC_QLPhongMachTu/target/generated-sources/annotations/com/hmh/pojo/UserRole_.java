package com.hmh.pojo;

import com.hmh.pojo.TaiKhoan;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-08T03:18:44")
@StaticMetamodel(UserRole.class)
public class UserRole_ { 

    public static volatile SingularAttribute<UserRole, Integer> idRole;
    public static volatile SetAttribute<UserRole, TaiKhoan> taiKhoanSet;
    public static volatile SingularAttribute<UserRole, String> chucVu;

}
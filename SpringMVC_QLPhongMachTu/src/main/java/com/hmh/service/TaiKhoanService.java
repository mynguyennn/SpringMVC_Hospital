/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service;

import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.UserRole;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author Asus
 */
public interface TaiKhoanService extends UserDetailsService {
    boolean addTaiKhoan(TaiKhoan tk);
    List<TaiKhoan> getTaiKhoan(String username);
    UserRole getRoleBenhNhan(String role);
}

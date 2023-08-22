/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.UserRole;
import com.hmh.repository.TaiKhoanRepository;
import com.hmh.service.TaiKhoanService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 */
@Service("userDetailsService")
public class TaiKhoanServiceImpl implements TaiKhoanService {

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public boolean addTaiKhoan(TaiKhoan tk) {
        String pass = tk.getMatKhau();
        if (tk.getIdTk() == null) {
            tk.setMatKhau(this.passwordEncoder.encode(pass));
        }
        tk.setIdRole(this.getRoleBenhNhan("ROLE_BENHNHAN"));

        if (!tk.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(tk.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                tk.setAvt(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(TaiKhoanServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.taiKhoanRepository.addTaiKhoan(tk);
    }

    @Override
    public List<TaiKhoan> getTaiKhoan(String username) {
        return this.taiKhoanRepository.getTaiKhoan(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<TaiKhoan> users = this.getTaiKhoan(username);
        TaiKhoan user = users.get(0);
        if (users.isEmpty()) {
            throw new UsernameNotFoundException("Tài khoản không tồn tại!");
        }

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(user.getIdRole().getChucVu()));

        return new org.springframework.security.core.userdetails.User(user.getTaiKhoan(), user.getMatKhau(), authorities);

    }

    @Override
    public UserRole getRoleBenhNhan(String role) {
        return this.taiKhoanRepository.getRoleBenhNhan(role);
    }

    @Override
    public TaiKhoan getTaiKhoanById(int id) {
        return this.taiKhoanRepository.getTaiKhoanById(id);
    }

    @Override
    public TaiKhoan getTaiKhoanByUsername(String username) {
        return this.taiKhoanRepository.getTaiKhoanByUsername(username);
    }

    @Override
    public boolean doiMatKhau(int idTk, String matKhauMoi, String matKhauHienTai) {
        return taiKhoanRepository.doiMatKhau(idTk, matKhauMoi, matKhauHienTai);

    }

}

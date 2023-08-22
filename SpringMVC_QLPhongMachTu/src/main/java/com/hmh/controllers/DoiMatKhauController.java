/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.TaiKhoan;
import com.hmh.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Asus
 */
@Controller
public class DoiMatKhauController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @RequestMapping("/doimatkhau")
    public String doimatkhau(Model model, Authentication authentication) {
        model.addAttribute("updatepass", new TaiKhoan());

        if (authentication != null) {
            UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
            model.addAttribute("user", u);
        }
        return "doimatkhau";
    }

    @PostMapping("/doimatkhau")
    public String doimatkhau(Model model,@ModelAttribute("updatepass") TaiKhoan currentUser,
            @RequestParam("matKhauHienTai") String matKhauHienTai,
            @RequestParam("matKhau") String matKhau,
            @RequestParam("confirmmatKhau") String confirmmatKhau) {

        String err = "";

        if (!matKhau.equals(confirmmatKhau)) {
            err = "Mat khau khong khop!";
        }

        try {
            if (taiKhoanService.doiMatKhau(currentUser.getIdTk(), matKhau, matKhauHienTai) == true);
            // Xử lý thành công: Mật khẩu đã được thay đổi
            return "redirect:/";
        } catch (RuntimeException ex) {
            err = "Mat khau hien tai khong chinh xac!";
        }
        model.addAttribute("err", err);
        return "doimatkhau";
    }
}

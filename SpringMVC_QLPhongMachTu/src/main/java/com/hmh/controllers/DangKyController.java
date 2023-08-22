/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.TaiKhoan;
import com.hmh.service.TaiKhoanService;
import java.util.Date;
import java.util.List;
import javax.validation.Valid;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Asus
 */
@Controller
public class DangKyController {

//    @Autowired
//    private Cloudinary cloudinary;
    @Autowired
    private TaiKhoanService userDetailsService;
    @Autowired
    private CustomDateEditor customDateEditor;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }

    @GetMapping("/dangky")
    public String dangky(Model model) {
        model.addAttribute("user", new TaiKhoan());
        return "dangky";
    }

    @PostMapping("/dangky")
    public String dangky(Model model, @ModelAttribute(value = "user") TaiKhoan user) {
        String errMsg = "";
        String username = user.getTaiKhoan();

        if (userDetailsService.getTaiKhoan(username).isEmpty()) {
            if (user.getMatKhau().equals(user.getConfirmmatKhau())) {
                if (this.userDetailsService.addTaiKhoan(user) == true) {
                    return "redirect:/dangnhap";
                } else {
                    errMsg = "Lỗi!!";
                }

            } else {
                errMsg = "Mật khẩu không khớp!!";
            }

        } else {
            errMsg = "Tên người dùng không hợp lệ!";
        }

        model.addAttribute("errMsg", errMsg);

        return "dangky";
    }

}

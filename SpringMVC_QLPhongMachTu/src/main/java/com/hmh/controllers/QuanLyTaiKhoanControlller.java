/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.TaiKhoan;
import com.hmh.service.QuanLyTaiKhoanService;
//import com.hmh.service.QuanLyTaiKhoanService;
import com.hmh.service.TaiKhoanService;
import com.hmh.service.UserRoleService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Asus
 */
@Controller
public class QuanLyTaiKhoanControlller {

    @Autowired
    private QuanLyTaiKhoanService quanLyTaiKhoanService;

    @Autowired
    private UserRoleService userRoleService;
    
    @Autowired
    private CustomDateEditor customDateEditor;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("user_role", this.userRoleService.getUserRole());
    }

    @GetMapping("/admin/quanlytaikhoan")
    public String quanlytaikhoan(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("addtaikhoan", new TaiKhoan());
        model.addAttribute("qltaikhoan", this.quanLyTaiKhoanService.getTaiKhoanAdmin(null));
        model.addAttribute("qltaikhoan", this.quanLyTaiKhoanService.timKiemTK(params));

        return "quanlytaikhoan";
    }

    @GetMapping("/admin/quanlytaikhoan/{id}")
    public String updateTaiKhoanAdmin(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("qltaikhoan", this.quanLyTaiKhoanService.getTaiKhoanAdmin(null));

        model.addAttribute("addtaikhoan", this.quanLyTaiKhoanService.getTaiKhoanById(id));
        return "quanlytaikhoan";
    }

    @PostMapping("/admin/quanlytaikhoan")
    public String addTaiKhoanAdmin(Model model, @ModelAttribute(value = "addtaikhoan") TaiKhoan tk) {
        String err = "";

        if (!tk.getTaiKhoan().isEmpty() && !tk.getMatKhau().isEmpty()) {
            if (this.quanLyTaiKhoanService.themTaiKhoan(tk) == true) {
                return "redirect:/admin/quanlytaikhoan";
            }
        } else {
            err = "Vui lòng nhập tài khoản hoặc mật khẩu!";
        }

        model.addAttribute("qltaikhoan", this.quanLyTaiKhoanService.getTaiKhoanAdmin(null));
        model.addAttribute("err", err);
        return "quanlytaikhoan";
    }
}

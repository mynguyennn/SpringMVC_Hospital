/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.TaiKhoan;
import com.hmh.service.BenhNhanService;
import com.hmh.service.QuanLyTaiKhoanService;
//import com.hmh.service.QuanLyTaiKhoanService;
import com.hmh.service.TaiKhoanService;
import com.hmh.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("user_role", this.userRoleService.getUserRole());
    }

    @GetMapping("/admin/quanlytaikhoan")
    public String quanlytaikhoan(Model model) {
        model.addAttribute("addtaikhoan", new TaiKhoan());
        model.addAttribute("qltaikhoan", this.quanLyTaiKhoanService.getTaiKhoanAdmin(null));
        return "quanlytaikhoan";
    }
    
    
    @GetMapping("/admin/quanlytaikhoan/{id}")
    public String updateTaiKhoanAdmin(Model model,@PathVariable(value = "id") int id) {
                model.addAttribute("qltaikhoan", this.quanLyTaiKhoanService.getTaiKhoanAdmin(null));

        model.addAttribute("addtaikhoan", this.quanLyTaiKhoanService.getTaiKhoanById(id));
        return "quanlytaikhoan";
    }
    

    @PostMapping("/admin/quanlytaikhoan")
    public String addTaiKhoanAdmin(@ModelAttribute(value = "addtaikhoan") TaiKhoan tk) {
        if (this.quanLyTaiKhoanService.themTaiKhoan(tk) == true) {
            return "redirect:/admin/quanlytaikhoan";
        }
        return "quanlytaikhoan";
    }
}

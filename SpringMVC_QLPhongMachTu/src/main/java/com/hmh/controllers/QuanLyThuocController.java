/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.Thuoc;
import com.hmh.service.QuanLyThuocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Asus
 */
@Controller
public class QuanLyThuocController {

    @Autowired
    private QuanLyThuocService quanLyThuocService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("donviThuoc", this.quanLyThuocService.getDonViThuoc());
    }

    @GetMapping("/admin/quanlythuoc")
    public String loadDSThuoc(Model model) {
        model.addAttribute("thuoc", new Thuoc());
        model.addAttribute("qlThuoc", this.quanLyThuocService.getThuoc(null));

        return "quanlythuoc";
    }

    @GetMapping("/admin/quanlythuoc/{id}")
    public String updateThuoc(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("thuoc", this.quanLyThuocService.getThuocById(id));
        model.addAttribute("qlThuoc", this.quanLyThuocService.getThuoc(null));
        return "quanlythuoc";
    }

    @PostMapping("/admin/quanlythuoc")
    public String themThuoc(Model model, @ModelAttribute(value = "thuoc") Thuoc t) {
        String err = "";
        if (!t.getTenThuoc().isEmpty()) {
            if (quanLyThuocService.themThuoc(t) == true) {
                return "redirect:/admin/quanlythuoc";
            }
        } else {
            err = "Vui lòng nhập tên thuốc!";
            model.addAttribute("qlThuoc", this.quanLyThuocService.getThuoc(null));
        }
        model.addAttribute("err", err);
        return "quanlythuoc";

    }
}

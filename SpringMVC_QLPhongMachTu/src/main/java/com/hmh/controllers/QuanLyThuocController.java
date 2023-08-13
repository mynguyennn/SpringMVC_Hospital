/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.Thuoc;
import com.hmh.service.BenhNhanService;
import com.hmh.service.QuanLyThuocService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
public class QuanLyThuocController {

    @Autowired
    private QuanLyThuocService quanLyThuocService;

    @GetMapping("/admin/quanlythuoc")
    public String loadDSThuoc(Model model) {
        model.addAttribute("thuoc", new Thuoc());
        model.addAttribute("qlThuoc", this.quanLyThuocService.getThuoc(null));
      
        return "quanlythuoc";
    }

    @GetMapping("/admin/quanlythuoc/{id}")
    public String updateThuoc(Model model,@PathVariable(value = "id") int id)
    {
        model.addAttribute("thuoc", this.quanLyThuocService.getThuocById(id));
        model.addAttribute("qlThuoc", this.quanLyThuocService.getThuoc(null));
        return "quanlythuoc";
    }
    @PostMapping("/admin/quanlythuoc")
    public String themThuoc(@ModelAttribute(value = "thuoc") Thuoc t) {
        if (quanLyThuocService.themThuoc(t) == true) {
            return "redirect:/admin/quanlythuoc";
        }
        return "quanlythuoc";
    }
    
}

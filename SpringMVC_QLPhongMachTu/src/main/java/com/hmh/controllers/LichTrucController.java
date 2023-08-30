/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.service.LichTrucService;
import com.hmh.service.QuanLyTaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author LENOVO
 */
@Controller
public class LichTrucController {
    @Autowired
    private QuanLyTaiKhoanService quanLyTaiKhoanService;
    @Autowired
    private LichTrucService lichTrucService;
    
    
    @GetMapping("/admin/lichtruc")
    public String lichTruc(Model model) {

         model.addAttribute("tk", this.lichTrucService.getTkYtaBs());
        return "lichtruc";
    }
    
    @GetMapping("/admin/lichtruc/{id}")
    public String loadLichTruc(Model model, @PathVariable(value = "id") int id)
    {
        model.addAttribute("tk", this.lichTrucService.getTkYtaBs());
        model.addAttribute("idtk", this.quanLyTaiKhoanService.getTaiKhoanById(id));
        return "lichtruc";
    }
    @PostMapping("/admin/lichtruc")
    public String layLichTruc(Model model)
    {
        
        return "lichtruc";
        
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.ChiTietThoiGianTruc;
import com.hmh.pojo.TaiKhoan;
import com.hmh.service.LichTrucService;
import com.hmh.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Asus
 */
@Controller
public class DangKyLichYTController {

    @Autowired
    private LichTrucService lichTrucService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @GetMapping("/yta/dangkylichYT")
    public String dangkylichYT(Model model, Authentication authentication) {
        return "dangkylichYT";
    }
}

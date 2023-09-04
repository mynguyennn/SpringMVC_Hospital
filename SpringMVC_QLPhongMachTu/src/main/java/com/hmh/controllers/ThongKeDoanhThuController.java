/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.HoaDon;
import com.hmh.pojo.PhieuDangKy;
import com.hmh.service.ThongKeBenhNhanService;
import com.hmh.service.ThongKeDoanhThuService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Asus
 */
@Controller
public class ThongKeDoanhThuController {

    @Autowired
    private ThongKeDoanhThuService thongKeDoanhThuService;

    @GetMapping("/admin/thongkedoanhthu")
    public String thongKeDoanhThu(Model model) {

        return "thongkedoanhthu";
    }

    @PostMapping("/admin/thongkedoanhthu")
    public String thongKeDoanhThuu(Model model, @RequestParam("year") int year, @RequestParam("month") int month, PhieuDangKy pdk) {

        //doanh thu
        List<HoaDon> hoaDonList = this.thongKeDoanhThuService.loadHoaDon(year, month);
        long totalRevenue = 0;
        for (HoaDon hoaDon : hoaDonList) {
            long revenue = hoaDon.getTienThuoc() + hoaDon.getTienDv();
            if (hoaDon.getTienKham() != null) {
                revenue += hoaDon.getTienKham().getTienKham();
            }
            totalRevenue += revenue;
        }

        model.addAttribute("totalRevenue", totalRevenue);
        model.addAttribute("hoaDonList", hoaDonList);

        return "thongkedoanhthu";
    }
}

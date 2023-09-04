/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.HoaDon;
import com.hmh.pojo.PhieuDangKy;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hmh.service.ThongKeBenhNhanService;

/**
 *
 * @author LENOVO
 */
@Controller
public class ThongKeBenhNhanController {

    @Autowired
    private ThongKeBenhNhanService thongKeService;

    @GetMapping("/admin/thongkebenhnhan")
    public String thongKeBenhNhan(Model model) {

        return "thongkebenhnhan";
    }

    @PostMapping("/admin/thongkebenhnhan")
    public String thongKeBenhNhann(Model model, @RequestParam("year") int year, @RequestParam("month") int month, PhieuDangKy pdk) {

        //benhnhan
        List<PhieuDangKy> thongKe = this.thongKeService.loadDS(year, month);
        List<PhieuDangKy> tkQuy = this.thongKeService.loadDsTheoQuy(year, month);
        int countBenhNhan = 0;
        int countTrangThaiKham = 0;
        for (PhieuDangKy thongKes : thongKe) {
            if (thongKes.getIdPk() != null) {
                countTrangThaiKham++;
            } else if (thongKes.getIdPk() == null) {
                countBenhNhan++;
            }

        }

        for (PhieuDangKy tkQuys : tkQuy) {
            if (tkQuys.getIdPk() != null) {
                countTrangThaiKham++;

            } else if (tkQuys.getIdPk() == null) {
                countBenhNhan++;
            }
        }

        model.addAttribute("countTrangThaiKham", countTrangThaiKham);
        model.addAttribute("countBenhNhan", countBenhNhan);

        return "thongkebenhnhan";
    }

}

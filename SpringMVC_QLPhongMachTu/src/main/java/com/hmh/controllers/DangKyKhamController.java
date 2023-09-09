/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.TaiKhoan;
import com.hmh.service.DangKyKhamService;

//import com.hmh.service.DangKyKhamService;
import com.hmh.service.LapDsKhamService;
import com.hmh.service.TaiKhoanService;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Asus
 */
@Controller
public class DangKyKhamController {

    @Autowired
    private TaiKhoanService taiKhoanService;

//    @Autowired
//    private DangKyKhamService dangKyKhamService;
    @Autowired
    private LapDsKhamService lapDsKhamService;

    @Autowired
    private DangKyKhamService dangKyKhamService;

    @Autowired
    private CustomDateEditor customDateEditor;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }

    @GetMapping("/benhnhan/dangkykham")
    public String dangkykham(Model model, Authentication authentication, @RequestParam(name = "err", required = false) String err) {
//        model.addAttribute("user", new TaiKhoan());
        model.addAttribute("themphieudky", new PhieuDangKy());
        UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
        TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
        model.addAttribute("user", u);

        model.addAttribute("user", this.taiKhoanService.getTaiKhoan(authentication.getName()).get(0));
//        model.addAttribute("getDV", this.dangKyKhamService.getDichVu());
        model.addAttribute("err", err);
        return "dangkykham";
    }

    @GetMapping("/benhnhan/dangkykham/{id}")
    public String getBenhNhanId(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("user", this.taiKhoanService.getTaiKhoanById(id));
        return "dangkykham";
    }

    @PostMapping("/benhnhan/dangkykham")
    public String benhNhanCapNhat(Model model,
            Authentication authentication, @ModelAttribute(value = "user") TaiKhoan tk) {

        String err = "";

        if (this.taiKhoanService.addTaiKhoan(tk) == true) {

            return "redirect:/benhnhan/dangkykham";

        } else {
            err = "Cập nhật thông tin không thành công!";
        }

        model.addAttribute("err", err);
        return "dangkykham";
    }

    @PostMapping("/benhnhan/dangkykham_pdk")
    public String benhNhanDkyKham(Model model,
            Authentication authentication, @ModelAttribute(value = "themphieudky") PhieuDangKy pdk,
            BindingResult rs, HttpSession session, @RequestParam Map<String, String> params) throws UnsupportedEncodingException {
        String err = "";
//        List<PhieuDangKy> phieuDk = this.dangKyKhamService.getPhieuById(id);
//        LocalDateTime lanDkGanNhat = (LocalDateTime) session.getAttribute("chonNgaykham");
//        LocalDateTime now = LocalDateTime.now();
        if (!rs.hasErrors()) {
//            if (lanDkGanNhat == null || lanDkGanNhat.plusHours(24).isBefore(now)) {
                if (pdk.getChonNgaykham() != null && !pdk.getThoiGianKham().isEmpty()) {
                    if (this.lapDsKhamService.themPhieuDangKy(pdk) == true) {

                        return "redirect:/benhnhan/lichsukham";

                    }
                } else {
                    err = "Vui lòng nhập đủ thông tin!";
                    return "redirect:/benhnhan/dangkykham" + "?err=" + URLEncoder.encode(err, "UTF-8");
                }
            } else {
                // Hiển thị thông báo lỗi
//                err = "Chỉ được phép đăng ký mới sau 24 giờ";
//                return "redirect:/benhnhan/dangkykham" + "?err=" + URLEncoder.encode(err, "UTF-8");
//            }

        }
        return "dangkykham";
    }

}

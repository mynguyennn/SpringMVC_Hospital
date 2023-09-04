/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.TaiKhoan;
import com.hmh.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.hmh.service.LapDsKhamService;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.SimpleMailMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
public class LapDsKhamController {

    @Autowired
    private LapDsKhamService phieuDangKyService;
    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private CustomDateEditor customDateEditor;

    @Autowired
    private JavaMailSender javaMailSender;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);

    }

    @GetMapping("/yta/lapdskham")
    public String lapdskham(Model model, Authentication authentication, @RequestParam Map<String, String> params) {
//        model.addAttribute("user", new TaiKhoan());
        model.addAttribute("themDSpdk", new PhieuDangKy());
        if (authentication != null) {
            UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
            model.addAttribute("user", u);
        }

        model.addAttribute("dskham", this.phieuDangKyService.getPhieuDangKy(params));
        model.addAttribute("dsbacsi", this.phieuDangKyService.getBacSi());
        model.addAttribute("dskham", this.phieuDangKyService.timKiemPDK(params));

        return "lapdskham";
    }

    @GetMapping("/yta/lapdskham/{id}")
    public String lapdskham(Model model, @PathVariable(value = "id") int id, @RequestParam Map<String, String> params, Authentication authentication, HttpServletRequest request) {
        if (authentication != null) {
            UserDetails userDetails = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan tk = this.taiKhoanService.getTaiKhoanByUsername(userDetails.getUsername());

            model.addAttribute("user", tk);
            model.addAttribute("dskham", this.phieuDangKyService.getPhieuDangKy(params));
        }
        model.addAttribute("themDSpdk", this.phieuDangKyService.getPhieuDangKyById(id));
        model.addAttribute("dsbacsi", this.phieuDangKyService.getBacSi());
        model.addAttribute("dskham", this.phieuDangKyService.getPhieuDangKy(params));

        return "lapdskham";
    }

    @PostMapping("/yta/lapdskham")
    public String lapdskham(Model model, @ModelAttribute(value = "themDSpdk") PhieuDangKy pdk, BindingResult rs,
            @RequestParam Map<String, String> params) throws MessagingException {

        int id = Integer.parseInt(params.get("idPhieudk"));

        PhieuDangKy p = (PhieuDangKy) this.phieuDangKyService.getPhieuDangKyById(id);

        String msg = "";
        if (!rs.hasErrors()) {
            if (this.phieuDangKyService.themVaCapNhat(pdk) == true) {

                MimeMessage message = javaMailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

                String nguoinhan = p.getIdBn().getEmail();
                String tennguoinhan = p.getIdBn().getHoTen();
//                String tenbacsi = p.getIdBs().getHoTen();
                String buoikham = pdk.getThoiGianKham();
                String ngaydikham = pdk.getChonNgaykham().toString();

                System.err.println(nguoinhan);
                helper.setTo(nguoinhan);
                helper.setSubject("LỊCH HẸN KHÁM TẠI PHÒNG MẠCH TƯ HEALTH COUCH");

                String content = "<html><body>"
                        + "<p>Xin chào, " + tennguoinhan + "! </p>"
                        + "<p>Bạn có lịch hẹn khám tại phòng mạch Health Couch vào ngày: " + ngaydikham + "</p>"
                        + "<p>Lịch khám vào buổi:  " + buoikham + ".</p>"
                        //                        + "<p>Bác sĩ khám:  " + tenbacsi + ".</p>"
                        + "<p>Rất mong bạn sẽ đến đúng hẹn!!</p>"
                        + "</body></html>";

                helper.setText(content, true);

                javaMailSender.send(message);

                return "redirect:/yta/lapdskham";
            } else {
                msg = "Xác nhận không thành công!";
            }
        } else {
            msg = "Vượt quá số lượng bệnh nhân trong ngày!";
        }

        model.addAttribute("msg", msg);
        return "lapdskham";
    }

}

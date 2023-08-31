/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import com.hmh.pojo.ChiTietThuoc;
import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.PhieuKhamBenh;
import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.Thuoc;
import com.hmh.service.CapThuocService;
import com.hmh.service.KhamBenhService;
import com.hmh.service.LapDsKhamService;
import com.hmh.service.LapPhieuKhamService;
import com.hmh.service.QuanLyThuocService;
import com.hmh.service.TaiKhoanService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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
public class CapThuocController {

    @Autowired
    private LapDsKhamService phieuDangKyService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private LapPhieuKhamService lapPhieuKhamService;

    @Autowired
    private CapThuocService capThuocService;

    @Autowired
    private KhamBenhService khamBenhService;

    @Autowired
    private QuanLyThuocService quanLyThuocService;

    @GetMapping("/bacsi/capthuoc")
    public String capthuoc(Model model, Authentication authentication, @RequestParam("idPDK") int idPDK, @RequestParam Map<String, String> params) {

        model.addAttribute("addChiTietThuoc", new ChiTietThuoc());

        model.addAttribute("listThuoc", this.capThuocService.getListThuoc(params));
        model.addAttribute("listThuoc", this.capThuocService.timKiemThuoc(params));

        if (authentication != null) {
            UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
            model.addAttribute("user", u);

        }

        model.addAttribute("listThuocByID", capThuocService.layThuocByPhieuDangKyId(idPDK));
        PhieuDangKy phieuDangKy = this.khamBenhService.getPDK(idPDK);

        model.addAttribute("idPDK", idPDK);
        model.addAttribute("idpdk", phieuDangKy);

        return "capthuoc";
    }

    @GetMapping("/bacsi/capthuoc/{id}")
    public String khamBenhByID(Model model, @PathVariable(value = "id") int id, @RequestParam Map<String, String> params, Authentication authentication) {

        model.addAttribute("addChiTietThuoc", new ChiTietThuoc());

        if (authentication != null) {
            UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
            model.addAttribute("user", u);
        }

        return "capthuoc";
    }

    @PostMapping("/bacsi/capthuoc")
    public String taoChiTietThuoc(Model model, @ModelAttribute(value = "addChiTietThuoc") ChiTietThuoc cct, @RequestParam Map<String, String> params,
            @RequestParam("idPDK") int idPDK) {

        String err = "";
        Thuoc thuoc = this.quanLyThuocService.getThuocById(cct.getIdThuoc().getIdThuoc());
        int slThuoc = thuoc.getSoLuong();
        int slBan = cct.getSoLuongSd();
        int slConLai = slThuoc - slBan;

        if (slBan > slConLai) {
            err = "Số lượng thuốc không đủ!";
            model.addAttribute("err", err);
            return "redirect:/bacsi/capthuoc?idPDK=" + idPDK;
        }

        if (this.capThuocService.themPhieuThuoc(cct, idPDK)) {

            thuoc.setSoLuong(slConLai);
            this.quanLyThuocService.themThuoc(thuoc);

            return "redirect:/bacsi/capthuoc?idPDK=" + idPDK;
        }

        return "capthuoc";
    }

    @GetMapping("/ThongTinThuoc-PDF")
    public void generatePDF(HttpServletResponse response,
            @RequestParam("idPDK") int idPDK,
            @RequestParam Map<String, String> params) throws IOException, DocumentException {

        PhieuDangKy phieuDangKy = this.khamBenhService.getPDK(idPDK);

        if (phieuDangKy != null) {
            List<ChiTietThuoc> danhSachThuoc = capThuocService.layThuocByPhieuDangKyId(idPDK);

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=ThongTinThuoc.pdf");

            OutputStream out = response.getOutputStream();

            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();
            document.add(new Paragraph("TOA THUOC PHONG MACH HEALTH COUCH\n"
                    + "\nTen benh nhan: " + phieuDangKy.getIdBn().getHoTen()
                    + "\nNgay kham: " + phieuDangKy.getChonNgaykham()
                    + "\nKet luan: " + phieuDangKy.getIdPk().getKetLuan())
            );

            for (ChiTietThuoc t : danhSachThuoc) {
                document.add(new Paragraph("\n---------------------------------------------"));
                document.add(new Paragraph("Ten thuoc: " + t.getIdThuoc().getTenThuoc()));
                document.add(new Paragraph("Gia thuoc: " + t.getIdThuoc().getGiaThuoc()));
                document.add(new Paragraph("So luong: " + t.getSoLuongSd()));
                document.add(new Paragraph("Huong dan su dung: " + t.getHdsd()));
//                document.add(new Paragraph("---------------------------------------------"));
            }
            document.close();

            out.flush();
            out.close();
        }
    }

}
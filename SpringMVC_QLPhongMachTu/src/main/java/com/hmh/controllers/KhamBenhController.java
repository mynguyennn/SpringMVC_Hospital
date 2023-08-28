/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.ChiTietDv;
import com.hmh.pojo.DichVu;
import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.PhieuKhamBenh;
import com.hmh.pojo.TaiKhoan;
import com.hmh.service.ChiTietDVService;
import com.hmh.service.KhamBenhService;
import com.hmh.service.LapDsKhamService;
import com.hmh.service.TaiKhoanService;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Asus
 */
@Controller
public class KhamBenhController {

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private LapDsKhamService phieuDangKyService;

    @Autowired
    private KhamBenhService khamBenhService;

    @Autowired
    private LapDsKhamService lapDsKhamService;

    @Autowired
    private CustomDateEditor customDateEditor;

    @Autowired
    private ChiTietDVService chiTietDVService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }

    @GetMapping("/bacsi/khambenh")
    public String khambenh(Model model, @ModelAttribute(value = "taoPKB") PhieuKhamBenh pkb, Authentication authentication, @RequestParam Map<String, String> params) {
        model.addAttribute("user", new TaiKhoan());
        model.addAttribute("taoPKB", new PhieuKhamBenh());
        model.addAttribute("dsdv", new DichVu());
        if (authentication != null) {
            UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
            model.addAttribute("user", u);
        }

        return "khambenh";
    }

    @GetMapping("/bacsi/khambenh/{id}")
    public String khamBenhByID(Model model, @PathVariable(value = "id") int id, @RequestParam Map<String, String> params, Authentication authentication,@ModelAttribute("pk") PhieuKhamBenh pk) {
        model.addAttribute("taoPKB", new PhieuKhamBenh());

        if (authentication != null) {
            UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
            TaiKhoan u = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);
            model.addAttribute("user", u);
        }

        UserDetails user = taiKhoanService.loadUserByUsername(authentication.getName());
        TaiKhoan bacSi = taiKhoanService.getTaiKhoan(user.getUsername()).get(0);

        PhieuDangKy phieuDangKy = this.khamBenhService.getPDK(id); // Lấy thông tin phiếu đăng ký
        int idBn = phieuDangKy.getIdBn().getIdTk(); // Lấy idBn từ phiếu đăng ký

        model.addAttribute("idpdk", phieuDangKy);

        model.addAttribute("pdkID", phieuDangKyService.getPhieuDangKyById(id));
        model.addAttribute("listDv", this.khamBenhService.getDichVu());
        model.addAttribute("dsdv", new DichVu());
         model.addAttribute("dsdv", new ChiTietDv());
        model.addAttribute("lichSuKham", this.khamBenhService.getLichSuKham(params, idBn));

        return "khambenh";
    }

    @PostMapping("/bacsi/khambenh")
    public String taoPhieuKham(Model model, @ModelAttribute(value = "taoPKB") PhieuKhamBenh pkb, @RequestParam Map<String, String> params,
            @RequestParam(value = "pdk") int pdk, BindingResult rs, @ModelAttribute(value = "dsdv") ChiTietDv ctDv, RedirectAttributes redirectAttributes) {
//        model.addAttribute("dsdv", new ChiTietDv());
        if (!rs.hasErrors()) {
            if (this.chiTietDVService.themVaCapNhat(ctDv, pdk) == true) {
                if(this.khamBenhService.themPhieuKhamBenh(pkb, pdk) == true )
                {
                    
                    return "redirect:/bacsi/khambenh";
                }
            }
        }

        return "khambenh";
    }
    
//    @PostMapping("/bacsi/khambenh")
//    public String taoPhieuKham(Model model, @ModelAttribute(value = "taoPKB") PhieuKhamBenh pkb, @RequestParam Map<String, String> params,
//             @RequestParam(value = "pdk") int pdk,BindingResult rs, @ModelAttribute(value = "dsdv") ChiTietDv ctDv) {
//       
//        if (!rs.hasErrors()) {
//            if (this.chiTietDVService.themVaCapNhat(ctDv, pdk) == true) {
//                return "redirect:/bacsi/khambenh";
//            }
//        }
//
//        return "khambenh";
//    }

    @GetMapping("/generate-pdf")
    public void generatePDF(HttpServletResponse response,
            @RequestParam("id") int id) throws IOException, DocumentException {

        PhieuDangKy phieuDangKy = this.khamBenhService.getPDK(id); // Lấy thông tin phiếu đăng ký

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=example.pdf");

        OutputStream out = response.getOutputStream();

        Document document = new Document();
        PdfWriter.getInstance(document, out);

        document.open();
        document.add(new Paragraph("Phieu dang ky " + phieuDangKy.getIdBn().getHoTen() + "\nNgay dang ky: " + phieuDangKy.getChonNgaykham()));
        document.close();

        out.flush();
        out.close();
    }

}

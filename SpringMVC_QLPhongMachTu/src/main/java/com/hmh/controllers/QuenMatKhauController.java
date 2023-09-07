/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.TaiKhoan;
import com.hmh.service.TaiKhoanService;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class QuenMatKhauController {

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    private Map<String, String> maXacNhanMap = new HashMap<>();

    @GetMapping("/quenmatkhau")
    public String quenmatkhau(Model model) {
        model.addAttribute("tk", new TaiKhoan());
        return "quenmatkhau";
    }

    @PostMapping("/quenmatkhau")
    public String xacNhanTK(Model model, @ModelAttribute("tk") TaiKhoan tk) throws MessagingException {
        String username = tk.getTaiKhoan();
//        System.out.println(username);
        TaiKhoan taiKhoan = this.taiKhoanService.loadUserByUsernameQuenPass(username);

        Random so = new Random();
        int s = so.nextInt(1000000);
        System.out.println(s);
        maXacNhanMap.put(username, String.valueOf(s));

        if (taiKhoan != null) {
//            model.addAttribute("email", email);
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            String nguoinhan = taiKhoan.getEmail();
            String tennguoinhan = taiKhoan.getHoTen();

            helper.setTo(nguoinhan);
            helper.setSubject("MÃ XÁC NHẬN MẬT KHẨU");

            String content = "<html><body>"
                    + "<p> Chào: " + tennguoinhan
                    + "<!/p>"
                    + "<p> Mã xác nhận của bạn là: " + String.valueOf(s)
                    + "</p>"
                    + "</body></html>";

            helper.setText(content, true);

            javaMailSender.send(message);
            return "redirect:/thaydoimatkhau/" + taiKhoan.getIdTk();
        } else {
            model.addAttribute("errMsg", "Tên tài khoản không tồn tại!");
        }

        return "quenmatkhau";
    }

    @GetMapping("/thaydoimatkhau")
    public String thayDoiMk(Model model) {
        model.addAttribute("tk", new TaiKhoan());
        return "thaydoimatkhau";
    }

    @GetMapping("/thaydoimatkhau/{id}")
    public String thayDoiMkByIdTK(Model model, @PathVariable("id") int id) {

        TaiKhoan tk = this.taiKhoanService.getTaiKhoanById(id);
        model.addAttribute("user", tk);
        return "thaydoimatkhau";
    }

    @PostMapping("/thaydoimatkhau")
    public String thayDoiMkByIdTK(Model model, @RequestParam Map<String, String> params,
            @RequestParam("maXacNhan") int maXacNhan,
            @RequestParam("matKhauMoi") String matKhauMoi,
            @RequestParam("xacNhanMatKhauMoi") String xacNhanMatKhauMoi, HttpSession session) {

        Integer id = Integer.parseInt(params.get("user"));

        TaiKhoan taiKhoan = taiKhoanService.getTaiKhoanById(id);

        String storedMaXacNhan = maXacNhanMap.get(taiKhoan.getTaiKhoan());

        int maXacNhanParse = Integer.parseInt(storedMaXacNhan);

        if (maXacNhanParse == maXacNhan) {

            if (!matKhauMoi.equals(xacNhanMatKhauMoi)) {
                session.setAttribute("quenpass", "Mật khẩu mới không khớp!");
                return "redirect:/doimatkhau";
            }
            String hashedPassword = passwordEncoder.encode(matKhauMoi);
            taiKhoan.setMatKhau(hashedPassword);

            boolean capNhatThanhCong = taiKhoanService.doiMatKhau(taiKhoan);

            if (capNhatThanhCong) {
                maXacNhanMap.remove(taiKhoan.getTaiKhoan());
                session.setAttribute("thanhcong", "Đổi mật khẩu thành công.");
                return "redirect:/";
            } else {
                session.setAttribute("quenpass", "Lỗi khi cập nhật mật khẩu.");
            }
        } else {
            session.setAttribute("quenpass", "Mã xác nhận không hợp lệ!");
        }

        return "thaydoimatkhau";
    }

}

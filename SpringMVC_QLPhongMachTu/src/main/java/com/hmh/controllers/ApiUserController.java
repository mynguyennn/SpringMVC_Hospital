/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.TaiKhoan;
import com.hmh.components.JwtService;
import com.hmh.pojo.PhieuDangKy;
import com.hmh.service.LapDsKhamService;
import com.hmh.service.TaiKhoanService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Asus
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {

    @Autowired
    private JwtService jwtService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private LapDsKhamService lapDsKhamService;

    @PostMapping("/dangnhap/")
    @CrossOrigin
    public ResponseEntity<String> dangnhap(@RequestBody TaiKhoan tk) {
        if (this.taiKhoanService.authUser(tk.getTaiKhoan(), tk.getMatKhau()) == true) {
            String token = this.jwtService.generateTokenLogin(tk.getTaiKhoan());

            return new ResponseEntity<>(token, HttpStatus.OK);
        }

        return new ResponseEntity<>("error", HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/dangky/",
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @CrossOrigin
    public ResponseEntity<TaiKhoan> addUser(@RequestParam Map<String, String> params,
            @RequestPart MultipartFile avatar) {
        TaiKhoan user = this.taiKhoanService.addUser(params, avatar);
        return new ResponseEntity<>(user, HttpStatus.CREATED);
    }

    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<TaiKhoan> chitietNguoiDung(Principal user) {
        TaiKhoan tk = this.taiKhoanService.getTaiKhoanByUsername(user.getName());
        return new ResponseEntity<>(tk, HttpStatus.OK);
    }

    @PostMapping("/doimatkhau/")
    @CrossOrigin
    public ResponseEntity<TaiKhoan> doiMatKhau(@RequestParam Map<String, String> params) {
        if (this.taiKhoanService.authUser(params.get("taiKhoan").toString(), params.get("matKhau").toString()) == true) {
            TaiKhoan a = taiKhoanService.thayDoiMatKhau(params);

            return new ResponseEntity<>(a, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.CREATED);
    }

    @PostMapping("/dangkykhamapi/")
    @CrossOrigin
    public ResponseEntity<PhieuDangKy> dangKyKham(@RequestParam Map<String, String> params,
            @RequestParam(value = "userId") int userId) {

        PhieuDangKy phieuDangKy = this.lapDsKhamService.dangKyKhamAPI(params, userId);

        return new ResponseEntity<>(phieuDangKy, HttpStatus.CREATED);
    }

}

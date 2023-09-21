/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.service.CapThuocService;
import com.hmh.service.QuanLyThuocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Asus
 */
@RestController
//@RequestMapping("/api")
public class ApiBacSiController {

    @Autowired
    private CapThuocService capThuocService;

    @DeleteMapping("/bacsi/capthuoc/{idChitietThuoc}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("idChitietThuoc") int idChitietThuoc) {
        this.capThuocService.xoaBillThuoc(idChitietThuoc);
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.service.LapDsKhamService;
import com.hmh.service.LichSuKhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Asus
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {

    @Autowired
    private LichSuKhamService lichSuKhamService;

    @DeleteMapping("/benhnhan/lichsukham/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void xoaLsPhieuDky(@PathVariable(value = "id") int id) {
        this.lichSuKhamService.xoaLsKham(id);
    }

}

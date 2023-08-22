/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service.impl;

import com.hmh.pojo.Thuoc;
import com.hmh.repository.QuanLyThuocRepository;
import com.hmh.service.QuanLyThuocService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 */
@Service
public class QuanLyThuocServiceImpl implements QuanLyThuocService {

    @Autowired
    private QuanLyThuocRepository quanLyThuocRepository;

    @Override
    public List<Thuoc> getThuoc(String name) {
        return this.quanLyThuocRepository.getThuoc(name);
    }

    @Override
    public boolean themThuoc(Thuoc thuoc) {
        return this.quanLyThuocRepository.themThuoc(thuoc);
    }

    @Override
    public Thuoc getThuocById(int id) {
        return this.quanLyThuocRepository.getThuocById(id);
    }

    @Override
    public boolean xoaThuoc(int id) {
        return this.quanLyThuocRepository.xoaThuoc(id);
    }
}

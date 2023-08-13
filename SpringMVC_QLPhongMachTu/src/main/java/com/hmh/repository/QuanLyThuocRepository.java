/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hmh.repository;

import com.hmh.pojo.Thuoc;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface QuanLyThuocRepository {
    List<Thuoc> getThuoc(String name);
    boolean themThuoc(Thuoc thuoc);
    Thuoc getThuocById(int id);
    boolean xoaThuoc(int id);
}

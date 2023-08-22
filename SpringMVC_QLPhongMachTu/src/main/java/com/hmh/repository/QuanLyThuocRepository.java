/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository;

import com.hmh.pojo.Thuoc;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface QuanLyThuocRepository {

    List<Thuoc> getThuoc(String name);

    boolean themThuoc(Thuoc thuoc);

    Thuoc getThuocById(int id);

    boolean xoaThuoc(int id);
}

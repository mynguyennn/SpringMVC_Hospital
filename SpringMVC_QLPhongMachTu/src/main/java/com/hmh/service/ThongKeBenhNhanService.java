/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hmh.service;

import com.hmh.pojo.PhieuDangKy;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface ThongKeBenhNhanService {
    List<Integer> demBenhNhan();
    
    List<PhieuDangKy> loadDS(int year, int month);
    
    List<PhieuDangKy> loadDsTheoQuy(int nam, int quy);
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.repository;

import com.hmh.pojo.HoaDon;
import com.hmh.pojo.LoaiThanhToan;
import com.hmh.pojo.PhieuDangKy;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Asus
 */
public interface ThanhToanRepository {
    public List<HoaDon> getHoaDon(Map<String, String> params);
    
    public List<LoaiThanhToan> getLoaiThanhToan(Map<String, String> params);
}

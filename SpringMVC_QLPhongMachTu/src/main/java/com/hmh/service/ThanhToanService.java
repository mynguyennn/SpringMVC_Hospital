/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service;

import com.hmh.pojo.HoaDon;
import com.hmh.pojo.LoaiThanhToan;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Asus
 */
public interface ThanhToanService {
    List<HoaDon> getHoaDon(Map<String, String> params);
    
    List<LoaiThanhToan> getLoaiThanhToan(Map<String, String> params);
}

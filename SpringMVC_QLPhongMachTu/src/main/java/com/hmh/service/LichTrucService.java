/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hmh.service;

import com.hmh.pojo.ChiTietThoiGianTruc;
import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.ThoiGianTruc;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface LichTrucService {
    List<TaiKhoan> getTkYtaBs();
    
    List<ChiTietThoiGianTruc> getChiTietTgTruc();
    
    List<ChiTietThoiGianTruc> getLich(Date fromDate);
    
    List<ThoiGianTruc> getTg();
    
     boolean addAndUpdate(ChiTietThoiGianTruc tg, TaiKhoan idTk, List<String> date, int idtgTruc);
    
}

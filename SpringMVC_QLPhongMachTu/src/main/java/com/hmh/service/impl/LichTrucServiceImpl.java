/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service.impl;

import com.hmh.pojo.ChiTietThoiGianTruc;
import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.ThoiGianTruc;
import com.hmh.repository.LichTrucRepository;
import com.hmh.service.LichTrucService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LENOVO
 */
@Service
public class LichTrucServiceImpl implements LichTrucService{
    
    @Autowired
    private LichTrucRepository lichTrucRepository;

    @Override
    public List<TaiKhoan> getTkYtaBs() {
        return this.lichTrucRepository.getTkYtaBs();
        }

    @Override
    public List<ChiTietThoiGianTruc> getChiTietTgTruc() {
        return this.lichTrucRepository.getChiTietTgTruc();
        }

    @Override
    public List<ChiTietThoiGianTruc> getLich(Date fromDate) {
        return this.lichTrucRepository.getLich(fromDate);
        }

    @Override
    public List<ThoiGianTruc> getTg() {
        return this.lichTrucRepository.getTg();
        }
    
}

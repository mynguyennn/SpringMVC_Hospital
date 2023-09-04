/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service.impl;

import com.hmh.pojo.PhieuDangKy;
import com.hmh.pojo.TaiKhoan;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hmh.repository.LapDsKhamRepository;
import com.hmh.repository.TaiKhoanRepository;
import com.hmh.service.LapDsKhamService;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

import java.util.Map;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;

/**
 *
 * @author Asus
 */
@Service
public class LapDsKhamServiceImpl implements LapDsKhamService {

    @Autowired
    private LapDsKhamRepository lapDsKhamRepository;

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Override
    public List<PhieuDangKy> getPhieuDangKy(Map<String, String> params) {
        return this.lapDsKhamRepository.getPhieuDangKy(params);
    }

    @Override
    public List<TaiKhoan> getBacSi() {
        return this.lapDsKhamRepository.getBacSi();
    }

    @Override
    public Boolean trangThai(int id, TaiKhoan tk) {
        return this.lapDsKhamRepository.trangThai(id, tk);
    }

    @Override
    public boolean themPhieuDangKy(PhieuDangKy pdk) {
        TaiKhoan tk = taiKhoanRepository.getTaiKhoan(pdk.getTenBenhNhanDky()).get(0);

//        java.util.Date currentDate = new java.util.Date();
//
//        Timestamp timestamp = new Timestamp(currentDate.getTime());
        pdk.setIdBn(tk);

//        pdk.setNgayDky(timestamp);
        pdk.setTrangThaidky((short) 0);

//        pdk.setNgayHkham(currentDate);
        return this.lapDsKhamRepository.themPhieuDangKy(pdk);
    }

    @Override
    public List<PhieuDangKy> timKiemPDK(Map<String, String> params) {
        return lapDsKhamRepository.timKiemPDK(params);
    }

    @Override
    public PhieuDangKy getPhieuDangKyById(int id) {
        return this.lapDsKhamRepository.getPhieuDangKyById(id);
    }

    @Override
    public boolean themVaCapNhat(PhieuDangKy pdk) {
        return this.lapDsKhamRepository.themVaCapNhat(pdk);
    }

//    @Override
//    public int demSoLuongXacNhanTrongNgay(LocalDate ngayHienTai) {
//        return this.lapDsKhamRepository.demSoLuongXacNhanTrongNgay(ngayHienTai);
//    }
}

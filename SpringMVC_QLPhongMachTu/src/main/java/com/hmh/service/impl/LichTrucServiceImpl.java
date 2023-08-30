/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.service.impl;

import com.hmh.pojo.TaiKhoan;
import com.hmh.repository.LichTrucRepository;
import com.hmh.service.LichTrucService;
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
    
}

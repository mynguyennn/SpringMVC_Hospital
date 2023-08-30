/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hmh.service;

import com.hmh.pojo.ChiTietDv;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public interface ChiTietDVService {
    boolean themVaCapNhat(ChiTietDv dv, int idPdk);
    List<ChiTietDv> loadDs();
}

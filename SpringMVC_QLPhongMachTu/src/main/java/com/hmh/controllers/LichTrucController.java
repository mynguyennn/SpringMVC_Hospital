/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.ChiTietThoiGianTruc;
import com.hmh.service.LichTrucService;
import com.hmh.service.QuanLyTaiKhoanService;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author LENOVO
 */
@Controller
public class LichTrucController {
    @Autowired
    private QuanLyTaiKhoanService quanLyTaiKhoanService;
    @Autowired
    private LichTrucService lichTrucService;
    
    
    @ModelAttribute
    public void getLich(Model model)
    {
         List<Date> dateList = new ArrayList<>();
         
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.add(Calendar.WEEK_OF_YEAR, 1);
        dateList.add(calendar.getTime());
        for(int i = 0; i<6; i++)
        {
            calendar.add(Calendar.DAY_OF_WEEK, 1);
            dateList.add(calendar.getTime());
           
        }
        model.addAttribute("caTruc", this.lichTrucService.getTg());
        model.addAttribute("lichtruc", new ChiTietThoiGianTruc());
        model.addAttribute("dateList", dateList);
    }
    @GetMapping("/admin/lichtruc")
    public String lichTruc(Model model) {
       
//         model.addAttribute("lich", this.lichTrucService.getLich(dateList.get(0)));
        model.addAttribute("selectedDates", new ArrayList<Date>() );
        model.addAttribute("tk", this.lichTrucService.getTkYtaBs());
        return "lichtruc" ;
    }
    
    @GetMapping("/admin/lichtruc/{id}")
    public String loadLichTruc(Model model, @PathVariable(value = "id") int id)
    {
       
        model.addAttribute("tk", this.lichTrucService.getTkYtaBs());
        model.addAttribute("idtk", this.quanLyTaiKhoanService.getTaiKhoanById(id));
        return "lichtruc";
    }
    @PostMapping("/admin/lichtruc")
    public String layLichTruc(Model model)
    {
        
        return "lichtruc";
        
    }

}

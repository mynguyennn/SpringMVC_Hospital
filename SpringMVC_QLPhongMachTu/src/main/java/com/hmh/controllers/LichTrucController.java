/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.pojo.ChiTietThoiGianTruc;
import com.hmh.pojo.TaiKhoan;
import com.hmh.pojo.ThoiGianTruc;
import com.hmh.service.LichTrucService;
import com.hmh.service.QuanLyTaiKhoanService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
    
    @Autowired
    private CustomDateEditor customDateEditor;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, customDateEditor);
    }
    
    @ModelAttribute
    public void getLich(Model model) {
        List<Date> dateList = new ArrayList<>();
        
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.add(Calendar.WEEK_OF_YEAR, 1);
        
        dateList.add(calendar.getTime());
        for (int i = 0; i < 6; i++) {
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
        model.addAttribute("selectedDates", new ArrayList<Date>());
        model.addAttribute("tk", this.lichTrucService.getTkYtaBs());
        model.addAttribute("lichtruc", new ChiTietThoiGianTruc());
        return "lichtruc";
    }
    
    @GetMapping("/admin/lichtruc/{id}")
    public String loadLichTruc(Model model, @PathVariable(value = "id") int id) {
        
        model.addAttribute("tk", this.lichTrucService.getTkYtaBs());
        model.addAttribute("idtk", this.quanLyTaiKhoanService.getTaiKhoanById(id));
        return "lichtruc";
    }
    
    @PostMapping("/admin/lichtruc")
    public String layLichTruc(Model model, @RequestParam("selectedDates") List<String> selectedDates,
            @RequestParam("caTrucId") String caTrucId, @RequestParam(value = "id") TaiKhoan id, ChiTietThoiGianTruc tg, BindingResult rs) {
        
        List<String> dates = new ArrayList<>();
        
        int idtgTruc;
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng ngày tháng
        Date parseDate =  new Date();
        
        for (String selectedDate : selectedDates) {
            String[] parts = selectedDate.split("/");
            
            if (parts.length == 4) {
                caTrucId = parts[0];
                idtgTruc = Integer.parseInt(caTrucId.toString());
                
                String year = parts[3];
                String month = parts[2];
                String day = parts[1];
                String date = year + "/" + month + "/" + day;
                
//                try {
                    
//                    parseDate = dateFormat.parse(date);
                    
                    dates.add(date);
//                } catch (ParseException e) {
//                    e.printStackTrace();
                }
             else 
            {
                return "redirect:/admin/lichtruc/" + id;
            }
//            String[] parts = selectedDate.split("-");
//            caTrucId = parts[0];
//            long dateInMillis = Long.parseLong(parts[1]);
//            Date date = new Date(dateInMillis);
            if (!rs.hasErrors()) {
                if (this.lichTrucService.addAndUpdate(tg, id, dates, idtgTruc) == true) {
                    return "redirect:/admin/lichtruc/" + id;
                }
            }
            
        }
        
        return "lichtruc";
    }
}

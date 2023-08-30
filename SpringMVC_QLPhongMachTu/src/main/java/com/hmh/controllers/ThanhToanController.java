    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.controllers;

import com.hmh.service.ThanhToanService;
import com.springmvc.dto.momoclasses.Environment;
import com.springmvc.dto.momoclasses.PaymentResponse;
import com.springmvc.enums.RequestType;
import com.springmvc.momoprocessor.CreateOrderMoMo;
import com.springmvc.share.utils.LogUtils;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Asus
 */
@Controller
public class ThanhToanController {
    
    @Autowired
    private ThanhToanService thanhToanService;
    
    @GetMapping("/yta/thanhtoan")
    public String thanhtoan(Model model, @RequestParam Map<String, String> params){
        model.addAttribute("listHÐ" , thanhToanService.getHoaDon(params));
        model.addAttribute("listLoaiTT" , thanhToanService.getLoaiThanhToan(params));
        return "thanhtoan";
    }

    @GetMapping("/thanhtoan")
    public String momoPay(@RequestBody Map<String, String> map) throws Exception {

//        map.get("idphieuKham");
        LogUtils.init();
        String requestId = String.valueOf(System.currentTimeMillis());
        String orderId = String.valueOf(System.currentTimeMillis());
        Long transId = 2L;
        long amount = 50000;
        String orderInfo = "Thanh toán hóa đơn khám ";
        String returnURL = "https://google.com.vn";
        String notifyURL = "https://google.com.vn";
        Environment environment = Environment.selectEnv("dev");
        PaymentResponse captureWalletMoMoResponse = CreateOrderMoMo.process(environment, orderId, requestId, Long.toString(amount), orderInfo, returnURL, notifyURL, "", RequestType.CAPTURE_WALLET, Boolean.TRUE);
        String url = captureWalletMoMoResponse.getPayUrl();
        return "redirect:" + url;
//
//        return "thanhtoan";
    }
}

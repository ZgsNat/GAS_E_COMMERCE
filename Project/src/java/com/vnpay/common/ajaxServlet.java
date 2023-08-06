/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vnpay.common;

import Model.Cart;
import Model.Orders;
import Model.Product;
import Model.Item;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

/**
 *
 * @author CTT VNPAY
 */
public class ajaxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //add to database System.out.println("thankyou page");
        HttpSession session = req.getSession();
        String CusID;
        String[] product = {};

        try {
            CusID = session.getAttribute("ID").toString();

        } catch (Exception e) {
            CusID = "";
            System.out.println("error 1:" + e.getMessage());
        }

        ServletContext application = getServletContext();
        product = (String[]) application.getAttribute(CusID + "product");
        System.out.println("start");
        for (String string : product) {
            System.out.println(string);
        }
        application.removeAttribute(CusID + "product");

        double total = Double.parseDouble((String) req.getParameter("total"));
        double discount = Double.parseDouble((String) req.getParameter("discount"));
        int couponid = Integer.parseInt((String) req.getParameter("discountId"));
        boolean paymentmethod = req.getParameter("payment").equals("bank");
//        System.out.println(couponid);
//        System.out.println(paymentmethod);
        String info = (String) req.getParameter("info");
        double price = (total - discount) * 110 / 100;
        application.setAttribute(CusID + "price", price);
        application.setAttribute(CusID + "couponid", couponid);
        application.setAttribute(CusID + "product", product);
        application.setAttribute(CusID + "discount", discount);
        application.setAttribute(CusID + "info", info);
//        try {
//            product = (String[]) application.getAttribute(CusID + "product");
//            total = Double.parseDouble(application.getAttribute(CusID + "price").toString());
//            discount = Double.parseDouble(application.getAttribute(CusID + "discount").toString());
//            couponid = Integer.parseInt(application.getAttribute(CusID + "couponid").toString());
////            paymentmethod = application.getAttribute(CusID + "paymentmethod").toString().equals("1");
//            info = application.getAttribute(CusID + "info").toString();
//
//        } catch (Exception e) {
//            System.out.println("error 1.2: ajax" + e.getMessage());
//        }
//        System.out.println(total + " " + discount + " " + couponid + " " + info + " " + product);
        //add to db end
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "billpayment";
        long amount = (int) price * 100;
        System.out.println(amount);
        String bankCode = "";

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");

        if (!paymentmethod) {
            System.out.println("fuck");
            application.setAttribute(CusID + "paymentmethod", "0");
            job.addProperty("data", "http://localhost:9999/SWP391_1/thankyou");
        } else {
            application.setAttribute(CusID + "paymentmethod", "1");
            job.addProperty("data", paymentUrl);
        }

        System.out.println(paymentUrl);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(job));
    }

}

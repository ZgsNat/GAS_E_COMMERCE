/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Coupon;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class CouponController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("mode"));
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.contains("4") && !mode.equals("0")) {
                if (mode.contains("1")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("general").forward(req, resp);
                } else if (mode.contains("2")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("productInfo").forward(req, resp);
                } else if (mode.contains("3")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("customerInfo").forward(req, resp);
                } else if (mode.contains("5")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("news").forward(req, resp);
                }
            } else {
                Coupon cou = new Coupon();
                List<Coupon> data = cou.getAllCoupon();
                //npp: number of coupons per page
                int cur_page = 1, npp = req.getParameter("npp") != null ? Integer.parseInt(req.getParameter("npp")) : 5;
                int max_page = (data.size() - 1) / npp + 1;
                List<Coupon> data_page = cou.getDataPage(cur_page, data, npp);
                req.setAttribute("curp", cur_page);
                req.setAttribute("maxp", max_page);
                req.setAttribute("data", data_page);
                req.setAttribute("npp", npp);

                //req.setAttribute("data", data);
                req.getRequestDispatcher("jsp/Coupon/couponList.jsp").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("loginadmin").forward(req, resp);
        }
        
    }
}

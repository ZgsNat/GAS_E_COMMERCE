/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Orders;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minhn
 */
public class generalController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Redirect if it doesn't have the permission
        HttpSession session = req.getSession();
        String mode = (String) session.getAttribute("mode");
        if (!mode.contains("1") && !mode.equals("0")) {
            if (mode.contains("2")) {
                req.setAttribute("accessError", "You don't have access to this!");
                req.getRequestDispatcher("productInfo").forward(req, resp);
            } else if (mode.contains("3")) {
                req.setAttribute("accessError", "You don't have access to this!");
                req.getRequestDispatcher("customerInfo").forward(req, resp);
            } else if (mode.contains("4")) {
                req.setAttribute("accessError", "You don't have access to this!");
                req.getRequestDispatcher("coupon_admin").forward(req, resp);
            } else if (mode.contains("5")) {
                req.setAttribute("accessError", "You don't have access to this!");
                req.getRequestDispatcher("news").forward(req, resp);
            }
        } else {
            if (req.getParameter("accessError") != null) {
                req.setAttribute("accessError", "You don't have access to this!");
            }
            Orders o = new Orders();
            //Lay thong tin ve doanh thu cua ngay tu database
            int today = o.todaySale();
            //Lay thong tin ve doanh thu cua thang tu database
            int month = o.monthlySale();
            //Lay thong tin ve doanh thu cua nam ngoai tu database
            int lastYear = o.lastYearSale();
            //Lay thong tin ve doanh thu cua nam nay tu database
            int year = o.yearSale();

            //Confiugre the money format
            String today_revenue = o.moneyconfig(today);
            String month_revenue = o.moneyconfig(month);
            String lastYear_revenue = o.moneyconfig(lastYear);
            String year_revenue = o.moneyconfig(year);

            req.setAttribute("today", today_revenue);
            req.setAttribute("month", month_revenue);
            req.setAttribute("lastYear", lastYear_revenue);
            req.setAttribute("year", year_revenue);

            //Lay du lieu ve cac Order trong database
            List<Orders> orders = new ArrayList<>();
            orders = o.getOrderListLimitted();
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("general.jsp").forward(req, resp);
        }
    }

}

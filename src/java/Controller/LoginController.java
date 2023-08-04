package Controller;

import Model.Admin;
import Model.Customer;
import Model.Orders;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author minhn
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setContentType("text/html");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            String encrypted = getEncryptedPassword(password);
            System.out.println(encrypted);
            Admin a = new Admin(email, encrypted);
            if (a.checkAdmin()) {
                //Tao session cho object Admin
                HttpSession session = req.getSession();
                session.setAttribute("id", a.getId());
                String name = a.getAdminName();
                session.setAttribute("name", name);
                String mode = a.getRole();
                session.setAttribute("mode", mode);

                if (mode.contains("1") || mode.equals("0")) {
                    Orders o = new Orders();
                    //Lay thong tin ve doanh thu cua ngay tu database
                    int today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    int month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    int lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    int year = o.yearSale();

                    //Dinh dang lai format cua tien
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
                } else if (mode.contains("2")) {
                    req.getRequestDispatcher("productInfo").forward(req, resp);
                } else if (mode.contains("3")) {
                    req.getRequestDispatcher("customerInfo").forward(req, resp);
                } else if (mode.contains("4")) {
                    req.getRequestDispatcher("coupon_admin").forward(req, resp);
                } else if (mode.contains("5")) {
                    req.getRequestDispatcher("news").forward(req, resp);
                }
            } else {
                resp.sendRedirect("loginadmin");
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Log out function
        HttpSession session = req.getSession();
        session.removeAttribute("id");
        session.removeAttribute("name");
        session.removeAttribute("mode");
        resp.sendRedirect("login.jsp");
    }

    public String getEncryptedPassword(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(input.getBytes());
        byte[] digest = md.digest();
        return DatatypeConverter.printHexBinary(digest).toUpperCase();
    }

    public boolean verifyPassword(String input, String verify) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(input.getBytes());
        byte[] digest = md.digest();
        String check = DatatypeConverter.printHexBinary(digest).toUpperCase();

        return verify.equals(check);
    }
}

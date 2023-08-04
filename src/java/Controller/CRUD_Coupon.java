/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Admin;
import Model.Category;
import Model.Coupon;
import Model.Product;
import Model.Promotion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CRUD_Coupon extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //session
        HttpSession session = req.getSession();
        int idAdmin = (int) session.getAttribute("id");
        //return data from jsp
        System.out.println(req.getAttribute("mode"));
        int id = "".equals(req.getParameter("id")) ? -1 : Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name").toUpperCase();
        String message = req.getParameter("message");
        LocalDate valid_from = LocalDate.parse(req.getParameter("startDate"));
        LocalDate valid_to = LocalDate.parse(req.getParameter("endDate"));
        System.out.println("valid_to " + valid_to);
        String value = req.getParameter("value");
        String bill_condition = "".equals(req.getParameter("bill_condition")) ? "0" : req.getParameter("bill_condition");
        String max_value = "".equals(req.getParameter("max_value")) ? "0" : req.getParameter("max_value");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        System.out.println("quantity:" + quantity);
        String[] productDiscounted = req.getParameterValues("productDiscounted");
        String[] productRequired = req.getParameterValues("productRequired");
        String[] emptyProductList = {"0"};
        int free_check = Integer.parseInt(req.getParameter("free_check"));
        System.out.println(free_check + " test check");
        if (productDiscounted == null) {
            productDiscounted = emptyProductList;
        }
        if (productRequired == null) {
            productRequired = emptyProductList;
        }
        String avatar = "";
        boolean check = false;
        try {
//                    System.out.println("image");
            Part image = req.getPart("filename");
            if (image.getSize() > 0) {
//                        System.out.println("check");
                String uploadPath = getServletContext().getRealPath("") + File.separator + "VoucherImg";
                String uploadPath1 = getServletContext().getRealPath("") + "../../web/VoucherImg";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                File uploadDir1 = new File(uploadPath1);
                if (!uploadDir1.exists()) {
                    uploadDir1.mkdir();
                }

                avatar = "image_" + System.currentTimeMillis() + ".jpg";
                image.write(uploadPath + File.separator + avatar);
                image.write(uploadPath1 + File.separator + avatar);
                check = true;
            } else {
                check = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //sua database
        Coupon c = new Coupon();
        if (req.getParameter("mod").equals("update")) {
            c.updateCoupon(id, name, message, valid_from, valid_to, value, bill_condition, max_value, productRequired, productDiscounted, free_check, idAdmin, quantity, avatar);
        }
        if (req.getParameter("mod").equals("create")) {
            int couponID = c.addCoupon(name, message, valid_from, valid_to, value, Integer.parseInt(bill_condition), Integer.parseInt(max_value), free_check, idAdmin, quantity, avatar);
            if (couponID != -1) {
                c.addCouponDetail(couponID, productRequired, productDiscounted);
            }
        }
        resp.sendRedirect("coupon_admin");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Admin a = new Admin();
        if (req.getParameter("mod").equals("create")) {
            Category c = new Category();
            Product p = new Product();
            List<Category> dataC = c.getListCategory();
            List<Product> dataP = p.getListProductAtStart();
            req.setAttribute("dataC", dataC);
            req.setAttribute("dataP", dataP);
            req.setAttribute("mode", "create");
            req.getRequestDispatcher("jsp/Coupon/CRUD_Coupon.jsp").forward(req, resp);
        } else if (req.getParameter("mod").equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Coupon cou = new Coupon();
            cou.changeStatus(id);
            resp.sendRedirect("coupon_admin");
        } else {
            int id = Integer.parseInt(req.getParameter("id"));
            Coupon cou = new Coupon();
            Promotion promotion = new Promotion();
            List<Coupon> data = cou.getAllCoupon();
            List<Promotion> pro = new ArrayList<>();
            for (Coupon coupon : data) {
                if (coupon.getId() == id) {
                    Category c = new Category();
                    Product p = new Product();
                    List<Category> dataC = c.getListCategory();
                    List<Product> dataP = p.getListProductAtStart();
                    a = a.getInfo(coupon.getCreatedBy());
                    String adminName = a.getAdminName(Integer.parseInt(coupon.getCreatedBy()));
                    //check if coupon has been modified or not
                    String status = "Created";
                    if (!coupon.getModifiedBy().equals("")) {
                        adminName = a.getAdminName(Integer.parseInt(coupon.getModifiedBy()));
                        a = a.getInfo(coupon.getModifiedBy());
                        status = "Modified";
                    }
                    pro = promotion.getPromotionByCouponID(id);
                    req.setAttribute("dataDis", coupon.getProductDiscounted());
                    req.setAttribute("dataReq", coupon.getProductRequired());
                    req.setAttribute("datacustomer", pro);
                    req.setAttribute("dataC", dataC);
                    req.setAttribute("dataP", dataP);
                    req.setAttribute("id", id);
                    req.setAttribute("admin", a);
                    req.setAttribute("status", status);
                    req.setAttribute("data", coupon);
                    req.setAttribute("mode", req.getParameter("mod"));
                    req.getRequestDispatcher("jsp/Coupon/CRUD_Coupon.jsp").forward(req, resp);
                }
            }
        }
    }

}

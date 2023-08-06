/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SearchSeries;

import Model.Coupon;
import Model.Promotion;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class ApplyCouponClient extends HttpServlet {

    /**
     * Processes reqs for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param req servlet req
     * @param resp servlet resp
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = resp.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ApplyCouponClient</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyCouponClient at " + req.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param req servlet req
     * @param resp servlet resp
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet req
     * @param resp servlet resp
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        String CusID;
        try {
            CusID = session.getAttribute("ID").toString();
        } catch (Exception e) {
            CusID = "";
            System.out.println("error 1");
        }
        System.out.println("search coupon");
        //00: sai; 01: dung, 02: ko free (nopromotion), 03: co promotion
        String name = req.getParameter("code").trim();
        System.out.println("code:" + name);
        String couponArray = req.getParameter("coupon[]");
        String promoteArray = req.getParameter("promote[]");
//        System.out.println("voucher:" + couponArray);
//        System.out.println("promo:" + promoteArray);
        List<Coupon> voucher = new ArrayList<>();
        List<Coupon> promote = new ArrayList<>();
        double total = Double.parseDouble((String) req.getParameter("total"));
//        System.out.println("2");
        Gson gson = new Gson();
        // Convert the couponArray and promoteArray to lists using Gson
        try {

            if (!(couponArray.isEmpty() || couponArray == "")) {
                voucher = gson.fromJson(couponArray, new TypeToken<List<Coupon>>() {
                }.getType());
            }
            if (!(promoteArray.isEmpty() || promoteArray == "")) {
                promote = gson.fromJson(promoteArray, new TypeToken<List<Coupon>>() {
                }.getType());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("3");
        com.google.gson.JsonObject job = new JsonObject();

        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();
        boolean checked = false;
        System.out.println("voucher" + voucher);
        System.out.println("promo" + promote);
        for (Coupon coupon : voucher) {
            if (coupon.getName().equalsIgnoreCase(name)) {
                System.out.println("voucher");
                if (coupon.getStatus() == 2) {
                    if (coupon.isFree_check()) {
                        checked = true;
                        if (Double.parseDouble(coupon.getBill_condition()) > total || coupon.getDiscount_value() == 0) {
                            System.out.println("cou00");
                            job.addProperty("code", "00");
                            job.addProperty("message", "The coupon requirements haven't been fulfilled! Please update your cart and try again");
                            break;
                        } else if (coupon.getDiscount_value() != 0) {
                            System.out.println("cou01");
                            job.addProperty("code", "01");
                            job.addProperty("discount", coupon.getDiscount_value() + ";" + coupon.getId());
                            job.addProperty("message", "The coupon is successfully applied!");
                            break;
                        }
                    }
                }
            }
        }
        Promotion a = new Promotion();
        if (!checked) {
            for (Coupon coupon : promote) {
                if (coupon.getName().equalsIgnoreCase(name)) {
                    checked = true;
                    System.out.println("promotion");
                    if (a.checkPromotionStatus(Integer.parseInt(CusID.trim()), coupon.getId()) == 0) {
                        
                        if (coupon.getStatus() == 2) {

                            if (Double.parseDouble(coupon.getBill_condition()) > total || coupon.getDiscount_value() == 0) {
                                System.out.println("pro00");
                                System.out.println(coupon.getDiscount_value());
                                job.addProperty("code", "00");
                                job.addProperty("message", "The coupon requirements haven't been fulfilled! Please update your cart and try again");
                                break;
                            } else if (coupon.getDiscount_value() != 0) {
                                System.out.println("pro01");
                                job.addProperty("code", "01");
                                job.addProperty("discount", coupon.getDiscount_value() + ";" + coupon.getId());
                                job.addProperty("message", "The coupon is successfully applied!");
                                break;
                            } else {
                                System.out.println("pro03");
                                job.addProperty("code", "00");
                                job.addProperty("message", "The coupon is not available, please enter other code!");
                            }
                        }
                    } else {
                        System.out.println("pro03");
                        job.addProperty("code", "00");
                        job.addProperty("message", "The coupon is not available, please enter other code!");
                    }
                }
            }
        }

        if (!checked) {
            job.addProperty("code", "00");
            job.addProperty("message", "The coupon does not exist, please enter other code!");
        }
        System.out.println("4");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(job));
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

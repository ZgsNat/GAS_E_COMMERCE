/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SearchSeries;

import Model.Coupon;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class CheckCodeCoupon extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckCodeCoupon</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckCodeCoupon at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("check coupon");
        String name = req.getParameter("code").trim();
        String initial = req.getParameter("initial").trim();
        System.out.println("initail: " + initial);
        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();
        boolean checked = false;
        if (!initial.equalsIgnoreCase(name)) {
            for (Coupon coupon : data) {
                if (coupon.getName().equalsIgnoreCase(name)) {
                    checked = true;
                }
            }
        }
        com.google.gson.JsonObject job = new JsonObject();
        System.out.println(checked);
        job.addProperty("code", !initial.equalsIgnoreCase(name)? (checked ? "00" : "01"): "44");
        if (checked) {
            job.addProperty("message", "This code has been used. Please reinput.");
        } else {
            job.addProperty("message", "Looks good.");
        }
        Gson gson = new Gson();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(job));
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("check coupon");
        String name = req.getParameter("code");
        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();
        boolean checked = false;
        for (Coupon coupon : data) {
            if (coupon.getName().equalsIgnoreCase(name)) {
                checked = true;
            }
        }
        com.google.gson.JsonObject job = new JsonObject();
        System.out.println(checked);
        job.addProperty("code", checked ? "00" : "01");
        if (checked) {
            job.addProperty("code", "00");
            job.addProperty("message", "This code has been used. Please reinput.");
        } else {
            job.addProperty("code", "01");
            job.addProperty("message", "Looks good.");
        }
        Gson gson = new Gson();
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

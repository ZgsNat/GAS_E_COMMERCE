/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Category;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class ProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Product> data2;
        if (req.getParameter("category").equals("all")) {
            Product p = new Product();
            Product pAll = new Product();
            data2 = pAll.getListProductAtStart();
            req.setAttribute("data2", data2);
            Category c = new Category();
            ArrayList<Category> data = c.getListCategory();
            req.setAttribute("data", data);
            int totalPage = p.getTotalPage(0);
            System.out.println(totalPage);
            req.setAttribute("totalPage", totalPage);
            req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
        } else {
            int cid = Integer.parseInt(req.getParameter("category"));
            Product p = new Product(cid);
            data2 = p.getListProductWithCategory();
            req.setAttribute("data2", data2);
            Category g = new Category();
            ArrayList<Category> data = g.getListCategory();
            req.setAttribute("data", data);
            int totalPage = p.getTotalPage(0);
            System.out.println(totalPage);
            req.setAttribute("totalPage", totalPage);
            req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.contains("2") && !mode.equals("0")) {
                if (mode.contains("1")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("general").forward(req, resp);
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
                //stay status
                Category c = new Category();
                Product p = new Product();
                List<Category> data = c.getListCategory();
                List<Product> data2 = p.getListProductAtStart(1, 0);

                req.setAttribute("data", data);
                req.setAttribute("data2", data2);
                int totalPage = p.getTotalPage(0);
                System.out.println(totalPage);
                req.setAttribute("totalPage", totalPage);
                req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
            }
        }

    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Category;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Peanut
 */
public class CategoryFilterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Product> data2;
        if (req.getParameter("cID").equals("1")) {
            Product p1 = new Product();
            data2 = p1.getListProductWithCategory1(1);
            req.setAttribute("data2", data2);
            int totalQuantityWithCategory1 = p1.getTotalQuantityWithCategory1(1);
            int totalQuantityWithCategory2 = p1.getTotalQuantityWithCategory2(2);
            int totalQuantityWithCategory3 = p1.getTotalQuantityWithCategory3(3);
            req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
            req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
            req.setAttribute("totalQuantity3", totalQuantityWithCategory3);
            req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);
        } else if (req.getParameter("cID").equals("2")) {
            Product p2 = new Product();
            data2 = p2.getListProductWithCategory2(2);
            req.setAttribute("data2", data2);
            int totalQuantityWithCategory1 = p2.getTotalQuantityWithCategory1(1);
            int totalQuantityWithCategory2 = p2.getTotalQuantityWithCategory2(2);
            int totalQuantityWithCategory3 = p2.getTotalQuantityWithCategory3(3);
            req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
            req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
            req.setAttribute("totalQuantity3", totalQuantityWithCategory3);
            req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);
        } else {

            Product p3 = new Product();
            data2 = p3.getListProductWithCategory3(3);
            req.setAttribute("data2", data2);
            int totalQuantityWithCategory1 = p3.getTotalQuantityWithCategory1(1);
            int totalQuantityWithCategory2 = p3.getTotalQuantityWithCategory2(2);
            int totalQuantityWithCategory3 = p3.getTotalQuantityWithCategory3(3);
            req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
            req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
            req.setAttribute("totalQuantity3", totalQuantityWithCategory3);
            req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);

        }
    }

}

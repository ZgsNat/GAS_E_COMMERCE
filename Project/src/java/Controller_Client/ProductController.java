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
            Product pAll = new Product();
            data2 = pAll.getListProductAtStart();
            req.setAttribute("data2", data2);
            Category c = new Category();
            ArrayList<Category> data = c.getListCategory();
            req.setAttribute("data", data);
            req.getRequestDispatcher("Client/productInfo.jsp").forward(req, resp);
        } else {
            int cid = Integer.parseInt(req.getParameter("category"));
            Product p = new Product(cid);
            data2 = p.getListProductWithCategory();
            req.setAttribute("data2", data2);
            Category g = new Category();
            ArrayList<Category> data = g.getListCategory();
            req.setAttribute("data", data);
            req.getRequestDispatcher("Client/productInfo.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("mod") != null) {

            if (req.getParameter("mod").equals("asc")) {
                Category c = new Category();
                Product p = new Product();

                int totalQuantityWithCategory1 = p.getTotalQuantityWithCategory1(1);
                int totalQuantityWithCategory2 = p.getTotalQuantityWithCategory2(2);
                int totalQuantityWithCategory3 = p.getTotalQuantityWithCategory3(3);
                req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
                req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
                req.setAttribute("totalQuantity3", totalQuantityWithCategory3);

                String category = req.getParameter("cID");
                if (category == null) {
                    category = "0";
                }
                int cID = Integer.parseInt(category);

                ArrayList<Category> data = c.getListCategory();
                String page = req.getParameter("page");
                if (page == null) {
                    page = "1";
                }
                int indexPage = Integer.parseInt(page);
                List<Product> data2 = p.getListProductLowToHighPrice(indexPage, cID);
                int totalPage = p.getTotalPage(cID);
                System.out.println(cID);
                req.setAttribute("mode", req.getParameter("mod"));
                req.setAttribute("cID", cID);
                req.setAttribute("page", page);
                req.setAttribute("total", totalPage);
                req.setAttribute("data", data);
                req.setAttribute("data2", data2);
                req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);
            }
            if (req.getParameter("mod").equals("desc")) {
                Category c = new Category();
                Product p = new Product();

                int totalQuantityWithCategory1 = p.getTotalQuantityWithCategory1(1);
                int totalQuantityWithCategory2 = p.getTotalQuantityWithCategory2(2);
                int totalQuantityWithCategory3 = p.getTotalQuantityWithCategory3(3);
                req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
                req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
                req.setAttribute("totalQuantity3", totalQuantityWithCategory3);

                String category = req.getParameter("cID");
                if (category == null) {
                    category = "0";
                }
                int cID = Integer.parseInt(category);

                ArrayList<Category> data = c.getListCategory();
                String page = req.getParameter("page");
                if (page == null) {
                    page = "1";
                }
                int indexPage = Integer.parseInt(page);
                List<Product> data2 = p.getListProductHighToHighLow(indexPage, cID);
                int totalPage = p.getTotalPage(cID);
                System.out.println(cID);
                req.setAttribute("cID", cID);
                req.setAttribute("mode", req.getParameter("mod"));
                req.setAttribute("page", page);
                req.setAttribute("total", totalPage);
                req.setAttribute("data", data);
                req.setAttribute("data2", data2);
                req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);

            }
            if (req.getParameter("mod").isEmpty()) {
                Category c = new Category();
                Product p = new Product();

                int totalQuantityWithCategory1 = p.getTotalQuantityWithCategory1(1);
                int totalQuantityWithCategory2 = p.getTotalQuantityWithCategory2(2);
                int totalQuantityWithCategory3 = p.getTotalQuantityWithCategory3(3);
                req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
                req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
                req.setAttribute("totalQuantity3", totalQuantityWithCategory3);

                String category = req.getParameter("cID");
                if (category == null) {
                    category = "0";
                }
                int cID = Integer.parseInt(category);

                ArrayList<Category> data = c.getListCategory();
                String page = req.getParameter("page");
                if (page == null) {
                    page = "1";
                }
                int indexPage = Integer.parseInt(page);
                List<Product> data2 = p.getListProductAtStart(indexPage, cID);
                int totalPage = p.getTotalPage(cID);
                System.out.println(cID);
                req.setAttribute("cID", cID);
                req.setAttribute("page", page);
                req.setAttribute("total", totalPage);
                req.setAttribute("data", data);
                req.setAttribute("data2", data2);
                System.out.println("check");
                req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);
            }
        } else {
            Category c = new Category();
            Product p = new Product();

            int totalQuantityWithCategory1 = p.getTotalQuantityWithCategory1(1);
            int totalQuantityWithCategory2 = p.getTotalQuantityWithCategory2(2);
            int totalQuantityWithCategory3 = p.getTotalQuantityWithCategory3(3);
            req.setAttribute("totalQuantity1", totalQuantityWithCategory1);
            req.setAttribute("totalQuantity2", totalQuantityWithCategory2);
            req.setAttribute("totalQuantity3", totalQuantityWithCategory3);

            String category = req.getParameter("cID");
            if (category == null) {
                category = "0";
            }
            int cID = Integer.parseInt(category);

            ArrayList<Category> data = c.getListCategory();
            String page = req.getParameter("page");
            if (page == null) {
                page = "1";
            }
            int indexPage = Integer.parseInt(page);
            List<Product> data2 = p.getListProductAtStart(indexPage, cID);
            int totalPage = p.getTotalPage(cID);
            System.out.println(cID);
            req.setAttribute("cID", cID);
            req.setAttribute("page", page);
            req.setAttribute("total", totalPage);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            System.out.println("check");
            req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);
        }

    }

}

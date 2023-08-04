/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Category;
import Model.Comment;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pID = Integer.parseInt(req.getParameter("pID"));
        int cID = Integer.parseInt(req.getParameter("cID"));
        Comment com = new Comment();
        List<Comment> data3 = com.getListCommentClient(pID);
        Product p2 = new Product();
        Product p = new Product(pID, cID);
        List<Product> data = p.getRelatedProduct();
        Product data2 = p2.getProductDetailClientSite(pID);
        List<Product> multiImg = p2.getMultiImg(pID);
        req.setAttribute("data3", data3);
        req.setAttribute("multiImg", multiImg);
        req.setAttribute("data", data);
        req.setAttribute("data2", data2);
        req.getRequestDispatcher("Client/shop-single.jsp").forward(req, resp);
    }

}

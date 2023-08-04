/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

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
public class CRUD_Product extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("comment").equals("random")) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Product p = new Product();
            Comment com = new Comment();
            List<Comment> data3 = com.getListComment(pID);
            Category c = new Category();
            List<Category> data = c.getListCategory();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("pID", pID);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.setAttribute("data3", data3);
            req.getRequestDispatcher("ShowCommentProduct.jsp").forward(req, resp);
        } else if (req.getParameter("comment").equals("old_to_new")) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Product p = new Product();
            Comment com = new Comment();
            List<Comment> data3 = com.getListCommentOldToNew(pID);
            Category c = new Category();
            List<Category> data = c.getListCategory();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("pID", pID);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.setAttribute("data3", data3);
            req.getRequestDispatcher("ShowCommentProduct.jsp").forward(req, resp);
        } else {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Product p = new Product();
            Comment com = new Comment();
            List<Comment> data3 = com.getListCommentNewToOld(pID);
            Category c = new Category();
            List<Category> data = c.getListCategory();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("pID", pID);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.setAttribute("data3", data3);
            req.getRequestDispatcher("ShowCommentProduct.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("mod").equals("1")) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Product p = new Product();
            Comment com = new Comment();
            List<Product> data4 = p.getProductDetail(pID);
            Category c = new Category();
            List<Category> data = c.getListCategory();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("pID", pID);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.setAttribute("data4", data4);
            req.getRequestDispatcher("ShowProductDetail.jsp").forward(req, resp);
        }

        if (req.getParameter("mod").equals("3")) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Category c = new Category();
            List<Category> data = c.getListCategory();

            Product p = new Product();
            System.out.println(pID + " deleted");
            p.deleteProduct(pID);
            List<Product> data2 = p.getListProductAtStart(1, 0);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            int totalPage = p.getTotalPage(0);
            req.setAttribute("totalPage", totalPage);
            req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
        }

        if (req.getParameter("mod").equals("2")) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Product p = new Product();
            p.getUpdateProduct(pID);
            Category c = new Category();
            List<Category> data = c.getListCategory();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("p", p);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.getRequestDispatcher("UpdateProduct.jsp").forward(req, resp);
        }

        if (req.getParameter("mod").equals("4")) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            Product p = new Product();
            Comment com = new Comment();
            List<Comment> data3 = com.getListComment(pID);
            Category c = new Category();
            List<Category> data = c.getListCategory();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("pID", pID);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.setAttribute("data3", data3);
            req.getRequestDispatcher("ShowCommentProduct.jsp").forward(req, resp);
        }

        if (req.getParameter("mod").equals("5")) {
            int commentID = Integer.parseInt(req.getParameter("commentID"));
            int pID = Integer.parseInt(req.getParameter("pID"));
            Category c = new Category();
            Comment com = new Comment();
            com.deleteComment(commentID);
            List<Comment> data3 = com.getListComment(pID);
            List<Category> data = c.getListCategory();

            Product p = new Product();
            List<Product> data2 = p.getListProductAtStart();
            req.setAttribute("pID", pID);
            req.setAttribute("data", data);
            req.setAttribute("data2", data2);
            req.setAttribute("data3", data3);
            req.getRequestDispatcher("ShowCommentProduct.jsp").forward(req, resp);
        }
    }

}

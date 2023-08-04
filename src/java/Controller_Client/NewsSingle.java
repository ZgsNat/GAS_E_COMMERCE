/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.News;
import Model.NewsCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author mp3th
 */
public class NewsSingle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] path = req.getPathInfo().split("-");
        String id = path[path.length-1].substring(0,path[path.length-1].indexOf("."));
        News n = new News();
        n.GetNews(id);
        System.out.println(id);
        System.out.println(n.getContent());
        NewsCategory nc = new NewsCategory();
        List<NewsCategory> lstCate = nc.GetCategory();
        req.setAttribute("Cate", lstCate);
        req.setAttribute("news", n);
        try {
            req.getRequestDispatcher("/Client/NewsSingle.jsp").forward(req, resp);
        } catch (Exception e) {

        }
    }

}



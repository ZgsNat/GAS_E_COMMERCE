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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author mp3th
 */
public class Home extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        News n = new News();
        List<News> footer = n.getFooter();

        NewsCategory nc = new NewsCategory();
        List<NewsCategory> footerCate = nc.GetCategory(2);
        List<News> header = n.getHeader();
        List<News> banner = n.getBannerClient();

        News phone = n.getPhone();
        HttpSession session = req.getSession();
        session.setAttribute("phone", phone.getContent());
        List<News> contact = n.getContact();
        session.setAttribute("c", contact);
        session.setAttribute("footer", footer);
        session.setAttribute("banner", banner);
        session.setAttribute("H", header);
        session.setAttribute("footerCate", footerCate);

        req.getRequestDispatcher("Client/index.jsp").forward(req, resp);
    }

}

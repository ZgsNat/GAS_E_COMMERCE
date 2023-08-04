/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.News;
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
public class ContactController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String content = req.getParameter("content");
        News n = new News();
        n.updateContact(id, content);
        List<News> contact = n.getContact();
        for (News news : contact) {
            System.out.println(news.getTitle());
        }
        req.setAttribute("c", contact);
        req.getRequestDispatcher("Contact.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        //Redirect if it doesn't have the permission
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.contains("5") && !mode.equals("0")) {
                if (mode.contains("1")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("general").forward(req, resp);
                } else if (mode.contains("2")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("productInfo").forward(req, resp);
                } else if (mode.contains("3")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("customerInfo").forward(req, resp);
                } else if (mode.contains("4")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("coupon_admin").forward(req, resp);
                }
            } else {
                News n = new News();
                List<News> contact = n.getContact();
                req.setAttribute("c", contact);
                req.getRequestDispatcher("Contact.jsp").forward(req, resp);
            }
        }
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Client;

import Model.Cart;
import Model.Item;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ShowCart", urlPatterns = {"/showcart"})
public class ShowCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("Customer") == null) {
            req.getRequestDispatcher("logincookie").forward(req, resp);
        } else {
            String CusID;
            try {
                CusID = session.getAttribute("ID").toString();
            } catch (Exception e) {
                CusID = "";
            }
            Product p = new Product();
            List<Product> list = p.getListProduct();

            Cookie[] arr = req.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals(CusID + "cart")) {
                        txt += o.getValue();
                    }
                }
            }

            Cart cart = new Cart(txt, list);
            List<Item> o = cart.getItems();
            req.setAttribute("cart", cart);
            req.getRequestDispatcher("Client/cart.jsp").forward(req, resp);
        }
    }

}

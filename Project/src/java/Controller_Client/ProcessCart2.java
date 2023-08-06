/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Cart;
import Model.Item;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ProcessCart2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
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
                    o.setMaxAge(0);
                    resp.addCookie(o);
                }
            }
        }

        Cart cart = new Cart(txt, list);
        String id_raw = req.getParameter("id");

        int id, num = 0;
        try {
            id = Integer.parseInt(id_raw);
            cart.removeItem(id);

        } catch (Exception e) {
        }
        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            txt = items.get(0).getProduct().getProductID() + ":"
                    + items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt += "-" + items.get(i).getProduct().getProductID() + ":"
                        + items.get(i).getQuantity();
            }
        }

        Cookie c = new Cookie(CusID + "cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        resp.addCookie(c);
        cart = new Cart(txt, list);
        req.setAttribute("cart", cart);
//        resp.sendRedirect("cart.jsp");
        req.getRequestDispatcher("Client/cart.jsp").forward(req, resp);
    }

}

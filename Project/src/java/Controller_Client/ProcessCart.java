/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Client;

import Model.Cart;
import Model.Category;
import Model.Item;
import Model.Product;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ProcessCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("Customer") == null) {
            req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
        }
        String CusID;
        try {
            CusID = session.getAttribute("ID").toString();
        } catch (Exception e) {
            CusID = "";
        }

        Product pr = new Product();
        List<Product> list = pr.getListProductAtStart();
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
        String num = req.getParameter("num");
        String id = req.getParameter("id");
        System.out.println(num + " " + id);
        Product np = pr.getProductByID(Integer.parseInt(id));
        int numStore = np.getQuantity();
//        System.out.println(id + " " + num);
        if (txt.isEmpty()) {
            txt += id + ":" + num;
        } else {

            if (cart.getItemById(Integer.parseInt(id)) != null) {
                if (cart.getQuantityById(Integer.parseInt(id)) < numStore) {
                    txt = txt + "-" + id + ":" + num;
                }
            } else {
                txt = txt + "-" + id + ":" + num;
            }
        }
        System.out.println(txt);
        Cookie ck = new Cookie(CusID + "cart", txt);
        ck.setMaxAge(2 * 24 * 60 * 60);
        resp.addCookie(ck);
        Cart cart1 = new Cart(txt, list);
        req.setAttribute("cart", cart1);

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
        req.getRequestDispatcher("Client/shop.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("BAT DAU VÂO");
        HttpSession session = req.getSession();
        com.google.gson.JsonObject job = new JsonObject();
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
        String num_raw = req.getParameter("num");
        String id_raw = req.getParameter("id");

        int id = 0, num = 0;
        try {
            id = Integer.parseInt(id_raw);
            Product np = p.getProductByID(id);
            System.out.println("Du lieu ID product la: " + np.getProductID());
            int numStore = np.getQuantity();
            System.out.println("Du lieu Quantity la: " + np.getProductID());

            num = Integer.parseInt(num_raw);
            if (num == -1) {
                if ((cart.getQuantityById(id) <= 1)) {
                    job.addProperty("moneychange", 0);
                } else {
                    job.addProperty("moneychange", 0 - cart.getItemById(id).getPrice());
                }
            } else {
                if ((cart.getQuantityById(id) >= p.getProductByID(id).getQuantity())) {
//                System.out.println("unable");
                    job.addProperty("alertMess", "Unable to add more to cart!");
                    job.addProperty("moneychange", 0);
                } else {
                    job.addProperty("moneychange", cart.getItemById(id).getPrice());
                }
            }
            if (num == -1 && (cart.getQuantityById(id) <= 1)) {
//                cart.removeItem(id);
            } else {
                if (!(num == 1 && (cart.getQuantityById(id) >= numStore))) {
                    Item t = new Item(np, np.getProductPrice(), num);
                    cart.addItem(t);
                }

            }

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
        System.out.println(txt);

        Cookie c = new Cookie(CusID + "cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        resp.addCookie(c);
        cart = new Cart(txt, list);
        
        job.addProperty("id", id);
        job.addProperty("quantity", cart.getQuantityById(id));
        job.addProperty("total", cart.getQuantityById(id) * cart.getItemById(id).getPrice());
//        System.out.println("total: " + cart.getQuantityById(id) * cart.getItemById(id).getPrice());

//        req.setAttribute("cart", cart);
//        req.getRequestDispatcher("Client/cart.jsp").forward(req, resp);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(job));
    }

}

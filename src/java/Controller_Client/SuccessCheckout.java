/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller_Client;

import Model.Cart;
import Model.Item;
import Model.Orders;
import Model.Product;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class SuccessCheckout extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SuccessCheckout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SuccessCheckout at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        boolean check = req.getParameter("vnp_ResponseCode")==null || ((String) req.getParameter("vnp_ResponseCode")).equals("00");
        HttpSession session = req.getSession();
        ServletContext application = getServletContext();

        String CusID;
        try {
            CusID = session.getAttribute("ID").toString();

        } catch (Exception e) {
            CusID = "";
            System.out.println("error 1:" + e.getMessage());
        }
        if (!check) {
            System.out.println("check fail");
            application.removeAttribute(CusID + "product");
            application.removeAttribute(CusID + "info");
            application.removeAttribute(CusID + "paymentmethod");
            application.removeAttribute(CusID + "price");
            application.removeAttribute(CusID + "couponid");
            application.removeAttribute(CusID + "discount");
            req.setAttribute("errormessage", "Check out failed!");
            req.getRequestDispatcher("showcart").forward(req, resp);
        } else {
            System.out.println("thankyou page");

            String[] product = {};

            double total = 0;
            double discount = 0;
            int couponid = 0;
            boolean paymentmethod = true;
            String info = "";

            try {
                product = (String[]) application.getAttribute(CusID + "product");
                total = Double.parseDouble(application.getAttribute(CusID + "price").toString());
                discount = Double.parseDouble(application.getAttribute(CusID + "discount").toString());
                couponid = Integer.parseInt(application.getAttribute(CusID + "couponid").toString());
                paymentmethod = application.getAttribute(CusID + "paymentmethod").toString().equals("1");
                info = application.getAttribute(CusID + "info").toString();

            } catch (Exception e) {
                System.out.println("error 1.2" + e.getMessage());
            }
            System.out.println(total + " " + discount + " " + couponid + " " + paymentmethod + " " + info + " " + product);
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
            List<Item> productcheck = new ArrayList<>();
            Cart cart = new Cart(txt, list);
            for (String string : product) {
                String[] parts = string.split(";");
                int id, num = 0;
                try {
                    id = Integer.parseInt(parts[0].trim());
                    Item m = cart.getItemById(id);
                    cart.removeItem(id);
                    productcheck.add(m);
                } catch (Exception e) {
                    System.out.println("error 2" + e.getMessage());
                }
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
            Cart checkout = new Cart();
            checkout.setItems(productcheck);
            Cookie c = new Cookie(CusID + "cart", txt);
            c.setMaxAge(2 * 24 * 60 * 60);

            application.removeAttribute(CusID + "product");
            application.removeAttribute(CusID + "info");
            application.removeAttribute(CusID + "paymentmethod");
            application.removeAttribute(CusID + "price");
            application.removeAttribute(CusID + "couponid");
            application.removeAttribute(CusID + "discount");

            String[] part = info.split(";");
            Orders o = new Orders();
            o.addOrder(total, discount, couponid, part[0], part[1], part[2], checkout, CusID, paymentmethod);
            req.getRequestDispatcher("Client/thankyou.jsp").forward(req, resp);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

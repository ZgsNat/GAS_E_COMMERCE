/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Customer;
import Model.Order;
import Model.Orders;
import Model.Promotion;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerID = req.getParameter("cID");
        System.out.println(customerID);
        Order o = new Order();
        Customer c = new Customer();
        c = c.getCustomerByID(customerID);
        List<Order> olist = o.getListOrderBycID(customerID);
        for (Order order : olist) {
            System.out.println(order.getCustomerName());
        }
        Promotion promotion = new Promotion();
        List<Promotion> pro = new ArrayList<>();
        pro = promotion.getPromotionByCustomerID(Integer.parseInt(customerID));
        req.setAttribute("data", pro);
        req.setAttribute("customer", c);
        req.setAttribute("Orderlist", olist);
        req.getRequestDispatcher("OrderListForCustomer.jsp").forward(req, resp);

    }

}

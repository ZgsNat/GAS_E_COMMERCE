/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class CustomerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = new Customer();
        if (req.getParameter("TypeofSort") != null) {
            ArrayList<Customer> data = new ArrayList<>();
            int choice = Integer.parseInt(req.getParameter("TypeofSort"));
            switch (choice) {
                case 1:
                    data = customer.getListOrderAtoZ();
                    break;
                case 2:
                    data = customer.getListOrderZtoA();
                    break;
                case 3:
                    data = customer.getListOrderOldCustomer();
                    break;
                case 4:
                    data = customer.getListOrderNewCustomer();
                    break;
            }

            if (!data.isEmpty()) {
                req.setAttribute("datacustomer", data);
            }
            req.getRequestDispatcher("customerInfo.jsp").forward(req, resp);

        }

        try {
            String name = req.getParameter("Name");
            ArrayList<Customer> data = customer.getListCustomerbyName(name);
            if (!data.isEmpty()) {
                req.setAttribute("datacustomer", data);
            }
            req.getRequestDispatcher("customerInfo.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.contains("3") && !mode.equals("0")) {
                if (mode.contains("1")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("general").forward(req, resp);
                } else if (mode.contains("2")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("productInfo").forward(req, resp);
                } else if (mode.contains("4")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("coupon_admin").forward(req, resp);
                } else if (mode.contains("5")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("news").forward(req, resp);
                }
            } else {
                if (req.getParameter("accessError") != null) {
                    req.setAttribute("accessError", "You don't have access to this!");
                }
                Customer customer = new Customer();
                ArrayList<Customer> data = customer.getListCustomer();
                req.setAttribute("datacustomer", data);
                req.getRequestDispatcher("customerInfo.jsp").forward(req, resp);
            }
        }
    }

}

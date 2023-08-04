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
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class CRUD_Customer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//            String getadress = req.getParameter("this");
//            System.out.println(getadress);
            String name = req.getParameter("name");
            String id = req.getParameter("id");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String adress = req.getParameter("adress");
            String redate = req.getParameter("date");
            String dob = req.getParameter("dob");
            Customer cus = new Customer();
            cus.update(id, name, phone, email, adress, dob, redate);
            cus = cus.getCustomerByID(id);
            req.setAttribute("CustomerID", cus);
            req.getRequestDispatcher("customerUpdate.jsp").forward(req, resp);
            return;
        } catch (Exception e) {
        }
        Customer customer = new Customer();
        ArrayList<Customer> data = customer.getListCustomer();
        req.setAttribute("datacustomer", data);
        req.getRequestDispatcher("customerInfo.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mod = req.getParameter("mod");
            String ID = req.getParameter("cID");
            Customer c = new Customer();
            switch (mod) {
                case "1":
                    System.out.println("Woww");
                    Customer newcus = c.getCustomerByID(ID);
                    req.setAttribute("CustomerID", newcus);
                    req.getRequestDispatcher("customerUpdate.jsp").forward(req, resp);
                    return;
                case "2":
                    c.deleteThisCustomerId(ID);
                    break;
            }
        } catch (Exception e) {
        }
        Customer customer = new Customer();
        ArrayList<Customer> data = customer.getListCustomer();
        req.setAttribute("datacustomer", data);
        req.getRequestDispatcher("customerInfo.jsp").forward(req, resp);
    }

}

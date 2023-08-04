/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Customer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author ASUS
 */
public class CustomerController2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String newPassword = req.getParameter("password");
            String confPassword = req.getParameter("confPassword");
            boolean check = confPassword.equals(newPassword) ? true : false;
            if (check) {
                Customer customer = new Customer();
                String email = ((Customer) session.getAttribute("Customer")).getEmail();
                customer = customer.updateNewPassword(getEncryptedPassword(newPassword), email);
                if (customer != null) {

                    customer = customer.getCustomer();
                    session.setAttribute("ID", customer.getCustomerID());
                    session.setAttribute("Customer", customer);
                    req.setAttribute("status", "resetSuccess");
                    req.getRequestDispatcher("Client/Changepassword.jsp").forward(req, resp);
                    return;
                }
            } else {
                System.out.println("D?ng bao sai no van vao day nhe");
                req.setAttribute("status", "resetFailed");
                req.getRequestDispatcher("Client/Changepassword.jsp").forward(req, resp);
                return;
            }
        } catch (Exception e) {
            System.out.println("D?ng bao sai no van vao day nheeeeeeeeee");
            req.getRequestDispatcher("Client/index.jsp").forward(req, resp);
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("Client/Changepassword.jsp").forward(req, resp);
    }

    public String getEncryptedPassword(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(input.getBytes());
        byte[] digest = md.digest();
        return DatatypeConverter.printHexBinary(digest).toUpperCase();
    }

    public boolean verifyPassword(String input, String verify) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(input.getBytes());
        byte[] digest = md.digest();
        String check = DatatypeConverter.printHexBinary(digest).toUpperCase();

        return verify.equals(check);
    }

}

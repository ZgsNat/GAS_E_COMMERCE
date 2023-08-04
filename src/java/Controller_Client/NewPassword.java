//package com.uniquedeveloper.registration;
package Controller_Client;

import Model.Customer;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 * Servlet implementation class NewPassword
 */
//@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String newPassword = req.getParameter("password");
            String confPassword = req.getParameter("confPassword");
            boolean check = confPassword.equals(newPassword) ? true : false;
            if (check) {
                Customer customer = new Customer();
                String email = (String) session.getAttribute("email");
                customer = customer.updateNewPassword(getEncryptedPassword(newPassword), email);
                if (customer != null) {

                    req.setAttribute("status", "resetSuccess");
                    req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
                    return;
                }
            } else {
                req.setAttribute("status", "resetFailed");
                req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
                return;
            }
        } catch (Exception e) {
            req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
            System.out.println(e.getMessage());
        }
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

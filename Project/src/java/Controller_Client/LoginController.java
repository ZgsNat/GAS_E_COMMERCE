/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String username = req.getParameter("Username");
            String password = req.getParameter("Password");
            String encrypted = getEncryptedPassword(password);
            Customer cus = new Customer(username, encrypted);
            boolean check = cus.checkCustomer();
            if (check) {
                cus = cus.getCustomer();
                session.setAttribute("ID", cus.getCustomerID());
                session.setAttribute("Customer", cus);
                if (req.getParameter("Mod") != null) {
                    Cookie u = new Cookie("Username", username);
                    Cookie p = new Cookie("Password", password);
                    u.setMaxAge(24 * 12 * 60);
                    p.setMaxAge(24 * 12 * 60);
                    resp.addCookie(u);
                    resp.addCookie(p);
                }
//                System.out.println("Session + " + cus.getDOB());
                req.getRequestDispatcher("Client/index.jsp").forward(req, resp);
                return;
            }
            req.setAttribute("Username", username);
            req.setAttribute("Wrong", 1);
            req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("Customer");
        req.getRequestDispatcher("Client/index.jsp").forward(req, resp);
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

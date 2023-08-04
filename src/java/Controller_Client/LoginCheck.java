/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author ASUS
 */
public class LoginCheck extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie arr[] = req.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("Username")) {
                    req.setAttribute("Username", o.getValue());
                }
                if (o.getName().equals("Password")) {
                    req.setAttribute("Password", o.getValue());
                }
            }
        }
        req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
    }

}

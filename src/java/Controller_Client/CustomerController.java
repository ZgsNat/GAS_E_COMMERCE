/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.regex.*;
import java.util.List;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class CustomerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("UOPWFIWFOEIFOAFIOAWF");
            Customer cus = new Customer();
            String name = "", id = "", phone = "", email = "", address = "", redate = "", dob = "", avatar = "";
            HttpSession session = req.getSession();
            try {
                name = req.getParameter("fullname");
            } catch (Exception e) {
            }
            try {
                id = Integer.toString(((Customer) session.getAttribute("Customer")).getCustomerID());
            } catch (Exception e) {
            }
            try {

                if (req.getParameter("phonenumber") != null) {
//                    System.out.println("okay luoon");
                    phone = req.getParameter("phonenumber");
                }
                boolean isValid = validatePhoneNumber(phone);
                if (!isValid) {
                    System.out.println("HIeu luoon vi sao sai roi day" + phone);
                    cus = cus.getCustomerByID(id);
                    session.setAttribute("ID", cus.getCustomerID());
                    session.setAttribute("Customer", cus);
                    req.getRequestDispatcher("Client/customerinfo.jsp").forward(req, resp);
                    return;
                }
            } catch (Exception e) {
            }
            try {
                email = req.getParameter("email");
            } catch (Exception e) {
            }
            try {
                address = req.getParameter("adress");
            } catch (Exception e) {
            }
            try {
                redate = req.getParameter("date");
            } catch (Exception e) {
            }
            try {
                dob = req.getParameter("dob");
            } catch (Exception e) {
            }
            boolean check = true;
            try {
                Part image = req.getPart("filename");
                if (image.getSize() > 0) {
                    System.out.println("check");
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "avatars";
                    String uploadPath1 = getServletContext().getRealPath("") + "../../web/avatars";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    File uploadDir1 = new File(uploadPath1);
                    if (!uploadDir1.exists()) {
                        uploadDir1.mkdir();
                    }

                    avatar = "image_" + System.currentTimeMillis() + ".jpg";
                    image.write(uploadPath + File.separator + avatar);
                    image.write(uploadPath1 + File.separator + avatar);
                } else {
                    check = false;
                }

            } catch (Exception e) {
            }
            if (!check) {
                System.out.println("Thieu ava");
                req.setAttribute("isGG", true);
                cus.update(id, name, phone, email, address, dob, redate);
            } else {
                req.setAttribute("isGG", false);
                cus.update(id, name, phone, email, address, dob, redate, avatar);
            }
            System.out.println(id + "; " + address + "; " + avatar + "; " + dob + "; " + email + "; " + name + "; " + phone + "; " + redate);
            cus = cus.getCustomerByID(id);
            session.setAttribute("ID", cus.getCustomerID());
            session.setAttribute("Customer", cus);
//            System.out.println(((Customer)session.getAttribute("Customer")).getAvatar());
//            System.out.println(cus.getAvatar());
            req.getRequestDispatcher("Client/customerinfo.jsp").forward(req, resp);
            return;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Customer c = (Customer) session.getAttribute("Customer");
        req.getRequestDispatcher("Client/customerinfo.jsp").forward(req, resp);
    }

    public static boolean validatePhoneNumber(String phoneNumber) {
        if (phoneNumber.equals("")) {
            return true;
        }
        String pattern = "^09\\d{8}$";
        return Pattern.matches(pattern, phoneNumber);
    }

}

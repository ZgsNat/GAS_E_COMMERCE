/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author CAT PHUONG
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CRUD_Employee extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("EmployeeCreate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String avatar = "";
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        if (req.getParameter("name") == null || req.getParameter("phone") == null || req.getParameter("email") == null || req.getParameter("address") == null) {
            doGet(req, resp);
        }

        String temp = "";
        if (req.getParameter("role1") != null) {
            temp += "1";
        }
        if (req.getParameter("role2") != null) {
            temp += "2";
        }
        if (req.getParameter("role3") != null) {
            temp += "3";
        }
        if (req.getParameter("role4") != null) {
            temp += "4";
        }
        if (req.getParameter("role5") != null) {
            temp += "5";
        }
        if (req.getParameter("role6") != null) {
            temp += "6";
        }
        if (temp.length() == 6) {
            temp = "0";
        }
        String role = temp;
        if (role.length() == 6) {
            role = "0";
        }
        String password = "";
        try {
            password = getEncryptedPassword("123");
        } catch (NoSuchAlgorithmException ex) {
        }
        boolean check = false;
        try {
//                    System.out.println("image");
            Part image = req.getPart("filename");
            if (image != null) {
                if (image.getSize() > 0) {
//                        System.out.println("check");
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
                    check = true;
                } else {
                    check = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        Admin admin = new Admin();
        System.out.println(name + "; " + phone + "; " + email + "; " + address + "; " + avatar + "; " + role + "; " + password);
        if (check) {
            admin.createNewAdmin(name, phone, email, address, avatar, role, password);
        } else {
            admin.createNewAdmin(name, phone, email, address, role, password);
        }
        resp.sendRedirect("employee");

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

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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author ASUS
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AdminController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post admin info");
        HttpSession session = req.getSession();
        String AdminID = session.getAttribute("id").toString();

        if (req.getParameter("passchange") != null) {
            try{
            System.out.println("okay fine");
            String oldpass = req.getParameter("oldpassword") == null ? "" : req.getParameter("oldpassword");
            String newpass = req.getParameter("newpassword") == null ? "" : req.getParameter("newpassword");
            String repass = req.getParameter("repassword") == null ? "" : req.getParameter("repassword");
            String id = "" + session.getAttribute("fid");
            Admin a = new Admin();
//                System.out.println(session.getAttribute("fid"));
            if (oldpass.isEmpty() || newpass.isEmpty() || repass.isEmpty()) {
                System.out.println("null or empty");
                req.setAttribute("messfail", "Password must not be empty!");
                Admin admin = new Admin();
                Admin b = a.getInfo("" + a.getId());
                session.setAttribute("adminavt", b.getAvatar());

                admin = admin.getInfo(AdminID);
                req.setAttribute("infoAdmin", admin);
                req.getRequestDispatcher("AdminInfo.jsp").forward(req, resp);
                return;
            }
            if (a.getPassword() == oldpass) {
                if (newpass.equals(repass)) {
                    String pass = getEncryptedPassword(newpass);
                    a.changePassword(pass, id);
                    resp.sendRedirect("login");
                    return;
                } else {
                    req.setAttribute("messfail", "Password don't match!");
                }
                Admin admin = new Admin();
                admin = admin.getInfo(AdminID);
                req.setAttribute("infoAdmin", admin);
                req.getRequestDispatcher("AdminInfo.jsp").forward(req, resp);
            } else {
                req.setAttribute("messfail", "Old password is wrong!");
                Admin admin = new Admin();
                admin = admin.getInfo(AdminID);
                req.setAttribute("infoAdmin", admin);
                req.getRequestDispatcher("AdminInfo.jsp").forward(req, resp);
                return;
            }
            }catch(Exception e){
                
            }
        }
        if (req.getParameter("infochange") != null) {
            System.out.println("info change");
            try {
                String avatar = "";
                String name = req.getParameter("name");
                String id = req.getParameter("id");
                String phone = req.getParameter("phone");
//                try {
//
//                    if (req.getParameter("phone") != null) {
////                    System.out.println("okay luoon");
//                        phone = ;
//                    }
//                    boolean isValid = validatePhoneNumber(phone);
//                    if (!isValid) {
//                        System.out.println("HIeu luoon vi sao sai roi day" + phone);
//                        req.setAttribute("infofail", "Phone number is invalid!");
//                        Admin admin = new Admin();
//                        admin = admin.getInfo(AdminID);
//                        req.setAttribute("infoAdmin", admin);
//                        req.getRequestDispatcher("AdminInfo.jsp").forward(req, resp);
//                        return;
//                    }
//                } catch (Exception e) {
//                    System.out.println("phonenumber fail:" + e.getMessage());
//                }
                String email = req.getParameter("email");
                String address = req.getParameter("address");
                boolean check = false;
                try {
//                    System.out.println("image");
                    Part image = req.getPart("filename");
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

                } catch (Exception e) {
                    e.printStackTrace();
                }
                Admin admin = new Admin();
                if (check) {
                    admin.updateThisAdmin(id, name, phone, email, address, avatar);
                } else {
                    admin.updateThisAdmin(id, name, phone, email, address);
                }
                admin = admin.getInfo(AdminID);
                req.setAttribute("infoAdmin", admin);
                session.setAttribute("name", name);
                req.getRequestDispatcher("AdminInfo.jsp").forward(req, resp);

            } catch (Exception e) {
            }

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String AdminID = session.getAttribute("id").toString();
        Admin admin = new Admin();
        admin = admin.getInfo(AdminID);
        req.setAttribute("infoAdmin", admin);
        System.out.println(admin);
        req.getRequestDispatcher("AdminInfo.jsp").forward(req, resp);
    }

    public boolean validatePhoneNumber(String phoneNumber) {
        if (phoneNumber.equals("")) {
            return false;
        }
        String pattern = "^09\\d{8}$";
        return Pattern.matches(pattern, phoneNumber);
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

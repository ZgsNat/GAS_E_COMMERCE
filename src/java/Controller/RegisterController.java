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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Peanut
 */
public class RegisterController extends HttpServlet {

    public static final String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,16}$";
    public static final Pattern pattern = Pattern.compile(PASSWORD_PATTERN);

    public static final String registerError = "Customer already exist!! Please sign up another username!";
    public static final String passwordError = "The password you confirmed is not equal to the password! Reenter password to sign up!";
    public static final String registerSuccess = "Account register successfully!";

    public static boolean validatePassword(String password) {
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("submitRegister") != null) {
            if (req.getParameter("name").isEmpty() || req.getParameter("email").isEmpty() || req.getParameter("password").isEmpty()
                    || req.getParameter("re_password").isEmpty() || req.getParameter("dob").isEmpty() || req.getParameter("phone").isEmpty() || req.getParameter("address").isEmpty()) {
                req.setAttribute("passwordError", passwordError);
                req.getRequestDispatcher("Register.jsp").forward(req, resp);
            }
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String re_password = req.getParameter("re_password");
            String dob = req.getParameter("dob");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();

            if ((!password.equals(re_password)) || (!validatePassword(password))) {
                req.setAttribute("passwordError", passwordError);
                req.getRequestDispatcher("Register.jsp").forward(req, resp);
            } else {
                Customer cus = new Customer();
                boolean checkCustomerExist = cus.checkCustomerExist();
                if (checkCustomerExist) {
                    req.setAttribute("registerError", registerError);
                    req.getRequestDispatcher("Register.jsp").forward(req, resp);
                } else {
                    String encryptedPassword = "";
                    try {
                        encryptedPassword = getEncryptedPassword(password);
                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    cus.register(name, email, encryptedPassword, dob, phone, address, dtf.format(now));
                    req.setAttribute("registerSuccess", registerSuccess);
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            }
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import Model.Constants;
import Model.Customer;
import Model.UserGoogleDto;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author ASUS
 */
public class LoginGG extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String code = req.getParameter("code");
            System.out.println(code);
            String accessToken = getToken(code);
            UserGoogleDto user = getUserInfo(accessToken);
            HttpSession session = req.getSession();
            System.out.println(user);
//            req.getRequestDispatcher("index.jsp").forward(req, resp);
            Customer cus = new Customer();
            if (cus.checkCustomerExist(user.getEmail())) {
                String username = user.getEmail();
                String password = user.getId();
                String encrypted = getEncryptedPassword(password);
                cus = new Customer(username, encrypted);
                boolean check = cus.checkCustomer();
                if (check) {
                    cus = cus.getCustomer();
                    session.setAttribute("ID", cus.getCustomerID());
                    session.setAttribute("Customer", cus);
                    if (cus.getAvatar().contains("https://")) {
                        session.setAttribute("isGG", true);
                    } else {
                        session.setAttribute("isGG", false);
                    }
                    req.getRequestDispatcher("Client/index.jsp").forward(req, resp);
                } else {
                    System.out.println(cus.getEmail());
                    req.setAttribute("Username", username);
                    req.setAttribute("Wrong", 1);
                    req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
                }
            } else {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();
                String encryptedPassword = "";
                try {
                    encryptedPassword = getEncryptedPassword(user.getId());
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
                cus.register(user.getName(), user.getEmail(), encryptedPassword, dtf.format(now), user.getPicture());
                Customer newcus = new Customer(user.getName(), user.getEmail(), encryptedPassword, dtf.format(now), true, user.getPicture());
                newcus = newcus.getCustomer();
                session.setAttribute("Customer", newcus);
                if (newcus.getAvatar().contains("https://")) {
                    session.setAttribute("isGG", true);
                } else {
                    session.setAttribute("isGG", false);
                }
                req.getRequestDispatcher("Client/index.jsp").forward(req, resp);
            }
        } catch (Exception e) {
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
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

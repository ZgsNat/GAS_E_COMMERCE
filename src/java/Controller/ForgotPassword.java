package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

/**
 *
 * @author CAT PHUONG
 */
public class ForgotPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Thông tin tài khoản Twilio
    private static final String ACCOUNT_SID = "AC40ef8f7fd7fbf256469343f3007ebcac";
    private static final String AUTH_TOKEN = "d224ebfe120273e182a658bae58d76ae";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Admin a = new Admin();
        HttpSession session = request.getSession();
        if (session.getAttribute("verificationCode") != null) {
            String verificationCode = (String) session.getAttribute("verificationCode");
            System.out.println(verificationCode);
            String code = request.getParameter("number");
            if (code.equalsIgnoreCase(verificationCode)) {
                response.sendRedirect("ChangePassword.jsp");
            } else {
                request.setAttribute("mess", "Code nhap sai! Vui long thu lai");
                request.getRequestDispatcher("Verify.jsp").forward(request, response);

            }

        } else {
            String phoneNumber = request.getParameter("fpass");
            if (a.getAdminByNumber(phoneNumber) == null) {
                request.setAttribute("mess", "So dien thoai khong ton tai");
                request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            } else {
                // Tạo mã xác thực ngẫu nhiên
                String verificationCode = generateVerificationCode();

                // Lưu mã xác thực vào session (hoặc cơ sở dữ liệu)
                request.getSession().setAttribute("verificationCode", verificationCode);
                session.setAttribute("fid", a.getAdminByNumber(phoneNumber).getId());

                phoneNumber = "+84" + phoneNumber.substring(1);
                // Gửi mã xác thực đến số điện thoại
                Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
                Message message = Message.creator(
                        new PhoneNumber(phoneNumber), // Số điện thoại nhận tin nhắn
                        new PhoneNumber("+13157137140"), // Số điện thoại Twilio
                        "Đây là mã code của bạn: " + verificationCode) // Nội dung tin nhắn
                        .create();
                response.sendRedirect("Verify.jsp"); // Chuyển hướng đến trang xác thực
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("ForgotPassword.jsp");
    }

    // Hàm tạo mã xác thực ngẫu nhiên
    private String generateVerificationCode() {
        Random random = new Random();
        int code = random.nextInt(9000) + 1000; // Mã có 4 chữ số
        return String.valueOf(code);
    }

}

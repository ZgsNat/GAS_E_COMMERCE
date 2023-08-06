package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Function.SendMail;
import Model.Category;
import Model.Coupon;
import Model.Customer;
import Model.Product;
import Model.Promotion;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class PromotionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int idAdmin = (int) session.getAttribute("id");
        String id = "".equals(req.getParameter("id")) ? "-1" : req.getParameter("id");
        String name = req.getParameter("name");
        String message = req.getParameter("message");
        String[] customers = req.getParameterValues("customers");

        String from = "contraica117@gmail.com";
        String pass = "cewymfmzbflztpwz";
        System.out.println("okay");
        Coupon cou = new Coupon();
        for (String customer : customers) {
            Customer c = new Customer();
            c = c.getCustomerByID(customer);
            SendMail.send(c.getEmail(), "Promotion", message, from, pass);
            cou.addPromotion(c.getCustomerID(), id, idAdmin);
        }
        resp.sendRedirect("coupon_admin");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();
        HttpSession session = req.getSession();
        int idAdmin = (int) session.getAttribute("id");
        for (Coupon coupon : data) {
            if (coupon.getId() == id) {
                req.setAttribute("id", id);
                req.setAttribute("data", coupon);
                Customer customer = new Customer();
                ArrayList<Customer> dataCus = customer.getListCustomer();

                Promotion promotion = new Promotion();
                List<Promotion> pro = new ArrayList<>();
                pro = promotion.getPromotionByCouponID(id);
                req.setAttribute("datacus", pro);
                req.setAttribute("curp", "1");
                req.setAttribute("datacustomer", dataCus);
                req.getRequestDispatcher("CustomerPromotion.jsp").forward(req, resp);
            }
        }
    }

}

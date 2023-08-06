package Controller_Client;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Cart;
import Model.Coupon;
import Model.Customer;
import Model.Item;
import Model.Product;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 *
 * @author CAT PHUONG
 */
public class CheckOutController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
//        if (session.getAttribute("Customer") == null) {
//            resp.sendRedirect("index.jsp");
//        } else {
        ServletContext application = getServletContext();
        //product
        String CusID;
        try {
            CusID = session.getAttribute("ID").toString();
        } catch (Exception e) {
            CusID = "";
            System.out.println("error 1");
        }
        Product p = new Product();
        List<Product> list = p.getListProduct();
        Cookie[] arr = req.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals(CusID + "cart")) {
                    txt += o.getValue();
                }
            }
        }

        Cart cart = new Cart(txt, list);
//        System.out.println("checkout");
        String[] cartbuy = {};
        if (req.getParameterValues("checkoutitem") == null) {
            req.setAttribute("errormessage", "You must choose item to check out!");
            req.getRequestDispatcher("showcart").forward(req, resp);
        } else {
            cartbuy = req.getParameterValues("checkoutitem");
            List<Item> productcheck = new ArrayList<>();
            int total = 0;
            for (String string : cartbuy) {
                String[] parts = string.split(";");
                int id, num = 0;
                try {
                    id = Integer.parseInt(parts[0].trim());
                    Item m = cart.getItemById(id);
                    productcheck.add(m);
                } catch (Exception e) {
                    System.out.println("error 2" + e.getMessage());
                }

            }
            req.setAttribute("product", productcheck);
            application.setAttribute(CusID + "product", cartbuy);
            for (Item pro : productcheck) {
                total += pro.getQuantity() * pro.getProduct().getProductPrice();
            }
            System.out.println("total: " + total);
//        for (Map.Entry<Product, Integer> entry : map.entrySet()) {
//            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
//        }
//        req.setAttribute("map", map);
            //product
            //address
            Customer cus = new Customer();
            cus = cus.getCustomerByID(CusID);
//            List<String> info = new ArrayList<>();
//            if (cus.getAllAddress(cus.getCustomerID()).isEmpty()) {
//                info.add(cus.getCustomerName() + "; " + cus.getPhoneNumber() + "; " + cus.getAddress());
//            } else {
//                info.addAll(cus.getAllAddress(cus.getCustomerID()));
//            }
//            req.setAttribute("address", info);
            req.setAttribute("cusName", cus.getCustomerName());
            req.setAttribute("cusPhone", cus.getPhoneNumber());
            req.setAttribute("cusAddress", cus.getAddress());
            //address
            //coupon
            Coupon cou = new Coupon();
            List<Coupon> data = cou.getAllCoupon();

            //met required condition voucher
            List<Coupon> data2 = cou.getAvailableBillCoupon();
            for (Coupon d : data2) {
                if (d.getValue().contains("%")) {
                    double discount = Double.parseDouble(d.getValue().substring(0, d.getValue().length() - 1)) / 100;
                    double max_value = Double.parseDouble(d.getMax_value());
                    if (max_value > 0) {
                        if (discount * total > max_value) {
                            d.setDiscount_value(max_value);
                        } else {
                            d.setDiscount_value(discount * total);
                        }
                    } else {
                        d.setDiscount_value(discount * total);
                    }
                } else {
                    double discount = Double.parseDouble(d.getValue());
                    d.setDiscount_value(discount);
                }

            }
            List<Coupon> data3 = cou.getAvailableProductCoupon();
            for (Coupon d : data3) {
                if (d.getValue().contains("%")) {
                    double discount = Double.parseDouble(d.getValue().substring(0, d.getValue().length() - 1)) / 100;
                    double max_value = Double.parseDouble(d.getMax_value());
                    double value = 0;
                    boolean check = false;
                    for (Item pf : productcheck) {
                        for (Product test : d.getProductDiscounted()) {
                            if (pf.getProduct().getProductID() == test.getProductID()) {
                                value += pf.getProduct().getProductPrice() * discount * pf.getQuantity();
                                break;
                            }
                        }
                        for (Product test : d.getProductRequired()) {
                            if (pf.getProduct().getProductID() == test.getProductID()) {
                                check = true;
                                break;
                            }
                        }

                    }
                    if (!check) {
                        value = 0;
                        max_value = 0;
                    }
                    if (max_value > 0) {
                        if (value > max_value) {
                            d.setDiscount_value(max_value);
                        } else {
                            d.setDiscount_value(value);
                        }
                    } else {
                        d.setDiscount_value(value);
                    }

                } else {
                    double discount = Double.parseDouble(d.getValue());
                    double value = 0;
                    boolean check = false;
                    for (Item pf : productcheck) {
                        for (Product test : d.getProductDiscounted()) {
                            if (pf.getProduct().getProductID() == test.getProductID()) {
                                value += pf.getProduct().getProductPrice() * discount * pf.getQuantity();
                                break;
                            }
                        }
                        for (Product test : d.getProductRequired()) {
                            if (pf.getProduct().getProductID() == test.getProductID()) {
                                check = true;
                                break;
                            }
                        }

                    }
                    if (!check) {
                        value = 0;
                    }

                    d.setDiscount_value(value);
                }

            }

            for (Coupon d : data) {
                for (Coupon df : data2) {
                    if (d.getId() == df.getId()) {
                        d.setDiscount_value(df.getDiscount_value());
                    }
                }
                for (Coupon df : data3) {
                    if (d.getId() == df.getId()) {
                        d.setDiscount_value(df.getDiscount_value());
                    }
                }
            }
            List<Coupon> dataPro = cou.getPromotionCoupon(CusID);
            for (Coupon d : dataPro) {
                for (Coupon df : data2) {
                    if (d.getId() == df.getId()) {
                        d.setDiscount_value(df.getDiscount_value());
                    }
                }
                for (Coupon df : data3) {
                    if (d.getId() == df.getId()) {
                        d.setDiscount_value(df.getDiscount_value());
                    }
                }
            }
            req.setAttribute("voucher", data);
            req.setAttribute("promote", dataPro);

            Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setPrettyPrinting().create();

            String voucherjson = gson.toJson(data);
            String promotejson = gson.toJson(dataPro);
            req.setAttribute("voucherjson", voucherjson);
            req.setAttribute("promotejson", promotejson);
//            System.out.println("voucherjson" + voucherjson);
//            System.out.println("promotejson" + promotejson);
            req.setAttribute("total", total);
            //coupon

            req.getRequestDispatcher("Client/checkout.jsp").forward(req, resp);
//        }
        }
    }

}

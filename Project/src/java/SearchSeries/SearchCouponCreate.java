package SearchSeries;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Category;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class SearchCouponCreate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Product> data2 = new ArrayList<>();
        Product pAll = new Product();
        if (req.getParameter("category").equals("all")) {
            data2 = pAll.searchProduct("", "");
            Category c = new Category();
            ArrayList<Category> data = c.getListCategory();
        } else {
            String cid = req.getParameter("category");
            data2 = pAll.searchProduct(cid, "");
            Category c = new Category();
            ArrayList<Category> data = c.getListCategory();
        }
        
        PrintWriter out = resp.getWriter();
        for (Product product : data2) {
            out.print("<option value=\""+product.getProductID()+"\" data-text=\""+product.getProductName()+"\">"+product.getProductName()+"</option>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}

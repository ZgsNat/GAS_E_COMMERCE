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
public class ProductSearch extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> data2;
        System.out.println("Hi");
        if (req.getParameter("category").equals("all")) {
            System.out.println("all");
            String name = req.getParameter("name");
            Product pAll = new Product();
            data2 = pAll.searchProduct("", name);

            Category c = new Category();
            ArrayList<Category> data = c.getListCategory();
            PrintWriter out = resp.getWriter();
            for (Product s : data2) {
                out.print("<tr>\n"
                        + "                                                <td>" + s.getCategoryName() + "</td>\n"
                        + "                                                <td><img style=\"width: 100px;height: 100px;object-fit: cover;\" src=\"" + s.getSmallImg() + "\" alt=\"Image\"></td>\n"
                        + "                                                <td>" + s.getProductID() + "</td>\n"
                        + "                                                <td>" + s.getProductName() + "</td>\n"
                        + "                                                <td>" + s.getMoney() + " VNÐ</td>\n"
                        + "                                                <td>" + s.getQuantity() + "</td>\n"
                        + "                                                <td>" + s.getCreatedDate() + "</td>\n"
                        + "                                                <td>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-info m-2 btn-sm\" onclick=\"editProduct('" + s.getProductID() + "', '1')\"><i class=\"fas fa-info fa-xs\"></i></button>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-warning m-2 btn-sm\" onclick=\"editProduct('" + s.getProductID() + "', '2')\"><i class=\"fas fa-pen fa-xs\"></i></button>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-danger m-2 btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#delete\"><i class=\"bi bi-trash\"></i></button>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-success m-2\" onclick=\"editProduct('" + s.getProductID() + "', '4')\"\"><i class=\"far fa-comment-dots fa-xs\"></i></button>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>");

            }
        } else {
            String name = req.getParameter("name");
            String cid = req.getParameter("category");
            Product pAll = new Product();
            data2 = pAll.searchProduct(cid, name);

            Category c = new Category();
            ArrayList<Category> data = c.getListCategory();
            PrintWriter out = resp.getWriter();
            for (Product s : data2) {
                out.print("<tr>\n"
                        + "                                                <td>" + s.getCategoryName() + "</td>\n"
                        + "                                                <td><img style=\"width: 100px;height: 100px;object-fit: cover;\" src=\"" + s.getSmallImg() + "\" alt=\"Image\"></td>\n"
                        + "                                                <td>" + s.getProductID() + "</td>\n"
                        + "                                                <td>" + s.getProductName() + "</td>\n"
                        + "                                                <td>" + s.getMoney() + " VNÐ</td>\n"
                        + "                                                <td>" + s.getQuantity() + "</td>\n"
                        + "                                                <td>" + s.getCreatedDate() + "</td>\n"
                        + "                                                <td>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-info m-2 btn-sm\" onclick=\"editProduct('" + s.getProductID() + "', '1')\"><i class=\"fas fa-info fa-xs\"></i></button>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-warning m-2 btn-sm\" onclick=\"editProduct('" + s.getProductID() + "', '2')\"><i class=\"fas fa-pen fa-xs\"></i></button>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-danger m-2 btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#delete\"><i class=\"bi bi-trash\"></i></button>\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-sm-square btn-success m-2\" onclick=\"editProduct('" + s.getProductID() + "', '4')\"\"><i class=\"far fa-comment-dots fa-xs\"></i></button>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>");

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}

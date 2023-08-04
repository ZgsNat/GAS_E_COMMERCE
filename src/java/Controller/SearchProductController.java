package Controller;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import Model.Product;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class SearchProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int totalPages = 0;
        resp.setContentType("text/html;charset=UTF-8");

        req.setCharacterEncoding("UTF-8");
        String txtSearch = req.getParameter("txt");
        int pageNumber = Integer.parseInt(req.getParameter("page"));
        System.out.println("Page"+pageNumber);
        int pageSize = 6;
        String categoryIdParam = req.getParameter("category");
        
        int categoryId = 0; // Default value if the parameter is null
        if (categoryIdParam != null) {
            categoryId = Integer.parseInt(categoryIdParam);
        }
        System.out.println(categoryId);
        Product p = new Product();
        List<Product> searchProduct = p.searchProductAjax(txtSearch, categoryId);
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, searchProduct.size());
        System.out.println("start"+startIndex);
        System.out.println("emd"+endIndex);
        List<Product> currentProduct = searchProduct.subList(startIndex, endIndex);
        totalPages = (int) Math.ceil((double) searchProduct.size() / pageSize);
        String search = "<div class=\"table-responsive\">\n"
                + "                                            <table class=\"table text-end-center\">\n"
                + "                                                <thead>\n"
                + "                                                    <tr class=\"text-dark\">\n"
                + "                                                        <th scope=\"col\">Category</th>\n"
                + "                                                        <th scope=\"col\">Image</th>\n"
                + "                                                        <th scope=\"col\">Product Name</th>\n"
                + "                                                        <th scope=\"col\">Price</th>\n"
                + "                                                        <th scope=\"col\">Quantity</th>\n"
                + "                                                        <th scope=\"col\">Created Date</th>\n"
                + "                                                    </tr>\n"
                + "                                                </thead>\n"
                + "                                                <tbody class=\"table-border-bottom-0\">";
        for (Product item : currentProduct) {
            search += "<tr>\n"
                    + "                                                            <td>" + item.getCategoryName() + "</td>\n"
                    + "                                                            <td><img style=\"width: 100px;height: 100px;object-fit: fill;\" src=\"uploads/" + item.getSmallImg() + "\" alt=\"Image\"></td>\n"
                    + "                                                            <td>" + item.getProductName() + "</td>\n"
                    + "                                                            <td>" + item.getMoney() + " VN</td>\n"
                    + "                                                            <td>" + item.getQuantity() + "</td>\n"
                    + "                                                            <td>" + item.getCreatedDate() + "</td>\n"
                    + "                                                            <td>\n"
                    + "                                                                <div class=\"dropdown\">\n"
                    + "                                                                    <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">\n"
                    + "                                                                        <i class=\"bx bx-dots-vertical-rounded\"></i>\n"
                    + "                                                                    </button>\n"
                    + "                                                                    <div class=\"dropdown-menu\">\n"
                    + "                                                                        <a class=\"dropdown-item\" onclick=\"editProduct('" + item.getProductID() + "', '1')\"><i class='bx bxs-info-circle me-1'></i> Detail</a>\n"
                    + "                                                                        <a class=\"dropdown-item\" onclick=\"editProduct('" + item.getProductID() + "', '2')\"><i class=\"bx bx-edit-alt me-1\"></i> Update</a>\n"
                    + "                                                                        <a class=\"dropdown-item\" onclick=\"editProduct('" + item.getProductID() + "', '3')\"><i class=\"bx bx-trash me-1\"></i> Delete</a>\n"
                    + "                                                                        <a class=\"dropdown-item\" onclick=\"editProduct('" + item.getProductID() + "', '4')\"\"><i class='bx bx-message-square-dots me-1'></i> Comment</a>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "                                                            </td>\n"
                    + "                                                        </tr>";

        }
        search += "</table>\n"
                + "                                            <h5 class=\"card-header\"></h5>\n"
                + "                                            <button type=\"submit\" class=\"btn btn-primary\" name=\"addProduct\">\n"
                + "                                                <span class=\"tf-icons bx bx-plus\"></span> Create new Product\n"
                + "                                            </button>\n"
                + "                                        </div>\n"
                + "                                        <div id=\"pagingContainer\">\n"
                + "                                            <nav aria-label=\"Page navigation\">\n"
                + "                                                <ul class=\"pagination justify-content-center\">";
        for (int i = 1; i <= totalPages; i++) {
            if (pageNumber == i) {
                search += "<li class=\"page-item active\">";
            } else {
                search += "<li class=\"page-item\">";
            }
            search += "<a class=\"page-link \"  onclick=\"goToPage(" + i + ")\"\n"
                    + "                                                               >" + i + "</a>\n"
                    + "                                                        </li>";

        }
        search += "</ul>\n"
                + "                                            </nav>\n"
                + "                                        </div>";

        ResponseData responseData = new ResponseData(search, totalPages);

        // Convert the response object to JSON
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(responseData);

        // Send the JSON response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse);
    }

    class ResponseData {

        private String search;
        private int totalPages;

        public ResponseData(String search, int totalPages) {
            this.search = search;
            this.totalPages = totalPages;
        }

        public String getsearch() {
            return search;
        }

        public int getTotalPages() {
            return totalPages;
        }
    }
}

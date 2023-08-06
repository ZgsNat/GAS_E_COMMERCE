package Controller_Client;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import Controller.SearchProductController;
import Model.Product;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class SearchProductClient extends HttpServlet {

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
        List<Product> currentProduct = searchProduct.subList(startIndex, endIndex);
        totalPages = (int) Math.ceil((double) searchProduct.size() / pageSize);

        String search = "<div class=\"row mb-5\">";
        for (Product item : currentProduct) {
            search += "<div class=\"col-sm-6 col-lg-4 mb-4\" data-aos=\"fade-up\">\n"
                    + "                                                <div class=\"block-4 text-center border\">\n"
                    + "                                                    <figure class=\"block-4-image\">\n"
                    + "                                                        <a href=\"productDetail?pID="+item.getProductID()+"&cID="+item.getCategoryID()+"\"><img src=\"uploads/"+item.getSmallImg()+"\" alt=\"Image placeholder\" class=\"img-fluid\" style=\"width: 300px; height: 300px\"></a>\n"
                    + "                                                    </figure>\n"
                    + "                                                    <div class=\"block-4-text p-4\">\n"
                    + "                                                        <h3><a href=\"productDetail?pID="+item.getProductID()+"&cID="+item.getCategoryID()+"\" >"+item.getProductName()+"</a></h3>\n"
                    + "                                                        <p class=\"mb-0\">"+item.getProductName()+"</p>\n"
                    + "                                                        <p class=\"text-primary font-weight-bold\">"+item.getMoney()+" VND</p>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>";
        }
        search += "</div>";
        SearchProductClient.ResponseData responseData = new SearchProductClient.ResponseData(search, totalPages);

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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SearchSeries;

import Model.Admin;
import Model.News;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author mp3th
 */
public class SearchNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        req.setCharacterEncoding("UTF-8");
        String txtSearch = req.getParameter("txt");
        int pageNumber = Integer.parseInt(req.getParameter("page"));
        int pageSize = 2;
        System.out.println(txtSearch);
        String categoryIdParam = req.getParameter("category");
        int categoryId = 0; // Default value if the parameter is null
        if (categoryIdParam != null) {
            categoryId = Integer.parseInt(categoryIdParam);
        }
        System.out.println(categoryId);
        News n = new News();
        List<News> list = n.search(txtSearch, categoryId);
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, list.size());
        List<News> currentPageNews = list.subList(startIndex, endIndex);
        Admin a = new Admin();
        for (News ns : list) {
            ns.setCreateBy(a.getAdminName(Integer.parseInt(ns.getCreateBy())));
            if (ns.getModifyBy() != null) {
                ns.setModifyBy(a.getAdminName(Integer.parseInt(ns.getModifyBy())));
            } else {
                ns.setModifyBy("N/A");
            }
        }
        String tableRows = "<div class=\"table-responsive\">\n"
                + "                                                    <table class=\"table text-end-center\">\n"
                + "                                                        <thead>\n"
                + "                                                            <tr class=\"text-dark\">\n"
                + "                                                                <th scope=\"col\">Title</th>\n"
                + "                                                                <th scope=\"col\">Image</th>\n"
                + "                                                                <th scope=\"col\">CreateDate</th>\n"
                + "                                                                <th scope=\"col\">CreateBy</th>\n"
                + "                                                                <th scope=\"col\">ModifyDate</th>\n"
                + "                                                                <th scope=\"col\">ModifyBy</th>\n"
                + "                                                                <th scope=\"col\">Edit</th>\n"
                + "                                                            </tr>\n"
                + "                                                        </thead>\n"
                + "                                                        <tbody >\n";
        for (News item : currentPageNews) {
            tableRows += "                                                                <tr>\n"
                    + "                                                                    <td>" + item.getTitle() + "</td>\n"
                    + "                                                                    <td><img style=\"width: 100px;height: 100px;object-fit: cover;\" src=\"uploads/" + item.getImage() + "\" alt=\"Image\"></td>\n"
                    + "                                                                    <td>" + item.getCreateDate() + "</td>\n"
                    + "                                                                    <td>" + item.getCreateBy() + "</td>\n"
                    + "                                                                    <td>" + item.getModifyDate() + "</td>\n"
                    + "                                                                    <td>" + item.getModifyBy() + "</td>\n"
                    + "                                                                    <td>\n"
                    + "                                                                        <div class=\"dropdown\">\n"
                    + "                                                                            <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">\n"
                    + "                                                                                <i class=\"bx bx-dots-vertical-rounded\"></i>\n"
                    + "                                                                            </button>\n"
                    + "                                                                            <div class=\"dropdown-menu\">\n"
                    + "                                                                                <a class=\"dropdown-item\" href=\"editnews?id=" + item.getId() + "&mod=1\" ><i class='bx bxs-info-circle me-1'></i>Detail</a>\n"
                    + "                                                                                <a class=\"dropdown-item\" href=\"editnews?id=" + item.getId() + "\" ><i class=\"bx bx-edit-alt me-1\"></i>Edit</a>\n"
                    + "                                                                                <a class=\"dropdown-item\" href=\"news?id=" + item.getId() + "\" onclick=\"return confirm('Are you sure you want to delete this item')\"><i class=\"bx bx-trash me-1\"></i>Delete</a>\n"
                    + "                                                                            </div>\n"
                    + "                                                                        </div>\n"
                    + "                                                                    </td>"
                    + "                                                                </tr>\n";
        }
        tableRows += "                                                        </tbody>\n"
                + "                                                    </table>\n"
                + "                                                </div>\n";
//        PrintWriter out = resp.getWriter();

//        out.println("<div class=\"table-responsive\">\n" +
//"                                                    <table class=\"table text-end-center\">\n" +
//"                                                        <thead>\n" +
//"                                                            <tr class=\"text-dark\">\n" +
//"                                                                <th scope=\"col\">Title</th>\n" +
//"                                                                <th scope=\"col\">Image</th>\n" +
//"                                                                <th scope=\"col\">CreateDate</th>\n" +
//"                                                                <th scope=\"col\">CreateBy</th>\n" +
//"                                                                <th scope=\"col\">ModifyDate</th>\n" +
//"                                                                <th scope=\"col\">ModifyBy</th>\n" +
//"                                                                <th scope=\"col\">Edit</th>\n" +
//"                                                            </tr>\n" +
//"                                                        </thead>\n"+
//                "                                                        <tbody >\n" );
//        for (News item : list) {
//             out.println(
//
//
//"                                                                <tr>\n" +
//"                                                                    <td>"+item.getTitle()+"</td>\n" +
//"                                                                    <td><img style=\"width: 100px;height: 100px;object-fit: cover;\" src=\""+item.getImage()+"\" alt=\"Image\"></td>\n" +
//"                                                                    <td>"+item.getCreateDate()+"</td>\n" +
//"                                                                    <td>"+item.getCreateBy()+"</td>\n" +
//"                                                                    <td>"+item.getModifyDate()+"</td>\n" +
//"                                                                    <td>"+item.getModifyBy()+"</td>\n" +
//"                                                                    <td>\n" +
//"                                                                        <div class=\"dropdown\">\n" +
//"                                                                            <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">\n" +
//"                                                                                <i class=\"bx bx-dots-vertical-rounded\"></i>\n" +
//"                                                                            </button>\n" +
//"                                                                            <div class=\"dropdown-menu\">\n" +
//"                                                                                <a class=\"dropdown-item\" href=\"editnews?id="+item.getId()+"&mod=1\" ><i class='bx bxs-info-circle me-1'></i>Detail</a>\n" +
//"                                                                                <a class=\"dropdown-item\" href=\"editnews?id="+item.getId()+"\" ><i class=\"bx bx-edit-alt me-1\"></i>Edit</a>\n" +
//"                                                                                <a class=\"dropdown-item\" href=\"news?id="+item.getId()+"\" onclick=\"return confirm('Are you sure you want to delete this item')\"><i class=\"bx bx-trash me-1\"></i>Delete</a>\n" +
//"                                                                            </div>\n" +
//"                                                                        </div>\n" +
//"                                                                    </td>"+
//"                                                                </tr>\n" );
//
//
//            
//        }
//        out.println("                                                        </tbody>\n" +
//"                                                    </table>\n" +
//"                                                </div>");
//    }
//      
        tableRows += "<nav aria-label=\"Page navigation\">\n"
                + "                                                    <ul class=\"pagination justify-content-center\">\n";
        int totalPages = (int) Math.ceil((double) list.size() / pageSize);
        for (int i = 1; i <= totalPages; i++) {
            if (pageNumber == i) {
                tableRows += "<li class=\"page-item active\">\n";
            } else {
                tableRows += "<li class=\"page-item \">\n";
            }
            tableRows += "                                                                <a class=\"page-link\" onclick=\"goToPage(" + i + ")\"\n"
                    + "                                                                   >" + i + "</a>\n"
                    + "                                                            </li>\n";

        }
        tableRows += "</ul>\n"
                + "                                                </nav>";
        ResponseData responseData = new ResponseData(tableRows, totalPages);

        // Convert the response object to JSON
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(responseData);

        // Send the JSON response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse);
    }

    class ResponseData {

        private String tableRows;
        private int totalPages;

        public ResponseData(String tableRows, int totalPages) {
            this.tableRows = tableRows;
            this.totalPages = totalPages;
        }

        public String getTableRows() {
            return tableRows;
        }

        public int getTotalPages() {
            return totalPages;
        }
    }
}

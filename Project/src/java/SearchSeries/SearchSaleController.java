/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SearchSeries;

import Model.News;
import Model.Orders;
import Model.Warranty;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minhn
 */
public class SearchSaleController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        req.setCharacterEncoding("UTF-8");
        String txtSearch = req.getParameter("txt");
        int pageNumber = 1;
        if(req.getParameter("page")!=null){
            pageNumber = Integer.parseInt(req.getParameter("page"));
        }
        int pageSize = 15;
        System.out.println(txtSearch);
        String categoryIdParam = req.getParameter("category");
        String tableRows = "";
        int categoryId = 0;
        if (categoryIdParam != null) {
            categoryId = Integer.parseInt(categoryIdParam);
        }
        System.out.println(categoryId);
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = 0;
//        int count = 1;
        int count = (pageNumber - 1) * 15 + 1;
        if (req.getParameter("mode") != null) {
            int choice = Integer.parseInt(req.getParameter("mode"));
            List<Orders> orders = new ArrayList<>();
            Orders o = new Orders();
            //Lay thong tin ve doanh thu cua ngay tu database
            int today = o.todaySale();
            //Lay thong tin ve doanh thu cua thang tu database
            int month = o.monthlySale();
            //Lay thong tin ve doanh thu cua nam ngoai tu database
            int lastYear = o.lastYearSale();
            //Lay thong tin ve doanh thu cua nam nay tu database
            int year = o.yearSale();

            //Confiugre the money format
            String today_revenue = o.moneyconfig(today);
            String month_revenue = o.moneyconfig(month);
            String lastYear_revenue = o.moneyconfig(lastYear);
            String year_revenue = o.moneyconfig(year);

            req.setAttribute("today", today_revenue);
            req.setAttribute("month", month_revenue);
            req.setAttribute("lastYear", lastYear_revenue);
            req.setAttribute("year", year_revenue);
            int totalPages = 0;
            switch (choice) {
                case 0:
                    String search = txtSearch;
                    switch (categoryId) {
                        case 0:
                            orders = o.getOrderList();
                            break;
                        case 1:
                            orders = o.getOrderByCustomerName(search);
                            req.setAttribute("orders", orders);
                            req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                            break;
                        case 2:
                            orders = o.getOrderByOrderId(search);
                            req.setAttribute("orders", orders);
                            req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                            break;
                        case 3:
                            orders = o.getOrderByPhone(search);
                            req.setAttribute("orders", orders);
                            req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                            break;
                    }
                    endIndex = Math.min(startIndex + pageSize, orders.size());
                    List<Orders> currentPageOrders = orders.subList(startIndex, endIndex);

                    tableRows = "<div class=\"table-responsive\">\n"
                            + "                                <table class=\"table text-start align-middle table-bordered table-hover mb-0\">\n"
                            + "                                    <thead>\n"
                            + "                                        <tr class=\"text-dark\">\n"
                            + "                                            <th scope=\"col\">Order ID</th>\n"
                            + "                                            <th scope=\"col\">Customer Name</th>\n"
                            + "                                            <th scope=\"col\">Purchase Date</th>\n"
                            + "                                            <th scope=\"col\">Total Price</th>\n"
                            + "                                        </tr>\n"
                            + "                                    </thead>\n"
                            + "                                    <tbody>";
                    for (Orders item : currentPageOrders) {
                        tableRows += "<tr>\n"
                                + "                                                <td>" + item.getOrderID() + "</td>\n"
                                + "                                                <td>" + item.getCustomerName() + "</td>\n"
                                + "                                                <td>" + item.getPurchaseDate() + "</td>\n"
                                + "                                                <td>VND " + item.getTotalPriceConfig() + "</td>\n"
                                + "                                                <td><a class=\"btn btn-sm btn-primary\" href=\"saleRedirect?mode=9&id=" + item.getOrderID() + "\">Details</a></td>\n"
                                + "                                            </tr>\n";
                    }
                    tableRows += "                                                        </tbody>\n"
                            + "                                                    </table>\n"
                            + "                                                </div>\n";

                    tableRows += "<nav aria-label=\"Page navigation\">\n"
                            + "                                                    <ul class=\"pagination justify-content-center\">\n";
                    totalPages = (int) Math.ceil((double) orders.size() / pageSize);
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

                    totalPages = (int) Math.ceil((double) orders.size() / pageSize);
//                    req.setAttribute("orders", orders);
//                    req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                    break;

                case 1:
                    search = txtSearch;
                    switch (categoryId) {
                        case 0:
                            orders = o.getOrderManagement();
                            break;
                        case 1:
                            orders = o.getOrderManagementByCustomerName(search);
                            req.setAttribute("orders", orders);
                            req.getRequestDispatcher("OrderManagement.jsp").forward(req, resp);
                            break;
                        case 2:
                            orders = o.getOrderManagementByOrderId(search);
                            req.setAttribute("orders", orders);
                            req.getRequestDispatcher("OrderManagement.jsp").forward(req, resp);
                            break;
                        case 3:
                            orders = o.getOrderManagementByPhone(search);
                            req.setAttribute("orders", orders);
                            req.getRequestDispatcher("OrderManagement.jsp").forward(req, resp);
                            break;
                    }
                    endIndex = Math.min(startIndex + pageSize, orders.size());
                    currentPageOrders = orders.subList(startIndex, endIndex);
                    tableRows = "";
                    tableRows = "<div class=\"table-responsive\">\n"
                            + "                                    <form action=\"saleRedirect\" method=\"post\">\n"
                            + "                                        <table class=\"table text-start align-middle table-bordered table-hover mb-0\">\n"
                            + "                                            <thead>\n"
                            + "                                                <tr class=\"text-dark\">\n"
                            + "                                                    <th scope=\"col\">No. </th>\n"
                            + "                                                    <th scope=\"col\">Invoice ID</th>\n"
                            + "                                                    <th scope=\"col\">Customer Name</th>\n"
                            + "                                                    <th scope=\"col\">Purchase Date</th>\n"
                            + "                                                    <th scope=\"col\">Status</th>\n"
                            + "                                                    <th scope=\"col\">Submit</th>\n"
                            + "                                                </tr>\n"
                            + "                                            </thead>\n"
                            + "                                            <tbody>\n";
                    for (Orders item : currentPageOrders) {
                        tableRows += "<tr>\n"
                                + "                                                    <td>" + count + "</td>\n"
                                + "                                                    <td>" + item.getOrderID() + "</td>\n"
                                + "                                                    <td>" + item.getCustomerName() + "</td>\n"
                                + "                                                    <td>" + item.getPurchaseDate() + "</td>\n"
                                + "                                                    <td>\n";
                        String status = item.getStatus();
                        if (status.equalsIgnoreCase("Order has been delivered & paid")) {
                            tableRows += "<input type=\"radio\" value=\"0\" name =\"status_" + item.getOrderID() + "\" checked=\"checked\"/> Order has been delivered & paid<br/>\n";
                        } else {
                            tableRows += "<input type=\"radio\" value=\"0\" name =\"status_" + item.getOrderID() + "\"/> Order has been delivered & paid<br/>\n";
                        }

                        if (status.equalsIgnoreCase("Order has been placed")) {
                            tableRows += "<input type=\"radio\" value=\"1\" name =\"status_" + item.getOrderID() + "\" checked=\"checked\"/> Order has been placed<br/>\n";
                        } else {
                            tableRows += "<input type=\"radio\" value=\"1\" name =\"status_" + item.getOrderID() + "\"/> Order has been placed<br/>\n";
                        }

                        if (status.equalsIgnoreCase("Order has been received")) {
                            tableRows += "<input type=\"radio\" value=\"2\" name =\"status_" + item.getOrderID() + "\" checked=\"checked\"/> Order has been received<br/>\n";
                        } else {
                            tableRows += "<input type=\"radio\" value=\"2\" name =\"status_" + item.getOrderID() + "\"/> Order has been received<br/>\n";
                        }

                        if (status.equalsIgnoreCase("Order has been shipped")) {
                            tableRows += "<input type=\"radio\" value=\"3\" name =\"status_" + item.getOrderID() + "\" checked=\"checked\"/> Order has been shipped<br/>\n";
                        } else {
                            tableRows += "<input type=\"radio\" value=\"3\" name =\"status_" + item.getOrderID() + "\"/> Order has been shipped<br/>\n";
                        }

                        if (status.equalsIgnoreCase("Order cancellation requested")) {
                            tableRows += "<input type=\"radio\" value=\"4\" name =\"status_" + item.getOrderID() + "\" checked=\"checked\"/> Order cancellation requested<br/>\n";
                        } else {
                            tableRows += "<input type=\"radio\" value=\"4\" name =\"status_" + item.getOrderID() + "\"/> Order cancellation requested<br/>\n";
                        }

                        if (status.equalsIgnoreCase("Order cancelled")) {
                            tableRows += "<input type=\"radio\" value=\"5\" name =\"status_" + item.getOrderID() + "\" checked=\"checked\"/> Order cancelled<br/>\n";
                        } else {
                            tableRows += "<input type=\"radio\" value=\"5\" name =\"status_" + item.getOrderID() + "\"/> Order cancelled<br/>\n";
                        }
                        count++;
                        tableRows += "</td>\n"
                                + "                                                    <td><input type=\"submit\" value=\"Update\" name=\"submit\"></td>\n"
                                + "                                                </tr>\n";
                    }

                    tableRows += "                                        </tbody>\n"
                            + "                                    </table>\n"
                            + "                                     </form>\n"
                            + "                                </div>\n";

                    tableRows += "<nav aria-label=\"Page navigation\">\n"
                            + "                                                    <ul class=\"pagination justify-content-center\">\n";
                    totalPages = (int) Math.ceil((double) orders.size() / pageSize);
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
                    totalPages = (int) Math.ceil((double) orders.size() / pageSize);
//                    req.setAttribute("orders", orders);
//                    req.getRequestDispatcher("OrderManagement.jsp").forward(req, resp);
                    break;

                case 2:
                    search = txtSearch;
                    Warranty w = new Warranty();
                    List<Warranty> warranty = new ArrayList<>();
                    switch (categoryId) {
                        case 0:
                            warranty = w.getFixHistoryList();
                            break;
                        case 1:
                            warranty = w.getFixHistoryListByCustomerName(search);
                            req.setAttribute("warranty", warranty);
                            req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                            break;
                        case 2:
                            warranty = w.getFixHistoryListByOrderId(search);
                            req.setAttribute("warranty", warranty);
                            req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                            break;
                        case 3:
                            warranty = w.getFixHistoryListByPhone(search);
                            req.setAttribute("warranty", warranty);
                            req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                            break;
                    }
                    endIndex = Math.min(startIndex + pageSize, orders.size());
                    List<Warranty> currentPageWarranty = warranty.subList(startIndex, endIndex);

                    tableRows = "<div class=\"table-responsive\">\n"
                            + "                                <table class=\"table text-start align-middle table-bordered table-hover mb-0\">\n"
                            + "                                    <thead>\n"
                            + "                                        <tr class=\"text-dark\">\n"
                            + "                                            <th scope=\"col\">No. </th>\n"
                            + "                                            <th scope=\"col\">Product ID</th>\n"
                            + "                                            <th scope=\"col\">Customer Name</th>\n"
                            + "                                            <th scope=\"col\">Purchase Date</th>\n"
                            + "                                            <th scope=\"col\">Fix Date</th>\n"
                            + "                                        </tr>\n"
                            + "                                    </thead>\n"
                            + "                                    <tbody>";
                    for (Warranty item : currentPageWarranty) {
                        tableRows += "<tr>\n"
                                + "                                                 <td>" + count + "</td>\n"
                                + "                                                 <td>" + item.getProductId() + "</td>\n"
                                + "                                                <td>" + item.getCustomerName() + "</td>\n"
                                + "                                                <td>" + item.getPurchaseDate() + "</td>\n"
                                + "                                                <td>" + item.getModifiedDate() + "</td>\n"
                                + "                                                <td><a class=\"btn btn-sm btn-primary\" href=\"saleRedirect?mode=11&productId=" + item.getProductId() + "\">Details</a></td>\n"
                                + "                                            </tr>\n";
                    }
                    tableRows += "                                                        </tbody>\n"
                            + "                                                    </table>\n"
                            + "                                                </div>\n";

                    tableRows += "<nav aria-label=\"Page navigation\">\n"
                            + "                                                    <ul class=\"pagination justify-content-center\">\n";
                    totalPages = (int) Math.ceil((double) orders.size() / pageSize);
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

                    totalPages = (int) Math.ceil((double) warranty.size() / pageSize);
//                    req.setAttribute("warranty", warranty);
//                    req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                    break;
            }

            ResponseData responseData = new ResponseData(tableRows, totalPages);

            // Convert the response object to JSON
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(responseData);

            // Send the JSON response
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonResponse);

        }
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
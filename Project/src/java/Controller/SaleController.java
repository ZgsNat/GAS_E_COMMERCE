/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Admin;
import Model.Orders;
import Model.Warranty;
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
public class SaleController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("submit") != null) {
            Orders o = new Orders();
            int orderSize = o.getOrderSize();
            int orderTotal[] = new int[orderSize];
            orderTotal = o.getAllOrderID(orderSize);

            int status =1;
            for (int id : orderTotal) {
                if(req.getParameter("status_" + id) != null)
                if ( req.getParameter("status_" + id).equals("0")) {
                    status = 0;
                }
                else if (req.getParameter("status_" + id).equals("1")) {
                    status = 1;
                }
                else if (req.getParameter("status_" + id).equals("2")) {
                    status = 2;
                }
                
                else if (req.getParameter("status_" + id).equals("3")) {
                    status = 3;
                }
                
                else if (req.getParameter("status_" + id).equals("4")) {
                    status = 4;
                }
                
                else {
                    status = 5;
                }

                o.setOrderID(id);
                o.setStatus(status + "");
                o.updateStatus();
            }
        }
        resp.sendRedirect("saleRedirect?mode=8");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("mode") != null) {
            Orders o = new Orders();
            Warranty w = new Warranty();
            int mode = Integer.parseInt(req.getParameter("mode"));
            //Redirect to display the today's sale
            switch (mode) {
                case 0:
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

                    List<Orders> orders = new ArrayList<>();
                    orders = o.getTodayOrderList();
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                    break;

                case 1:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orders = o.getMonthOrderList();
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                    break;

                case 2:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orders = o.getLastYearOrderList();
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                    break;

                case 3:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orders = o.getYearOrderList();
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);

                case 4:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);
                    String page = req.getParameter("page");
                    if (page == null) {
                        page = "1";
                    }
                    int indexPage = Integer.parseInt(page);
                    int endPage = o.getNumberPage();
                    orders = o.getOrderList(indexPage);
                    req.setAttribute("endPage", endPage);
                    req.setAttribute("page", indexPage);
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("showAllSales.jsp").forward(req, resp);
                    break;

                case 5:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    int orderId = Integer.parseInt(req.getParameter("orderId"));

                    w.setOrderId(orderId);
                    List<Warranty> warranty = new ArrayList<>();
                    warranty = w.getWarrantyInfo();
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("WarrantyInfo.jsp").forward(req, resp);
                    break;

                case 6:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orderId = Integer.parseInt(req.getParameter("orderId"));

                    w.setOrderId(orderId);
                    List<Warranty> order = new ArrayList<>();
                    warranty = w.getWarrantyHistory();
                    order = w.getOrderInfo();
                    req.setAttribute("warranty", warranty);
                    req.setAttribute("order", order);
                    req.getRequestDispatcher("FixHistory.jsp").forward(req, resp);
                    break;

                case 7:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    page = req.getParameter("page");
                    if (page == null) {
                        page = "1";
                    }
                    indexPage = Integer.parseInt(page);
                    endPage = w.getNumberPage();
                    warranty = w.getFixHistoryList(indexPage);
                    req.setAttribute("endPage", endPage);
                    req.setAttribute("page", indexPage);
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                    break;

                case 8:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    page = req.getParameter("page");
                    if (page == null) {
                        page = "1";
                    }
                    indexPage = Integer.parseInt(page);
                    endPage = o.getNumberPage();
                    orders = o.getOrderManagement(indexPage);
                    req.setAttribute("endPage", endPage);
                    req.setAttribute("page", indexPage);
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("OrderManagement.jsp").forward(req, resp);
                    break;

                case 9:
                    if (!req.getParameter("id").isEmpty()) {
                        int orderID = Integer.parseInt(req.getParameter("id"));
                        //Lay thong tin ve doanh thu cua ngay tu database
                        today = o.todaySale();
                        //Lay thong tin ve doanh thu cua thang tu database
                        month = o.monthlySale();
                        //Lay thong tin ve doanh thu cua nam ngoai tu database
                        lastYear = o.lastYearSale();
                        //Lay thong tin ve doanh thu cua nam nay tu database
                        year = o.yearSale();

                        //Confiugre the money format
                        today_revenue = o.moneyconfig(today);
                        month_revenue = o.moneyconfig(month);
                        lastYear_revenue = o.moneyconfig(lastYear);
                        year_revenue = o.moneyconfig(year);

                        req.setAttribute("today", today_revenue);
                        req.setAttribute("month", month_revenue);
                        req.setAttribute("lastYear", lastYear_revenue);
                        req.setAttribute("year", year_revenue);

                        orders = o.getOrderDetails(orderID);
                        req.setAttribute("orders", orders);
                        req.getRequestDispatcher("saleDetails.jsp").forward(req, resp);
                    }
                    break;

                case 10:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orders = o.getOrderManagement();
                    req.setAttribute("orders", orders);
                    req.getRequestDispatcher("CreateOrder.jsp").forward(req, resp);
                    break;

                case 11:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    int productId = Integer.parseInt(req.getParameter("productId"));
                    w.setProductId(productId);
                    warranty = w.getFixHistoryList2();
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("FixHistoryProductSeries.jsp").forward(req, resp);
                    break;

                case 12: //Chua hoan thien
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orderId = Integer.parseInt(req.getParameter("orderId"));
                    int series = Integer.parseInt(req.getParameter("series"));
                    String productName = req.getParameter("productName");
                    productId = Integer.parseInt(req.getParameter("productId"));
                    w.setProductName(productName);
                    System.out.println("productID:" + productId);

                    w.setOrderId(orderId);
                    warranty = w.getWarrantyHistory2(orderId, series, productId);
                    order = w.getOrderInfo();
                    req.setAttribute("warranty", warranty);
                    req.setAttribute("order", order);
                    req.getRequestDispatcher("FixHistoryDetail.jsp").forward(req, resp);
                    break;

                case 13:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    if (req.getParameter("search") != null && req.getParameter("orderId") != null) {
                        orderId = Integer.parseInt(req.getParameter("orderId"));
                    }

                    orderId = Integer.parseInt(req.getParameter("orderId"));
                    series = Integer.parseInt(req.getParameter("series"));
                    productId = Integer.parseInt(req.getParameter("productId"));
                    String fixDate = req.getParameter("fixDate");
                    String note = req.getParameter("note");
                    String description = req.getParameter("description");
                    String location = req.getParameter("location");
                    int quantity = Integer.parseInt(req.getParameter("quantity"));
                    int price = Integer.parseInt(req.getParameter("price"));

                    w.setOrderId(orderId);
                    w.setProductId(productId);
                    w.setProductSeries(series);
                    int customerId = o.getCustomerIDByOrder(orderId);
                    w.setCustomerId(customerId);
                    w.setCustomerId(customerId);
                    w.setModifiedDate(fixDate);
                    w.setNote(note);
                    w.setQuantity(quantity);
                    w.setLocation(location);
                    w.setMalfunctionDesc(description);
                    w.setPrice(price);

                    w.addFixHistory();

                    warranty = w.getFixHistoryList();
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                    break;

                case 14:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orderId = Integer.parseInt(req.getParameter("orderId"));
                    productId = Integer.parseInt(req.getParameter("productId"));
                    series = Integer.parseInt(req.getParameter("series"));
                    w.setProductId(productId);
                    w.setOrderId(orderId);
                    w.setProductSeries(series);
                    w.removeFixHistory();

                    page = req.getParameter("page");
                    if (page == null) {
                        page = "1";
                    }
                    indexPage = Integer.parseInt(page);
                    endPage = w.getNumberPage();
                    warranty = w.getFixHistoryList(indexPage);
                    req.setAttribute("endPage", endPage);
                    req.setAttribute("page", indexPage);
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                    break;

                case 15:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orderId = Integer.parseInt(req.getParameter("orderId"));
                    productName = req.getParameter("productName");
                    series = Integer.parseInt(req.getParameter("series"));
                    String customerName = req.getParameter("customer");
                    note = req.getParameter("note");
                    description = req.getParameter("description");
                    location = req.getParameter("location");
                    quantity = Integer.parseInt(req.getParameter("quantity"));
                    price = Integer.parseInt(req.getParameter("price"));

                    w.setOrderId(orderId);
                    w.setProductName(productName);
                    w.setCustomerName(customerName);
                    w.setProductSeries(series);
                    customerId = w.getCustomerIdDB(customerName);
                    w.setCustomerId(customerId);
                    w.setNote(note);
                    w.setQuantity(quantity);
                    w.setLocation(location);
                    w.setMalfunctionDesc(description);
                    w.setPrice(price);
                    w.udpateFixHistory();

                    warranty = w.getFixHistoryList();
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("FixHistoryList.jsp").forward(req, resp);
                    break;

                case 16:
                    //Lay thong tin ve doanh thu cua ngay tu database
                    today = o.todaySale();
                    //Lay thong tin ve doanh thu cua thang tu database
                    month = o.monthlySale();
                    //Lay thong tin ve doanh thu cua nam ngoai tu database
                    lastYear = o.lastYearSale();
                    //Lay thong tin ve doanh thu cua nam nay tu database
                    year = o.yearSale();

                    //Confiugre the money format
                    today_revenue = o.moneyconfig(today);
                    month_revenue = o.moneyconfig(month);
                    lastYear_revenue = o.moneyconfig(lastYear);
                    year_revenue = o.moneyconfig(year);

                    req.setAttribute("today", today_revenue);
                    req.setAttribute("month", month_revenue);
                    req.setAttribute("lastYear", lastYear_revenue);
                    req.setAttribute("year", year_revenue);

                    orderId = Integer.parseInt(req.getParameter("orderId"));
                    productId = Integer.parseInt(req.getParameter("productId"));
                    series = Integer.parseInt(req.getParameter("series"));
                    w.setProductId(productId);
                    w.setOrderId(orderId);
                    w.setProductSeries(series);

                    warranty = w.getWarrantyHistory3(orderId, series, productId);
                    req.setAttribute("orderId", orderId);
                    req.setAttribute("warranty", warranty);
                    req.getRequestDispatcher("UpdateFixHistory.jsp").forward(req, resp);
                    break;
            }
        }
    }

}
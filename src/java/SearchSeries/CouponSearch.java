package SearchSeries;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Coupon;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author CAT PHUONG
 */
public class CouponSearch extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        int npp = Integer.parseInt(req.getParameter("npp"));
        int status = Integer.parseInt(req.getParameter("status"));
        int nextp = Integer.parseInt(req.getParameter("nextp"));
        int curp = nextp;
        System.out.println("Search");
        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

        data = cou.searchCoupon(startDate, endDate, name, status);
//        System.out.println(data.size());
        int maxp = (data.size() - 1) / npp + 1;
//        System.out.println("maxp " + maxp);
        data = cou.getDataPage(nextp, data, npp);

//        System.out.println("maxp " + maxp);
        PrintWriter out = resp.getWriter();

        out.print("<div class=\"table-responsive\">\n"
                + "                                        <table class=\"table text-end-center\">\n"
                + "                                            <thead class=\"table-light\">\n"
                + "                                                <tr class=\"text-dark\">\n"
                + "                                                    <th style=\"table-layout: fixed; width: 15%\">Code</th>\n"
                + "                                                    <th style=\"table-layout: fixed; max-width:300px;width: 25% \">Message</th>\n"
                + "                                                    <th style=\"table-layout: fixed; width: 10%\">Valid from</th>\n"
                + "                                                    <th style=\"table-layout: fixed; width: 10%\">Valid to</th>\n"
                + "                                                    <th style=\"table-layout: fixed; width: 15%\"><a\n"
                + "                                                            class=\"dropdown-toggle\"\n"
                + "                                                            data-bs-toggle=\"dropdown\"\n"
                + "                                                            aria-expanded=\"false\"\n"
                + "                                                            >Status</a>\n"
                + "                                                        <ul class=\"dropdown-menu\">\n"
                + "                                                            <li><a class=\"dropdown-item\" onclick=\"change2(-1)\"><span class=\"badge bg-label-info\" >All</span></a></li>\n"
                + "                                                            <li><a class=\"dropdown-item\" onclick=\"change2(0)\"><span class=\"badge bg-label-dark\" >Not Avail</span></a></li>\n"
                + "                                                            <li><a class=\"dropdown-item\" onclick=\"change2(1)\"><span class=\"badge bg-label-primary\" >Available</span></a></li>\n"
                + "                                                            <li><a class=\"dropdown-item\" onclick=\"change2(2)\"><span class=\"badge bg-label-success\" >In usage</span></a></li>\n"
                + "                                                            <li><a class=\"dropdown-item\" onclick=\"change2(3)\"><span class=\"badge bg-label-danger\" >Banned</span></a></li>\n"
                + "                                                            <li><a class=\"dropdown-item\" onclick=\"change2(4)\"><span class=\"badge bg-label-secondary\" >Outdated</span></a></li>\n"
                + "                                                        </ul>\n"
                + "                                                    </th>\n"
                + "                                                    <th style=\"table-layout: fixed; width: 10%\">Free</th>\n"
                + "                                                    <th style=\"table-layout: fixed; width: 15%\">Action</th>\n"
                + "                                                </tr>\n"
                + "                                            </thead>\n"
                + "                                            <tbody class=\"table-border-bottom-0\">\n");
        //table body
        for (Coupon s : data) {
            out.println("<tr>\n"
                    + "     <td>" + s.getName() + "</td>\n"
                    + "     <td style=\"table-layout: fixed; max-width:300px \">" + s.getMessage() + "</td>\n"
                    + "     <td>" + s.getValid_fromString() + "</td>\n"
                    + "     <td>" + s.getValid_fromString() + "</td>\n");
            if (s.getStatus() == 0) {
                out.println("<td><span class=\"badge bg-label-dark\" >Not Avail</span></td>\n");
            }
            if (s.getStatus() == 1) {
                out.println("<td><span class=\"badge bg-label-primary\" >Available</span></td>\n");
            }
            if (s.getStatus() == 2) {
                out.println("<td><span class=\"badge bg-label-success\" >In usage</span></td>\n");
            }
            if (s.getStatus() == 3) {
                out.println("<td><span class=\"badge bg-label-danger\" >Banned</span></td>\n");
            }
            if (s.getStatus() == 4) {
                out.println("<td><span class=\"badge bg-label-secondary\" >Outdated</span></td>\n");
            }

            out.println("<td>" + s.isFree_check() + "</td>\n");
            out.print("<td><div style=\"display: inline-flex\">\n"
                    + "                                                                        <a class=\"btn btn-icon btn-sm\" onclick=\"editCoupon('" + s.getId() + "', 'update')\"\n"
                    + "                                                                           ><i class=\"bx bx-edit-alt me-1\"></i></a\n"
                    + "                                                                        >\n"
                    + "                                                                        <a class=\"btn btn-icon btn-sm\"  onclick=\"editCoupon('" + s.getId() + "', 'delete')\"\n"
                    + "                                                                           ><i class=\"bx bx-trash me-1\"></i></a\n"
                    + "                                                                        >\n"
                    + "                                                                        <a class=\"btn btn-icon btn-sm\" onclick=\"editCoupon('" + s.getId() + "', 'detail')\"\n"
                    + "                                                                           ><i class='bx bxs-info-circle me-1'></i></a\n"
                    + "                                                                        >\n"
                    + "                                                                        <a class=\"btn btn-icon btn-sm\" onclick=\"customersPromotion('" + s.getId() + "')\"\n"
                    + "                                                                           ><i class='bx bxs-discount me-1'></i></a\n"
                    + "                                                                        >\n"
                    + "                                                                    </div>\n"
                    + "                                                        </td>\n");

        }
        out.print("                                        </tbody>\n"
                + "                                        </table>\n"
                + "                                        <h5 class=\"card-header\"></h5>\n"
                + "                                    </div>\n");
        //Pagination
        out.print(
                "                                    <!-- Pagination -->\n"
                + "                                    <nav aria-label=\"Page navigation\">\n"
                + "                                        <ul class=\"pagination pagination-sm justify-content-end\">\n");
        if (curp == 1) {
            out.print("                                                    <li class=\"page-item prev\">\n"
                    + "                                                        <a class=\"page-link disabled\" href=\"javascript:void(0);\"\n"
                    + "                                                           ><i class=\"tf-icon bx bx-chevrons-left\"></i\n"
                    + "                                                            ></a>\n"
                    + "                                                    </li>\n"
                    + "                                                    <li class=\"page-item active\">\n"
                    + "                                                        <a class=\"page-link disabled\">1</a>\n"
                    + "                                                    </li>\n");
        } else {
            out.print("                                                    <li class=\"page-item\">\n"
                    + "                                                        <button class=\"page-link\" onclick=\"switchPage(" + (curp - 1) + ")\" >\n"
                    + "                                                            <span aria-hidden=\"true\">&laquo;</span>\n"
                    + "                                                        </button>\n"
                    + "                                                    </li>\n"
                    + "                                                    <li class=\"page-item\">\n"
                    + "                                                        <button onclick=\"switchPage(1)\" class=\"page-link\">1</button>\n"
                    + "                                                    </li>\n");
        }
        if (curp - 2 > 1) {
            out.print("                                                <li class=\"page-item\">\n"
                    + "                                                        <button class=\"page-link disabled\">...</button>\n"
                    + "                                                    </li>");
        }
        for (int i = 2; i < maxp; i++) {
            if (i <= (curp + 1) && i >= (curp - 1)) {
                if (curp == i) {
                    out.print("                                                                <li class=\"page-item active\">\n"
                            + "                                                                    <a class=\"page-link disabled\">" + i + "</a>\n"
                            + "                                                                </li>\n");
                } else {
                    out.print("                    <li class=\"page-item\">\n"
                            + "                   <button onclick=\"switchPage(" + i + ")\" class=\"page-link\">" + i + "</button>\n"
                            + "              </li>\n");
                }
            }
        }
        if (curp + 2 < maxp) {
            out.print("                                                <li class=\"page-item\">\n"
                    + "                                                        <button class=\"page-link disabled\">...</button>\n"
                    + "                                                    </li>");
        }
        if (maxp == 1) {
            out.print("                                                    <li class=\"page-item\">\n"
                    + "                                                        <button class=\"page-link disabled\" >\n"
                    + "                                                            <span aria-hidden=\"true\">&raquo;</span>\n"
                    + "                                                        </button>\n"
                    + "                                                    </li>\n");
        } else if (maxp == curp) {
            out.print("                                                    <li class=\"page-item active\">\n"
                    + "                                                        <a class=\"page-link disabled\">" + maxp + "</a>\n"
                    + "                                                    </li>\n"
                    + "                                                    <li class=\"page-item\">\n"
                    + "                                                        <button class=\"page-link disabled\" >\n"
                    + "                                                            <span aria-hidden=\"true\">&raquo;</span>\n"
                    + "                                                        </button>\n"
                    + "                                                    </li>\n");
        } else {
            out.print("<li class=\"page-item\">\n"
                    + "                                                        <button onclick=\"switchPage(" + maxp + ")\" class=\"page-link\">" + maxp + "</button>\n"
                    + "                                                    </li>\n"
                    + "                                                    <li class=\"page-item\">\n"
                    + "                                                        <button class=\"page-link\" onclick=\"switchPage(" + (curp + 1) + ")\" >\n"
                    + "                                                            <span aria-hidden=\"true\">&raquo;</span>\n"
                    + "                                                        </button>\n"
                    + "                                                    </li>\n");
        }
        out.print("                                        </ul>\n"
                + "                                    </nav>");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        int npp = Integer.parseInt(req.getParameter("npp"));
        int nextp = Integer.parseInt(req.getParameter("nextp"));

//        System.out.println("Search");
        Coupon cou = new Coupon();
        List<Coupon> data = cou.getAllCoupon();

        data = cou.searchCoupon(startDate, endDate, name, -1);
        System.out.println(data.size());
        int maxp = (data.size() - 1) / npp + 1;
        System.out.println("maxp " + maxp);
        data = cou.getDataPage(nextp, data, npp);
        req.setAttribute("Name", name);
        req.setAttribute("start", startDate);
        req.setAttribute("end", endDate);
        req.setAttribute("curp", nextp);
        req.setAttribute("maxp", maxp);
        req.setAttribute("data", data);
        req.setAttribute("npp", npp);
        //req.setAttribute("data", data);
        req.getRequestDispatcher("jsp/Coupon/couponList.jsp").forward(req, resp);
    }

}

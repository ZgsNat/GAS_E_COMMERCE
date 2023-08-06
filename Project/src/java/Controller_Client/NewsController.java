/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Client;

import Model.Admin;
import Model.News;
import Model.NewsCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author myth
 */
public class NewsController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        News n = new News();
        ArrayList<News> data = new ArrayList<>();
        String page = req.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int endPage = 0;
        int indexPage = Integer.parseInt(page);
        if (req.getParameter("cid") != null && !req.getParameter("cid").equals("")) {
            data = n.GetNewsByCategory(Integer.parseInt(req.getParameter("cid")), indexPage);
            Admin a = new Admin();
            for (News ns : data) {
                ns.setCreateBy(a.getAdminName(Integer.parseInt(ns.getCreateBy())));
                if (ns.getModifyBy() != null) {
                    ns.setModifyBy(a.getAdminName(Integer.parseInt(ns.getModifyBy())));
                } else {
                    ns.setModifyBy("N/A");
                }
            }
            endPage = n.getNumberPage1(req.getParameter("cid"));
            NewsCategory cate = new NewsCategory();
            cate.GetCate(req.getParameter("cid"));
            System.out.println(endPage);
            NewsCategory nc = new NewsCategory();
            List<NewsCategory> lstCate = nc.GetCategory();
            req.setAttribute("Cate", lstCate);
            req.setAttribute("url", slugify(cate.getName()));
            req.setAttribute("cID", req.getParameter("cid"));
            req.setAttribute("endPage", endPage);
            req.setAttribute("page", indexPage);
            req.setAttribute("data", data);
            req.getRequestDispatcher("Client/News.jsp").forward(req, resp);
        } else {
            System.out.println("chua co id");
            data = n.GetNewsPage(indexPage);
            Admin a = new Admin();
            for (News ns : data) {
                ns.setCreateBy(a.getAdminName(Integer.parseInt(ns.getCreateBy())));
                if (ns.getModifyBy() != null) {
                    ns.setModifyBy(a.getAdminName(Integer.parseInt(ns.getModifyBy())));
                } else {
                    ns.setModifyBy("N/A");
                }
            }
            NewsCategory nc = new NewsCategory();
            List<NewsCategory> lstCate = nc.GetCategory();
            for (NewsCategory newsCategory : lstCate) {
                System.out.println(newsCategory.getId());
            }
            req.setAttribute("Cate", lstCate);
            endPage = n.getNumberPage();
            req.setAttribute("url", "Tin-tuc");
            req.setAttribute("endPage", endPage);
            req.setAttribute("page", indexPage);
            req.setAttribute("data", data);
            req.getRequestDispatcher("Client/News.jsp").forward(req, resp);
        }
    }

    public String slugify(String a) {
        // Loại bỏ các ký tự không hợp lệ và dấu
        String noAccent = Normalizer.normalize(a, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");

        // Chuyển đổi thành chữ thường
        String lowerCase = noAccent.toLowerCase();

        // Thay thế khoảng trắng bằng dấu gạch ngang
        String slug = lowerCase.replaceAll("\\s+", "-");

        // Xử lý trường hợp có nhiều dấu gạch ngang liền nhau
        slug = slug.replaceAll("-{2,}", "-");

        return slug;
    }
}

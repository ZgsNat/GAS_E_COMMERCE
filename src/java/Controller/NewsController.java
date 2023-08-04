/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Admin;
import Model.News;
import Model.NewsCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author myth
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class NewsController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String title = req.getParameter("title");
        String uploadPath = getServletContext().getRealPath("") + "/uploads";
        String uploadPath1 = getServletContext().getRealPath("") + "../../web/uploads";
        String editorContent = req.getParameter("editor_text");
        LocalDateTime currentDateTime = LocalDateTime.now();

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        File uploadDir1 = new File(uploadPath1);
        if (!uploadDir1.exists()) {
            uploadDir1.mkdir();
        }
        String imageName = "image_" + System.currentTimeMillis() + ".jpg";

        Part thumbnail = req.getPart("thumbnail");
        thumbnail.write(uploadPath + File.separator + imageName);
        thumbnail.write(uploadPath1 + File.separator + imageName);

        String Summary = req.getParameter("summary");
        int Category = Integer.parseInt(req.getParameter("Category"));
        News n = new News(title, currentDateTime.toString(), "", session.getAttribute("id").toString(), "", imageName, editorContent, Category,Summary);
        n.AddNews();
        String page = req.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int indexPage = Integer.parseInt(page);

        ArrayList<News> data = n.GetNewsPage(indexPage);
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
        int endPage = n.getNumberPage();
        req.setAttribute("endPage", endPage);
        req.setAttribute("page", indexPage);
        req.setAttribute("Category", lstCate);
        req.setAttribute("data", data);
        req.getRequestDispatcher("ListNews.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        //Redirect if it doesn't have the permission
        if (session.getAttribute("mode") != null) {
            String mode = (String) session.getAttribute("mode");
            if (!mode.contains("5") && !mode.equals("0")) {
                if (mode.contains("1")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("general").forward(req, resp);
                } else if (mode.contains("2")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("productInfo").forward(req, resp);
                } else if (mode.contains("3")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("customerInfo").forward(req, resp);
                } else if (mode.contains("4")) {
                    req.setAttribute("accessError", "You don't have access to this!");
                    req.getRequestDispatcher("coupon_admin").forward(req, resp);
                }
            } else {
                NewsCategory nc = new NewsCategory();
                List<NewsCategory> lstCate = nc.GetCategory();

                req.setAttribute("Category", lstCate);
                if (req.getParameter("mod") != null) {

                    req.getRequestDispatcher("news.jsp").forward(req, resp);
                } else {
                    News n = new News();
                    if (req.getParameter("id") != null) {
                        int id = Integer.parseInt(req.getParameter("id"));
                        n.delete(id);
                    }
                    String page = req.getParameter("page");
                    if (page == null) {
                        page = "1";
                    }
                    int indexPage = Integer.parseInt(page);

                    ArrayList<News> data = n.GetNewsPage(indexPage);
                    Admin a = new Admin();
                    for (News ns : data) {
                        ns.setCreateBy(a.getAdminName(Integer.parseInt(ns.getCreateBy())));
                        if (ns.getModifyBy() != null) {
                            ns.setModifyBy(a.getAdminName(Integer.parseInt(ns.getModifyBy())));
                        } else {
                            ns.setModifyBy("N/A");
                        }
                    }
                    int endPage = n.getNumberPage();
                    req.setAttribute("endPage", endPage);
                    req.setAttribute("page", indexPage);
                    req.setAttribute("data", data);
                    req.getRequestDispatcher("ListNews.jsp").forward(req, resp);
                }

            }
        }
    }

}

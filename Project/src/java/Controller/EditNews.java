/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

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
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author myth
 */@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class EditNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String title = req.getParameter("title");
        String editorContent = req.getParameter("editor_text");
        String imageName = req.getParameter("oldImg");
        Part thumbnail = req.getPart("thumbnail");
        System.out.println(imageName);
        if (thumbnail.getSize()>0) {
            String uploadPath = getServletContext().getRealPath("") + "/uploads";
            String uploadPath1 = getServletContext().getRealPath("") + "../../web/uploads";
            
            imageName = "image_" + System.currentTimeMillis() + ".jpg";
            
            thumbnail.write(uploadPath + File.separator + imageName);
            thumbnail.write(uploadPath1 + File.separator + imageName);
        }
        String summary = req.getParameter("summary");
        String id = req.getParameter("id");
        LocalDateTime currentDateTime = LocalDateTime.now();
        int category = Integer.parseInt(req.getParameter("Category"));
        News n = new News(id, title, "", currentDateTime.toString(), "", session.getAttribute("id").toString(), imageName, editorContent, category,summary);
        n.update();
        resp.sendRedirect("news");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        
        News n = new News();
        n.GetNews(id);
        NewsCategory nc = new NewsCategory();
        List<NewsCategory> lstCate = nc.GetCategory();
        req.setAttribute("data", n);
        if (req.getParameter("mod") != null && req.getParameter("mod").equals("1")) {
            req.getRequestDispatcher("DisplayNews.jsp").forward(req, resp);
        } else {
            req.setAttribute("Category", lstCate);
            req.getRequestDispatcher("editnews.jsp").forward(req, resp);
        }

    }

}

package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author mp3th
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class BannerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String uploadPath = getServletContext().getRealPath("") + "/banner";
        String uploadPath1 = getServletContext().getRealPath("") + "../../web/banner";
        File uploadDir = new File(uploadPath);
        News n = new News();
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        File uploadDir1 = new File(uploadPath1);
        if (!uploadDir1.exists()) {
            uploadDir1.mkdir();
        }
        String imageName = "";
        if (req.getPart("banner").getSize() > 0) {
            imageName = "image_" + System.currentTimeMillis() + ".jpg";

            Part banner = req.getPart("banner");
            banner.write(uploadPath + File.separator + imageName);
            banner.write(uploadPath1 + File.separator + imageName);
        } else {
            imageName = req.getParameter("oldBanner");
        }
        if (req.getParameter("mod") != null && req.getParameter("mod").equals("edit")) {

            n.updateBanner(req.getParameter("id"), title, imageName);
        } else {

            n.addBanner(title, imageName);
        }
        resp.sendRedirect("banner");
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
                if (req.getParameter("mod") != null) {
                    if (req.getParameter("mod").equals("add")) {
                        req.getRequestDispatcher("AddBanner.jsp").forward(req, resp);
                    }
                    if (req.getParameter("mod").equals("edit")) {
                        News n = new News();
                        n.getBanner(req.getParameter("id"));
                        req.setAttribute("b", n);
                        req.getRequestDispatcher("EditBanner.jsp").forward(req, resp);

                    }
                    if (req.getParameter("mod").equals("delete")) {
                        News n = new News();
                        n.delete(Integer.parseInt(req.getParameter("id")));
                        List<News> banner = n.getBanner();
                        req.setAttribute("b", banner);
                        req.getRequestDispatcher("Banner.jsp").forward(req, resp);
                    }
                    if (req.getParameter("mod").equals("status")) {
                        System.out.println("doi status");
                        News n = new News();
                        n.getBanner(req.getParameter("id"));
                        n.changeStatus();
                        return;
                    }
                } else {
                    News n = new News();
                    List<News> banner = n.getBanner();
                    req.setAttribute("b", banner);
                    req.getRequestDispatcher("Banner.jsp").forward(req, resp);
                }
            }
        }

    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Admin;
import Model.Category;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Peanut
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class UpdateProduct extends HttpServlet {

    public static final String updateError = "The information cannot be empty!!";
    public static final String updateSuccess = "Product updated successfully!!";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imageName = req.getParameter("smallImg");
        Part image = req.getPart("image");
        if (image.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            String uploadPath1 = getServletContext().getRealPath("") + "../../web/uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            File uploadDir1 = new File(uploadPath1);
            if (!uploadDir1.exists()) {
                uploadDir1.mkdir();
            }

            imageName = "image_" + System.currentTimeMillis() + ".jpg";
            image.write(uploadPath + File.separator + imageName);
            image.write(uploadPath1 + File.separator + imageName);
        }
        if (req.getParameter("update") != null) {
            int pID = Integer.parseInt(req.getParameter("pID"));
            String pName = req.getParameter("pName");
            int cID = Integer.parseInt(req.getParameter("cID"));
            double pPrice = Double.parseDouble(req.getParameter("pPrice"));
            int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
            String pWarranty = req.getParameter("pWarranty");
            String pModifiedByName = req.getParameter("pModifiedBy");
            String pDetail = req.getParameter("pDetail");
            String imageUrl = req.getParameter("imageUrl");
            Admin ad = new Admin();
            int pModifiedByByID = ad.getMidifiedByAdminID(pModifiedByName);

            if (pName.isEmpty() || req.getParameter("cID").isEmpty() || req.getParameter("pPrice").isEmpty() || req.getParameter("pQuantity").isEmpty()
                    || pWarranty.isEmpty()) {
                req.setAttribute("updateError", updateError);
                req.getRequestDispatcher("UpdateProduct.jsp").forward(req, resp);
            } else {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();
                Product p = new Product();
                p.update(pID, pName, cID, pPrice, pQuantity, pWarranty, dtf.format(now), pModifiedByByID, pDetail, imageName);
                Category c = new Category();
                List<Category> data = c.getListCategory();
                List<Product> data2 = p.getListProductAtStart(1, 0);
                req.setAttribute("data", data);
                req.setAttribute("data2", data2);
                int totalPage = p.getTotalPage(0);
                System.out.println(totalPage);
                req.setAttribute("totalPage", totalPage);
                req.setAttribute("updateSuccess", updateSuccess);
                req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}

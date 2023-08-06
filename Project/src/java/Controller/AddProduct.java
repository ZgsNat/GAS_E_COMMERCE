/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import static Controller.UpdateProduct.updateError;
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
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

/**
 *
 * @author Peanut
 */
public class AddProduct extends HttpServlet {

    public static final String blankError = "You have to entered all the blanks!!";
    public static final String productExist = "The Product already exist!!";
    public static final String insertProductSuccess = "Product insert successfully!!";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("addProduct") != null) {
            Category c = new Category();
            List<Category> data = c.getListCategory();
            req.setAttribute("data", data);
            req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
        }
        if (req.getParameter("addSubmit") != null) {
            System.out.println("check");
            String imageName = "";
            for (Part part : req.getParts()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                if (part.getName().equals("imageMulti")) {
                    String multipleImageFileName = "image_" + System.currentTimeMillis() + ".jpg";
                    if (multipleImageFileName != null && !multipleImageFileName.isEmpty()) {
                        part.write(uploadPath + File.separator + multipleImageFileName);
                    }
                }
            }
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
            Category c = new Category();
            Product p = new Product();

            if (req.getParameter("pName").isEmpty() || req.getParameter("pPrice").isEmpty() || req.getParameter("pQuantity").isEmpty()
                    || req.getParameter("pWarranty").isEmpty()) {
                req.setAttribute("updateError", blankError);
                req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
            } else {
                String pName = req.getParameter("pName");
                int cID = Integer.parseInt(req.getParameter("cID"));
                double pPrice = Double.parseDouble(req.getParameter("pPrice"));
                int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
                String pWarranty = req.getParameter("pWarranty");
                String pCreatedByName = req.getParameter("pCreatedBy");
                Admin ad = new Admin();
                int pCreatedByID = ad.getCreatedByAdminID(pCreatedByName);
                String pDetail = req.getParameter("pDetail");
                boolean checkProductExist = p.checkProductExist(pName);

                if (checkProductExist) {
                    List<Category> data = c.getListCategory();
                    req.setAttribute("data", data);
                    req.setAttribute("wordExist", productExist);
                    req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
                } else {
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                    LocalDateTime now = LocalDateTime.now();
                    p.insertProduct(pName, cID, pPrice, pQuantity, pWarranty, dtf.format(now), pCreatedByID, pDetail, imageName);
                    req.setAttribute("insertSuccess", insertProductSuccess);
                    List<Category> data = c.getListCategory();
                    List<Product> data2 = p.getListProductAtStart(1, 0);
                    req.setAttribute("data", data);
                    req.setAttribute("data2", data2);
                    int totalPage = p.getTotalPage(0);
                    req.setAttribute("totalPage", totalPage);
                    req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("addSubmit") != null) {
            String imageName = "";
            if (req.getPart("image").getSize() > 0) {
                System.out.println("check");
            }
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
            Category c = new Category();
            Product p = new Product();

            if (req.getParameter("pName").isEmpty() || req.getParameter("cID").isEmpty() || req.getParameter("pPrice").isEmpty() || req.getParameter("pQuantity").isEmpty()
                    || req.getParameter("pWarranty").isEmpty()) {
                req.setAttribute("updateError", blankError);
                req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
            } else {
                String pName = req.getParameter("pName");
                int cID = Integer.parseInt(req.getParameter("cID"));
                double pPrice = Double.parseDouble(req.getParameter("pPrice"));
                int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
                String pWarranty = req.getParameter("pWarranty");
                String pCreatedByName = req.getParameter("pCreatedBy");
                Admin ad = new Admin();
                int pCreatedByID = ad.getCreatedByAdminID(pCreatedByName);
                String pDetail = req.getParameter("pDetail");
                boolean checkProductExist = p.checkProductExist(pName);
//                String uploadPath = getServletContext().getRealPath("") + ".." + File.separator + ".." + File.separator + "productImg";
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                    uploadDir.mkdir();
//                }
//                String imageName = "image_" + System.currentTimeMillis() + ".jpg";
//                if (req.getParameter("imageUrl") != null) {
//                    String imageUrl = req.getParameter("imageUrl");
//                    try {
//                        // Open a connection to the image URL
//                        URL url = new URL(imageUrl);
//                        InputStream in = url.openStream();
//
//                        // Create an output stream to save the image
//                        OutputStream out = new FileOutputStream(uploadPath + File.separator + imageName);
//
//                        // Read from the input stream and write to the output stream
//                        byte[] buffer = new byte[1024];
//                        int length;
//                        while ((length = in.read(buffer)) != -1) {
//                            out.write(buffer, 0, length);
//                        }
//
//                        // Close the streams
//                        in.close();
//                        out.close();
//                    } catch (IOException e) {
//                        // Print the stack trace to the console
//                        e.printStackTrace();
//
//                        // Display an error message
//                        resp.getWriter().println("Error uploading image: " + e.getMessage());
//                    }
//                }

                if (checkProductExist) {
                    req.setAttribute("wordExist", productExist);
                    req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
                } else {
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                    LocalDateTime now = LocalDateTime.now();
                    p.insertProduct(pName, cID, pPrice, pQuantity, pWarranty, dtf.format(now), pCreatedByID, pDetail, imageName);
                    req.setAttribute("insertSuccess", insertProductSuccess);
                    List<Category> data = c.getListCategory();
                    List<Product> data2 = p.getListProductAtStart(1, 0);
                    req.setAttribute("data", data);
                    req.setAttribute("data2", data2);
                    int totalPage = p.getTotalPage(0);
                    req.setAttribute("totalPage", totalPage);
                    req.getRequestDispatcher("productInfo.jsp").forward(req, resp);
                }
            }
        }
    }

}

package Controller_Client;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Comment;
import Model.Customer;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class CommentController extends HttpServlet {

    String commentError = "You have to rate the Product to Post the comment!!";
    String commentErrorLogin = "You have to login to Post the comment!!";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("Customer") != null) {
            int cusid = ((Customer) session.getAttribute("Customer")).getCustomerID();
            if (req.getParameter("postComment") != null) {
                if (req.getParameter("rating") != null) {
                    int pID = Integer.parseInt(req.getParameter("pID"));
                    int cID = Integer.parseInt(req.getParameter("cID"));
                    Comment com = new Comment();
                    Product p2 = new Product();
                    Product p = new Product(pID, cID);
                    List<Product> data = p.getRelatedProduct();
                    Product data2 = p2.getProductDetailClientSite(pID);
                    List<Product> multiImg = p2.getMultiImg(pID);

                    String comment = req.getParameter("commentClient");
                    int rating = Integer.parseInt(req.getParameter("rating"));
                    Comment c = new Comment();
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                    LocalDateTime now = LocalDateTime.now();
                    c.insertCommentFromClient(comment, pID, rating, dtf.format(now), cusid);
                    List<Comment> data3 = com.getListCommentClient(pID);
                    req.setAttribute("data3", data3);
                    req.setAttribute("multiImg", multiImg);
                    req.setAttribute("data", data);
                    req.setAttribute("data2", data2);
                    req.getRequestDispatcher("Client/shop-single.jsp").forward(req, resp);

                } else {
                    int pID = Integer.parseInt(req.getParameter("pID"));
                    int cID = Integer.parseInt(req.getParameter("cID"));
                    Comment com = new Comment();
                    Product p2 = new Product();
                    Product p = new Product(pID, cID);
                    List<Product> data = p.getRelatedProduct();
                    Product data2 = p2.getProductDetailClientSite(pID);
                    List<Product> multiImg = p2.getMultiImg(pID);
                    List<Comment> data3 = com.getListCommentClient(pID);
                    req.setAttribute("commentError", commentError);
//                    req.setAttribute("commentErrorLogin", commentErrorLogin);
                    req.setAttribute("data3", data3);
                    req.setAttribute("multiImg", multiImg);
                    req.setAttribute("data", data);
                    req.setAttribute("data2", data2);
                    req.getRequestDispatcher("Client/shop-single.jsp").forward(req, resp);
                }

            }
        }
        else{
            req.getRequestDispatcher("Client/login.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}

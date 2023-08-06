/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class Comment {

    private int commentID;
    private int productID;
    private int rating;
    private String content;
    private String createdDate;
    private String modifiedDate;
    private int createdBy;
    private int modifiedBy;
    private String createdByName;
    private String modifiedByName;
    private String productName;

    public Comment() {
        connect();
    }

    public Comment(int productID) {
        this.productID = productID;
        connect();
    }

    public Comment(int commentID, int productID, int rating, String content, String createdDate, String modifiedDate, int createdBy, int modifiedBy) {
        this.commentID = commentID;
        this.productID = productID;
        this.rating = rating;
        this.content = content;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        connect();
    }

    public Comment(int commentID, int rating, String content, String createdDate, String modifiedDate, String createdByName, String modifiedByName, String productName) {
        this.commentID = commentID;
        this.rating = rating;
        this.content = content;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdByName = createdByName;
        this.modifiedByName = modifiedByName;
        this.productName = productName;
        connect();
    }

    public Comment(int rating, String content, String createdByName, String createdDate) {
        this.rating = rating;
        this.content = content;
        this.createdByName = createdByName;
        this.createdDate = createdDate;
        connect();
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getCreatedByName() {
        return createdByName;
    }

    public void setCreatedByName(String createdByName) {
        this.createdByName = createdByName;
    }

    public String getModifiedByName() {
        return modifiedByName;
    }

    public void setModifiedByName(String modifiedByName) {
        this.modifiedByName = modifiedByName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    Connection cnn; //ket noi
    Statement stm; //thuc thi cac cau lenh sql
    PreparedStatement pstm;
    ResultSet rs; //luu tru va xu ly du lieu

    private void connect() {
        try {
            cnn = (new DBContext()).connection;
            if (cnn != null) {
                System.out.println("Connect success");
            } else {
                System.out.println("Connect fail!");
            }
        } catch (Exception e) {
        }
    }

    public List<Comment> getListComment(int pID) {
        List<Comment> data = new ArrayList<Comment>();
        try {
            String strSelect = "select CommentID, ProductName, Rating, Content, Comment.CreatedDate, Comment.ModifiedDate, CustomerName, CustomerName "
                    + "from Customer join Comment on Customer.CustomerID = Comment.CreatedBy join Product on Comment.ProductID = Product.ProductID "
                    + "where Comment.ProductID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int commentID = rs.getInt(1);
                String productName = rs.getString(2);
                int rating = rs.getInt(3);
                String content = rs.getString(4);
                String createdDate = ConvertFormateDate(rs.getString(5));
                String modifiedDate = ConvertFormateDate(rs.getString(6));
                String createdByName = rs.getString(7);
                String modifiedByName = rs.getString(8);
                data.add(new Comment(commentID, rating, content, createdDate, modifiedDate, createdByName, modifiedByName, productName));
            }
        } catch (Exception e) {
            System.out.println("getListComment(): " + e.getMessage());
        }
        return data;
    }

    public void deleteComment(int commentID) {
        try {
            String strDelete = "DELETE FROM Comment WHERE CommentID = ? ";
            pstm = cnn.prepareStatement(strDelete);
            pstm.setInt(1, commentID);
            pstm.execute();
            System.out.println("Comment Deleted!!");
        } catch (Exception e) {
            System.out.println("deleteComment(): " + e.getMessage());
        }
    }

    public List<Comment> getListCommentOldToNew(int pID) {
        List<Comment> data = new ArrayList<Comment>();
        try {
            String strSelect = "select * from Comment where ProductID = ? order by CreatedDate";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int commentID = rs.getInt(1);
                int productID = rs.getInt(2);
                int rating = rs.getInt(3);
                String content = rs.getString(4);
                String createdDate = rs.getString(5);
                String modifiedDate = rs.getString(6);
                int createdBy = rs.getInt(7);
                int modifiedBy = rs.getInt(8);
                data.add(new Comment(commentID, productID, rating, content, createdDate, modifiedDate, createdBy, modifiedBy));
            }
        } catch (Exception e) {
            System.out.println("getListCommentOldToNew(): " + e.getMessage());
        }
        return data;
    }

    public List<Comment> getListCommentNewToOld(int pID) {
        List<Comment> data = new ArrayList<Comment>();
        try {
            String strSelect = "select * from Comment where ProductID = ? order by CreatedDate desc";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int commentID = rs.getInt(1);
                int productID = rs.getInt(2);
                int rating = rs.getInt(3);
                String content = rs.getString(4);
                String createdDate = rs.getString(5);
                String modifiedDate = rs.getString(6);
                int createdBy = rs.getInt(7);
                int modifiedBy = rs.getInt(8);
                data.add(new Comment(commentID, productID, rating, content, createdDate, modifiedDate, createdBy, modifiedBy));
            }
        } catch (Exception e) {
            System.out.println("getListCommentNewToOld(): " + e.getMessage());
        }
        return data;
    }

    public String ConvertFormateDate(String Redate) {
        String desiredFormat = "HH:mm:ss dd-MM-yyyy";

        SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat desiredDateFormat = new SimpleDateFormat(desiredFormat);
        String formattedDateTime = "";
        try {
            Date date = sqlFormat.parse(Redate);
            formattedDateTime = desiredDateFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formattedDateTime;
    }

    public void insertCommentFromClient(String comment, int pID, int rating, String createdDate, int cusid) {
        try {
            String strInsert = "insert into Comment ([ProductID], [Rating], [Content], [CreatedDate], [CreatedBy])"
                    + " values (?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setInt(1, pID);
            pstm.setString(3, comment);
            pstm.setInt(2, rating);
            pstm.setString(4, createdDate);
            pstm.setInt(5, cusid);
            pstm.execute();
            System.out.println("Comment Added!!");
        } catch (Exception e) {
            System.out.println("insertCommentFromClient(): " + e.getMessage());
        }
    }

    public List<Comment> getListCommentClient(int pID) {
        List<Comment> data = new ArrayList<Comment>();
        try {
            String strSelect = "select Rating, Content, CustomerName, Comment.CreatedDate "
                    + "from Customer join Comment on Customer.CustomerID = Comment.CreatedBy join Product on Comment.ProductID = Product.ProductID "
                    + "where Comment.ProductID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int rating = rs.getInt(1);
                String content = rs.getString(2);
                String createdByName = rs.getString(3);
                String createdDate = ConvertFormateDate(rs.getString(4));
                data.add(new Comment(rating, content, createdByName, createdDate));
            }
        } catch (Exception e) {
            System.out.println("getListCommentClient(): " + e.getMessage());
        }
        return data;
    }

}

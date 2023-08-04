/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.twilio.converter.Promoter;
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
 * @author CAT PHUONG
 */
public class Promotion {

    private int id;
    private String createdDate;
    private String modifiedDate;
    private String createdBy;
    private String modifiedBy;
    private int status;
    private Coupon coupon;
    private Customer customer;
    private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

    public Promotion() {
    }

    public Promotion(int id, String createdDate, String modifiedDate, String createdBy, String modifiedBy, int status, Coupon coupon, Customer customer) {
        this.id = id;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.status = status;
        this.coupon = coupon;
        this.customer = customer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public SimpleDateFormat getFormat() {
        return format;
    }

    public void setFormat(SimpleDateFormat format) {
        this.format = format;
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

    public List<Promotion> getPromotionByCouponID(int couId) {
        connect();
        Date now = new Date();
        Customer c1 = new Customer();
        Coupon c2 = new Coupon();
        List<Promotion> data = new ArrayList<>();
        String strSelect = "SELECT [PromotionID]\n"
                + "      ,[CustomerID]\n"
                + "      ,[CouponID]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[ModifiedDate]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[ModifiedBy]\n"
                + "      ,[Status]\n"
                + "  FROM [Customers_Promotions] p where CouponID = " + couId;

        try {
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                Customer customer = c1.getCustomerByID(""+rs.getInt(2));
                Coupon coupon = c2.getCouponById(rs.getInt(3));
                Date createdDate = rs.getDate(4);
                Date modifiedDate = new Date(0, 1, 1);
                String modifiedBy = "";
                if (rs.getDate(5) != null) {
                    modifiedDate = rs.getDate(5);
                    String modifiedD = format.format(modifiedDate);
                }
                String createdBy = rs.getString(6);
                if (rs.getString(7) != null) {
                    modifiedBy = rs.getString(7);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                int status = rs.getInt(8);
                data.add(new Promotion(id, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, status, coupon, customer));
            }
            cnn.close();
            System.out.println("Promotion Searched!!");
        } catch (Exception e) {
            System.out.println("getPromotionByCouponID(): " + e.getMessage());
            e.printStackTrace();
        }
        return data;
    }
    
    public List<Promotion> getPromotionByCustomerID(int cId) {
        connect();
        Date now = new Date();
        Customer c1 = new Customer();
        Coupon c2 = new Coupon();
        List<Promotion> data = new ArrayList<>();
        String strSelect = "SELECT [PromotionID]\n"
                + "      ,[CustomerID]\n"
                + "      ,[CouponID]\n"
                + "      ,[CreatedDate]\n"
                + "      ,[ModifiedDate]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[ModifiedBy]\n"
                + "      ,[Status]\n"
                + "  FROM [Customers_Promotions] p where CustomerID = " + cId;

        try {
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                Customer customer = c1.getCustomerByID(""+rs.getInt(2));
                Coupon coupon = c2.getCouponById(rs.getInt(3));
                Date createdDate = rs.getDate(4);
                Date modifiedDate = new Date(0, 1, 1);
                String modifiedBy = "";
                if (rs.getDate(5) != null) {
                    modifiedDate = rs.getDate(5);
                    String modifiedD = format.format(modifiedDate);
                }
                String createdBy = rs.getString(6);
                if (rs.getString(7) != null) {
                    modifiedBy = rs.getString(7);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                int status = rs.getInt(8);
                data.add(new Promotion(id, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, status, coupon, customer));
            }
            cnn.close();
            System.out.println("Promotion Searched!!");
        } catch (Exception e) {
            System.out.println("getPromotionByCustomerID(): " + e.getMessage());
            e.printStackTrace();
        }
        return data;
    }
    
    public int checkPromotionStatus(int cId, int couId){
        connect();
        Date now = new Date();
        Customer c1 = new Customer();
        Coupon c2 = new Coupon();
        List<Promotion> data = new ArrayList<>();
        String strSelect = "SELECT [Status]\n"
                + "  FROM [Customers_Promotions] p where CustomerID = " + cId + " " + couId;
        try {
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(1);
                return status;
            }
            cnn.close();
            System.out.println("Promotion Searched!!");
        } catch (Exception e) {
            System.out.println("getPromotionByCustomerID(): " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

}

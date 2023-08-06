/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Order {

    private String CustomerID, CustomerName;
    private String PurchaseDate;
    private String Price;
    private boolean PaymentMethod, UsageStatus;
    private int Status;
    private String CouponID;
    private String Note;
    //Moi add them
    private String totalMoneyConfig;
    private int OrderID;

    public Order() {
    }

    public Order(String CustomerID, String CustomerName, String PurchaseDate, String Price, boolean PaymentMethod, boolean UsageStatus, int Status, String CouponID, String Note) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PurchaseDate = PurchaseDate;
        this.Price = Price;
        this.PaymentMethod = PaymentMethod;
        this.UsageStatus = UsageStatus;
        this.Status = Status;
        this.CouponID = CouponID;
        this.Note = Note;
        connect();
    }

    public Order(String CustomerName, String PurchaseDate, String Price, boolean PaymentMethod, String CouponID, String Note) {
        this.CustomerName = CustomerName;
        this.PurchaseDate = PurchaseDate;
        this.Price = Price;
        this.PaymentMethod = PaymentMethod;
        this.CouponID = CouponID;
        this.Note = Note;
        connect();
    }

    public Order(String CustomerName, String PurchaseDate, boolean PaymentMethod, String CouponID, String Note, String totalMoneyConfig) {
        this.CustomerName = CustomerName;
        this.PurchaseDate = PurchaseDate;
        this.PaymentMethod = PaymentMethod;
        this.CouponID = CouponID;
        this.Note = Note;
        this.totalMoneyConfig = totalMoneyConfig;
        connect();
    }

    public Order(String CustomerName, String PurchaseDate, boolean PaymentMethod, String CouponID, String Note, String totalMoneyConfig, int OrderID) {
        this.CustomerName = CustomerName;
        this.PurchaseDate = PurchaseDate;
        this.PaymentMethod = PaymentMethod;
        this.CouponID = CouponID;
        this.Note = Note;
        this.totalMoneyConfig = totalMoneyConfig;
        this.OrderID = OrderID;
        connect();
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getTotalMoneyConfig() {
        return totalMoneyConfig;
    }

    public void setTotalMoneyConfig(String totalMoneyConfig) {
        this.totalMoneyConfig = totalMoneyConfig;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getPurchaseDate() {
        return PurchaseDate;
    }

    public void setPurchaseDate(String PurchaseDate) {
        this.PurchaseDate = PurchaseDate;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public boolean isPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(boolean PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    public boolean isUsageStatus() {
        return UsageStatus;
    }

    public void setUsageStatus(boolean UsageStatus) {
        this.UsageStatus = UsageStatus;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public String getCouponID() {
        return CouponID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public void setCouponID(String CouponID) {
        this.CouponID = CouponID;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
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

    public List<Order> getListOrderBycID(String customerID) {
        connect();
        List<Order> o = new ArrayList<Order>();
        try {
            String str = "Select CustomerName, PurchaseDate, TotalPrice, PaymentMethod, [CouponID], Note, [Order].OrderID from Customer,[Order]\n"
                    + "where Customer.CustomerID = [Order].CustomerID and Customer.CustomerID = ?";
            pstm = cnn.prepareStatement(str);
            pstm.setString(1, customerID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String purchasedate = rs.getString(2);
                int price = rs.getInt(3);
                boolean paymentmethod = rs.getBoolean(4);
                String couponid;
                if (rs.getString(5) == null) {
                    couponid = "Khong co";
                } else {
                    couponid = rs.getString(5);
                }
                String totalMoney = moneyconfig(price);
                String note = rs.getString(6);
                int orderID = rs.getInt(7);
                o.add(new Order(name, purchasedate, paymentmethod, couponid, note, totalMoney, orderID));
            }
        } catch (Exception e) {
            System.out.println("WHy:" + e.getMessage());
        }
        return o;
    }

    public String moneyconfig(int today) {
        String old = "" + today;
        String temp = "";
        int count = 0;
        for (int i = old.length() - 1; i >= 0; i--) {
            if (count % 3 == 0 && i != old.length() - 1) {
                temp += "," + old.charAt(i);
            } else {
                temp += old.charAt(i);
            }
            count++;
        }
        return reverseString(temp);
    }

    public String reverseString(String temp) {
        String a = "";
        for (int i = temp.length() - 1; i >= 0; i--) {
            a += temp.charAt(i);
        }
        return a;
    }
}

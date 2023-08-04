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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author minhn
 */
public class Warranty {

    private double price, period;
    private int orderId, customerId, quantity, productId, productSeries;
    private String status, productName, malfunctionDesc, location, priceConfig, modifiedDate, purchaseDate, expireDate, note, customerName, phone, address;

    public Warranty() {
        connect();
    }

    public Warranty(double price, double period, int orderId, int customerId, String status, String productName, String malfunctionDesc, String location, String priceConfig, String modifiedDate, String purchaseDate, String expireDate, String note) {
        this.price = price;
        this.period = period;
        this.orderId = orderId;
        this.customerId = customerId;
        this.status = status;
        this.productName = productName;
        this.malfunctionDesc = malfunctionDesc;
        this.location = location;
        this.priceConfig = priceConfig;
        this.modifiedDate = modifiedDate;
        this.purchaseDate = purchaseDate;
        this.expireDate = expireDate;
        this.note = note;
        connect();
    }

    //For warrantyInfo
    public Warranty(int orderId, int quantity, String productName, String purchaseDate, String expireDate, String customerName, String phone, String address) {
        this.orderId = orderId;
        this.quantity = quantity;
        this.productName = productName;
        this.purchaseDate = purchaseDate;
        this.expireDate = expireDate;
        this.customerName = customerName;
        this.address = address;
        this.phone = phone;
        connect();
    }

    //For warrantyHistory if there's no history of fixing the product here
    public Warranty(int orderId, String customerName, String phone, String address, String purchaseDate) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.phone = phone;
        this.address = address;
        this.purchaseDate = purchaseDate;
        connect();
    }

    //For warrantyHistory if there's history of fixing the product here
    public Warranty(int orderId, int quantity, String productName, String malfunctionDesc, String location, String priceConfig, String modifiedDate, String expireDate, String purchaseDate) {
        this.orderId = orderId;
        this.quantity = quantity;
        this.productName = productName;
        this.malfunctionDesc = malfunctionDesc;
        this.location = location;
        this.priceConfig = priceConfig;
        this.modifiedDate = modifiedDate;
        this.expireDate = expireDate;
        this.purchaseDate = purchaseDate;
        connect();
    }

    public Warranty(int orderId, String modifiedDate, String customerName, String phone) {
        this.orderId = orderId;
        this.modifiedDate = modifiedDate;
        this.customerName = customerName;
        this.phone = phone;
        connect();
    }

    //For fix history list
    public Warranty(String modifiedDate, String customerName, String purchaseDate, int orderId, int productId) {
        this.orderId = orderId;
        this.modifiedDate = modifiedDate;
        this.customerName = customerName;
        this.purchaseDate = purchaseDate;
        this.productId = productId;
        connect();
    }

    public Warranty(int orderId, int productSeries, String productName, String modifiedDate, String purchaseDate, String customerName, int productID) {
        this.orderId = orderId;
        this.productSeries = productSeries;
        this.productName = productName;
        this.modifiedDate = modifiedDate;
        this.purchaseDate = purchaseDate;
        this.customerName = customerName;
        this.productId = productID;
        connect();
    }

    public Warranty(double price, int orderId, int quantity, int productSeries, String productName, String malfunctionDesc, String location, String note, String customerName) {
        this.price = price;
        this.orderId = orderId;
        this.quantity = quantity;
        this.productSeries = productSeries;
        this.productName = productName;
        this.malfunctionDesc = malfunctionDesc;
        this.location = location;
        this.note = note;
        this.customerName = customerName;
        connect();
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPeriod() {
        return period;
    }

    public void setPeriod(double period) {
        this.period = period;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getMalfunctionDesc() {
        return malfunctionDesc;
    }

    public void setMalfunctionDesc(String malfunctionDesc) {
        this.malfunctionDesc = malfunctionDesc;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPriceConfig() {
        return priceConfig;
    }

    public void setPriceConfig(String priceConfig) {
        this.priceConfig = priceConfig;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(String expireDate) {
        this.expireDate = expireDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(int productSeries) {
        this.productSeries = productSeries;
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

    public List<Warranty> getWarrantyInfo() {
        int id = this.orderId;
        int month = 0, year = 0, date = 0;
        String expireDate = "";
        List<Warranty> data = new ArrayList<Warranty>();
        try {
            String strSelect = "select Customer.CustomerName, Product.ProductName, COUNT(ProductSeries.ProductSeries) as Quantity, [order].PurchaseDate, Product.WarrantyPeriod, phonenumber, [Order].address \n"
                    + "from[Order] join OrderDetail on [OrderDetail].orderID = [Order].orderId\n"
                    + "join product on product.productID = orderDetail.productId\n"
                    + "join customer on Customer.CustomerID = [order].CustomerID\n"
                    + "right join ProductSeries on ProductSeries.ProductSeries = OrderDetail.ProductSeries\n"
                    + "group by Customer.CustomerName, Product.ProductName, [order].PurchaseDate, Product.WarrantyPeriod, phonenumber, [Order].address, [Order].OrderID\n"
                    + "HAVING [Order].OrderID = '" + id + "' ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String customerName = rs.getString(1);
                String productName = rs.getString(2);
                int quantity = rs.getInt(3);
                String purchaseDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(4));
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                    LocalDate localDate = LocalDate.parse(purchaseDate, formatter);
                    date = localDate.getDayOfMonth();
                    year = localDate.getYear();
                    month = localDate.getMonthValue();
                }
                double period = rs.getDouble(5);
                int temp = (int) period;
                if (period - temp != 0) {
                    if ((month + 6) > 12) {
                        month += 6 - 12;
                        year += temp + 1;
                    } else {
                        month = month + 6;
                        year += temp;
                    }
                } else {
                    year += temp;
                }
                expireDate = configureDateMonth(date, month, year);
                String phone = rs.getString(6);
                String address = rs.getString(7);
                data.add(new Warranty(id, quantity, productName, purchaseDate, expireDate, customerName, phone, address));
                expireDate = "";
            }
        } catch (Exception e) {
            System.out.println("getWarrantyInfo: " + e.getMessage());
        }
        return data;
    }

    public List<Warranty> getWarrantyHistory() {
        int id = this.orderId;
        int year = 0, month = 0, date = 0;
        List<Warranty> data = new ArrayList<Warranty>();
        try {
            String strSelect = "select Product.ProductName, malfunctionDescription, fixPrice, warranty.[location], warranty.fixDate, Product.WarrantyPeriod, Warranty.Note, PurchaseDate, fixQuantity\n"
                    + "from Warranty join [order] on [Order].orderId = warranty.orderID\n"
                    + "join product on product.productID = Warranty.productId\n"
                    + "where [Warranty].OrderID= '" + id + "' ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String productName = rs.getString(1);
                String malfunction = rs.getString(2);
                String fixPrice = moneyconfig(rs.getInt(3));
                String location = rs.getString(4);
                String fixDate = "";
                if (rs.getDate(5) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(5));
                }
                double period = rs.getDouble(6);
                String note = rs.getString(7);
                String purchaseDate = "";
                if (rs.getDate(8) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(8));
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                    LocalDate localDate = LocalDate.parse(purchaseDate, formatter);
                    date = localDate.getDayOfMonth();
                    year = localDate.getYear();
                    month = localDate.getMonthValue();
                }
                int temp = (int) period;
                if (period - temp != 0) {
                    if ((month + 6) > 12) {
                        month += 6 - 12;
                        year += temp + 1;
                    } else {
                        month = month + 6;
                        year += temp;
                    }
                } else {
                    year += temp;
                }
                String expire = configureDateMonth(date, month, year);
                int fixQuantity = rs.getInt(9);

                data.add(new Warranty(orderId, fixQuantity, productName, malfunction, location, fixPrice, fixDate, expire, purchaseDate));

            }
        } catch (Exception e) {
            System.out.println("getWarrantyHistory: " + e.getMessage());
        }
        return data;
    }

    public List<Warranty> getOrderInfo() {
        int id = this.orderId;
        int year = 0, month = 0, date = 0;
        List<Warranty> data = new ArrayList<Warranty>();
        try {
            String strSelect = "select CustomerName, [Order].Address, PhoneNumber, PurchaseDate from Customer \n"
                    + "join [Order] on [order].CustomerID = Customer.CustomerID\n"
                    + "where [Order].OrderID='" + id + "'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String customerName = rs.getString(1);
                String address = rs.getString(2);
                String phone = rs.getString(3);
                String purchaseDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(4));
                }
                data.add(new Warranty(orderId, customerName, phone, address, purchaseDate));
            }
        } catch (Exception e) {
            System.out.println("getWarrantyHistory: " + e.getMessage());
        }
        return data;
    }

    public List<Warranty> getFixList() {
        List<Warranty> data = new ArrayList<Warranty>();
        try {
            String strSelect = "select CustomerName, [Order].Address, PhoneNumber, PurchaseDate from Customer \n"
                    + "join [Order] on [order].CustomerID = Customer.CustomerID";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt(1);
                String customerName = rs.getString(2);
                String phone = rs.getString(3);
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                data.add(new Warranty(ID, customerName, phone, fixDate, fixDate));
            }
        } catch (Exception e) {
            System.out.println("getFixList: " + e.getMessage());
        }
        return data;
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

    private String configureDateMonth(int day, int month, int year) {
        String date = "";
        if (day < 10) {
            date += "0" + day + "-";
        } else {
            date += day + "-";
        }

        if (month < 10) {
            date += "0" + month + "-";
        } else {
            date += month + "-";
        }
        return date += year;
    }

    public List<Warranty> getFixHistoryList(int index) {
        List<Warranty> data = new ArrayList<Warranty>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select Warranty.[OrderID], customerName, PurchaseDate, FixDate, ProductID from Warranty\n"
                    + "join Customer on [Warranty].CustomerID = Customer.CustomerID \n"
                    + "join [Order] on [order].orderID = Warranty.orderID order by PurchaseDate desc OFFSET ? ROWS FETCH FIRST 10 ROWS ONLY";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, (index - 1) * 10);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                int productID = rs.getInt(5);
                if (!fixDate.isEmpty()) {
                    data.add(new Warranty(fixDate, customerName, purchaseDate, orderID, productID));
                }
            }
        } catch (Exception e) {
            System.out.println("getFixHistoryList: " + e.getMessage());
        }
        return data;
    }
    
    public List<Warranty> getFixHistoryList() {
        List<Warranty> data = new ArrayList<Warranty>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select Warranty.[OrderID], customerName, PurchaseDate, FixDate, ProductID from Warranty\n"
                    + "join Customer on [Warranty].CustomerID = Customer.CustomerID \n"
                    + "join [Order] on [order].orderID = Warranty.orderID order by PurchaseDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                int productID = rs.getInt(5);
                if (!fixDate.isEmpty()) {
                    data.add(new Warranty(fixDate, customerName, purchaseDate, orderID, productID));
                }
            }
        } catch (Exception e) {
            System.out.println("getFixHistoryList: " + e.getMessage());
        }
        return data;
    }

    public List<Warranty> getFixHistoryList2() {
        List<Warranty> data = new ArrayList<Warranty>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select Warranty.[OrderID], customerName, PurchaseDate, FixDate, ProductName, ProductSeriID from Warranty\n"
                    + "join Customer on [Warranty].CustomerID = Customer.CustomerID\n"
                    + "join Product on Product.ProductID = Warranty.ProductID\n"
                    + "join [Order] on [order].orderID = Warranty.orderID where warranty.ProductID='" + this.productId + "' order by PurchaseDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                String productName = rs.getString(5);
                int productSeries = rs.getInt(6);
                if (!fixDate.isEmpty()) {
                    data.add(new Warranty(orderID, productSeries, productName, fixDate, purchaseDate, customerName, this.productId));
                }
            }
        } catch (Exception e) {
            System.out.println("getFixHistoryList: " + e.getMessage());
        }
        return data;
    }

    public void removeFixHistory() {
        try {
            String strDelete = "delete from Warranty where ProductID=? and OrderID=? and ProductSeriId = ?";
            pstm = cnn.prepareStatement(strDelete);
            pstm.setInt(1, this.productId);
            pstm.setInt(2, this.orderId);
            pstm.setInt(3, this.productSeries);
            pstm.execute();
            cnn.close();
        } catch (Exception e) {
            System.out.println("Fix history remove: " + e.getMessage());
        }
    }

    public List<Warranty> getWarrantyHistory2(int orderId, int series, int productId) {
        int year = 0, month = 0, date = 0;
        List<Warranty> data = new ArrayList<Warranty>();
        System.out.println("orderID, series, productID: " + orderId +" " + series + " "+ this.productName);
        try {
            String strSelect = "select malfunctionDescription, fixPrice, warranty.[location], warranty.fixDate, Product.WarrantyPeriod, Warranty.Note, PurchaseDate, fixQuantity\n"
                    + "from Warranty join [order] on [Order].orderId = warranty.orderID\n"
                    + "join product on product.productID = Warranty.productId\n"
                    + "where [Warranty].OrderID= '" + orderId + "' and ProductSeriId='" + series + "' and Warranty.ProductId= '" + productId + "' ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String malfunction = rs.getString(1);
                String fixPrice = moneyconfig(rs.getInt(2));
                String location = rs.getString(3);
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                double period = rs.getDouble(5);
                String note = rs.getString(6);
                String purchaseDate = "";
                if (rs.getDate(7) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(7));
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                    LocalDate localDate = LocalDate.parse(purchaseDate, formatter);
                    date = localDate.getDayOfMonth();
                    year = localDate.getYear();
                    month = localDate.getMonthValue();
                }
                int temp = (int) period;
                if (period - temp != 0) {
                    if ((month + 6) > 12) {
                        month += 6 - 12;
                        year += temp + 1;
                    } else {
                        month = month + 6;
                        year += temp;
                    }
                } else {
                    year += temp;
                }
                String expire = configureDateMonth(date, month, year);
                int fixQuantity = rs.getInt(8);

                data.add(new Warranty(orderId, fixQuantity, this.productName, malfunction, location, fixPrice, fixDate, expire, purchaseDate));

            }
        } catch (Exception e) {
            System.out.println("getWarrantyHistory: " + e.getMessage());
        }
        return data;
    }
    
    public List<Warranty> getWarrantyHistory3(int orderId, int series, int productId) {
        int year = 0, month = 0, date = 0;
        List<Warranty> data = new ArrayList<Warranty>();
        System.out.println("orderID, series, productID: " + orderId +" " + series + " "+ this.productName);
        try {
            String strSelect = "select malfunctionDescription, fixPrice, warranty.[location], warranty.fixDate, Product.WarrantyPeriod, Warranty.Note, PurchaseDate, fixQuantity, productSeriId, productName, customerName\n"
                    + "from Warranty join [order] on [Order].orderId = warranty.orderID\n"
                    + "join product on product.productID = Warranty.productId\n"
                    + "join Customer on Customer.CustomerId=warranty.customerId\n"
                    + "where [Warranty].OrderID= '" + orderId + "' and ProductSeriId='" + series + "' and Warranty.ProductId= '" + productId + "' ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String malfunction = rs.getString(1);
                int fixPrice = rs.getInt(2);
                String location = rs.getString(3);
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                double period = rs.getDouble(5);
                String note = rs.getString(6);
                String purchaseDate = "";
                if (rs.getDate(7) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(7));
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                    LocalDate localDate = LocalDate.parse(purchaseDate, formatter);
                    date = localDate.getDayOfMonth();
                    year = localDate.getYear();
                    month = localDate.getMonthValue();
                }
                int temp = (int) period;
                if (period - temp != 0) {
                    if ((month + 6) > 12) {
                        month += 6 - 12;
                        year += temp + 1;
                    } else {
                        month = month + 6;
                        year += temp;
                    }
                } else {
                    year += temp;
                }
                String expire = configureDateMonth(date, month, year);
                int fixQuantity = rs.getInt(8);
                int productSeri = rs.getInt(9);
                String productName=rs.getString(10);
                String customerName=rs.getString(11);
                data.add(new Warranty(this.orderId, fixPrice, fixQuantity, productSeri, productName, malfunction, location, note, customerName));

            }
        } catch (Exception e) {
            System.out.println("getWarrantyHistory3: " + e.getMessage());
        }
        return data;
    }

    public void udpateFixHistory() {
        try {
            String strUpdate = "update [Warranty] set malfunctionDescription=?, note=?, location=?, fixQuantity=?, fixPrice=? where OrderId=? and ProductSeriId=? ";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, this.malfunctionDesc);
            pstm.setString(2, this.note);
            pstm.setString(3, this.location);
            pstm.setInt(4, this.quantity);
            pstm.setDouble(5, this.price);
            pstm.setInt(6, this.orderId);
            pstm.setInt(7, this.productSeries);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("udpateFixHistory: " + e.getMessage());
        }
    }

    public void addFixHistory() {
        try {
            String strAdd = "INSERT [dbo].[Warranty] ([ProductID], [ProductSeriID], [CustomerID], [OrderID], [status], [malfunctionDescription], [note], [location], [fixDate], [fixPrice], [fixQuantity], [productseries]) VALUES (?, ?, ?, ?, 1, ?, ?, ?, ?, ?, ?, NULL)";
            pstm = cnn.prepareStatement(strAdd);
            pstm.setInt(1, this.productId);
            pstm.setInt(2, this.productSeries);
            pstm.setInt(3, this.customerId);
            pstm.setInt(4, this.orderId);
            pstm.setString(5, this.malfunctionDesc);
            pstm.setString(6, this.note);
            pstm.setString(7, this.location);
            pstm.setString(8, this.modifiedDate);
            pstm.setDouble(9, this.price);
            pstm.setInt(10, this.quantity);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("Fix History Added: " + e.getMessage());
        }
    }

    public int getProductID(String name) {
        int id = 0;
        try {
            String select = "select productID from product where productName = '" + name + "' ";
            pstm = cnn.prepareStatement(select);
            id = rs.getInt(1);
            cnn.close();
        } catch (Exception e) {
            System.out.println("Get ProductID:  " + e.getMessage());
        }
        return id;
    }

    public int getCustomerIdDB(String name) {
        int id = 0;
        System.out.println(this.customerName);
        try {
            String select = "select CustomerID from Customer where CustomerName like '%" + this.customerName + "%' ";
            pstm = cnn.prepareStatement(select);
            id = rs.getInt(1);
            cnn.close();
        } catch (Exception e) {
            System.out.println("Fix History Added: " + e.getMessage());
        }
        return id;
    }

    public List<Warranty> getFixHistoryListByCustomerName(String search) {
        List<Warranty> data = new ArrayList<Warranty>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select Warranty.[OrderID], customerName, PurchaseDate, FixDate, ProductID from Warranty\n"
                    + "join Customer on [Warranty].CustomerID = Customer.CustomerID \n"
                    + "join [Order] on [order].orderID = Warranty.orderID where CustomerName like '%" + search + "%' order by PurchaseDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                int productID = rs.getInt(5);
                if (!fixDate.isEmpty()) {
                    data.add(new Warranty(fixDate, customerName, purchaseDate, orderID, productID));
                }
            }
        } catch (Exception e) {
            System.out.println("getFixHistoryList: " + e.getMessage());
        }
        return data;
    }

    public List<Warranty> getFixHistoryListByOrderId(String search) {
        List<Warranty> data = new ArrayList<Warranty>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select Warranty.[OrderID], customerName, PurchaseDate, FixDate, ProductID from Warranty\n"
                    + "join Customer on [Warranty].CustomerID = Customer.CustomerID \n"
                    + "join [Order] on [order].orderID = Warranty.orderID where where OrderID = '" + search + "' order by PurchaseDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                int productID = rs.getInt(5);
                if (!fixDate.isEmpty()) {
                    data.add(new Warranty(fixDate, customerName, purchaseDate, orderID, productID));
                }
            }
        } catch (Exception e) {
            System.out.println("getFixHistoryList: " + e.getMessage());
        }
        return data;
    }

    public List<Warranty> getFixHistoryListByPhone(String search) {
        List<Warranty> data = new ArrayList<Warranty>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select Warranty.[OrderID], customerName, PurchaseDate, FixDate, ProductID from Warranty\n"
                    + "join Customer on [Warranty].CustomerID = Customer.CustomerID \n"
                    + "join [Order] on [order].orderID = Warranty.orderID where PhoneNumber like '%" + search + "%' order by PurchaseDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String fixDate = "";
                if (rs.getDate(4) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    fixDate = f.format(rs.getDate(4));
                }
                int productID = rs.getInt(5);
                if (!fixDate.isEmpty()) {
                    data.add(new Warranty(fixDate, customerName, purchaseDate, orderID, productID));
                }
            }
        } catch (Exception e) {
            System.out.println("getFixHistoryList: " + e.getMessage());
        }
        return data;
    }

    private int getproductID() {
        int id = 0;
        try {
            String select = "select ProductId from product where ProductName = '" + this.productName + "' ";
            pstm = cnn.prepareStatement(select);
            id = rs.getInt(1);
            cnn.close();
        } catch (Exception e) {
            System.out.println("Get ProductID: " + e.getMessage());
        }
        return id;
    }

    public int getNumberPage() {
        String strSelect = "select count(*) from [Warranty]";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total % 10 == 0 ? total / 10 : (total / 10 + 1);
                return countPage;
            }
        } catch (Exception e) {
            System.out.println("getNumberPageEmployee(): " + e.getMessage());
        }
        return 0;
    }
}

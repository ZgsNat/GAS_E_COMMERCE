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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minhn
 */
public class Orders {

    int orderID, customerID, productID, quantity, productPrice;
    double price, totalPrice;
    String purchaseDate, note, status;
    String priceConfig, totalPriceConfig, singularPriceConfig;
    int subtotal, discount, tax;
    String subtotalConfig, discountConfig, taxConfig;
    //new attributes:
    String customerName, phone, address, gmail, productName;
    String warrantyDate;
    String[] totalStatus = {"Order has been delivered & paid", "Order has been placed", "Order has been received", "Order has been shipped", "Order cancellation requested", "Order cancelled"};

    public Orders() {
        connect();
    }

    //Thong tin cho phan hien thi thong tin co ban cua cac don hang:
    public Orders(int orderID, String customerName, double totalPrice, String purchaseDate) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.totalPrice = totalPrice;
        this.purchaseDate = purchaseDate;
        connect();
    }

    public Orders(int orderID, String customerName, String purchaseDate, String totalPriceConfig) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.purchaseDate = purchaseDate;
        this.totalPriceConfig = totalPriceConfig;
        connect();
    }

    public Orders(String customerName, String purchaseDate, String status, int orderID) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.purchaseDate = purchaseDate;
        this.status = status;
        connect();
    }

    //Thong tin chi tiet cua mot don hang:
    public Orders(int orderID, int customerID, int productID, int quantity, double price, String purchaseDate, String note, double totalPrice) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.purchaseDate = purchaseDate;
        this.note = note;
        this.totalPrice = totalPrice;
        connect();
    }

    //OrderDetails -> Invoice
    public Orders(int orderID, int quantity, String purchaseDate, String note, String priceConfig, String totalPriceConfig, String customerName, String phone, String address, String gmail, String productName, String productPriceConfig, String subtotal, String discount, String tax) {
        this.orderID = orderID;
        this.quantity = quantity;
        this.purchaseDate = purchaseDate;
        this.note = note;
        this.priceConfig = priceConfig;
        this.totalPriceConfig = totalPriceConfig;
        this.customerName = customerName;
        this.phone = phone;
        this.address = address;
        this.gmail = gmail;
        this.productName = productName;
        this.singularPriceConfig = productPriceConfig;
        this.taxConfig = tax;
        this.subtotalConfig = subtotal;
        this.discountConfig = discount;
        connect();
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getSingularPriceConfig() {
        return singularPriceConfig;
    }

    public void setSingularPriceConfig(String singularPriceConfig) {
        this.singularPriceConfig = singularPriceConfig;
    }

    public String getTotalPriceConfig() {
        return totalPriceConfig;
    }

    public void setTotalPriceConfig(String totalPriceConfig) {
        this.totalPriceConfig = totalPriceConfig;
    }

    public String getPriceConfig() {
        return priceConfig;
    }

    public void setPriceConfig(String priceConfig) {
        this.priceConfig = priceConfig;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getWarrantyDate() {
        return warrantyDate;
    }

    public void setWarrantyDate(String warrantyDate) {
        this.warrantyDate = warrantyDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getTax() {
        return tax;
    }

    public void setTax(int tax) {
        this.tax = tax;
    }

    public String getSubtotalConfig() {
        return subtotalConfig;
    }

    public void setSubtotalConfig(String subtotalConfig) {
        this.subtotalConfig = subtotalConfig;
    }

    public String getDiscountConfig() {
        return discountConfig;
    }

    public void setDiscountConfig(String discountConfig) {
        this.discountConfig = discountConfig;
    }

    public String getTaxConfig() {
        return taxConfig;
    }

    public void setTaxConfig(String taxConfig) {
        this.taxConfig = taxConfig;
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

    //Used for displaying the list of all of the orders in the history
    public List<Orders> getOrderList(int index) {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice, Discount from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where status != 5 order by PurchaseDate desc OFFSET ? ROWS FETCH FIRST 15 ROWS ONLY";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, (index - 1) * 15);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
            }
        } catch (Exception e) {
            System.out.println("getOrderList: " + e.getMessage());
        }
        return data;
    }

    public List<Orders> getOrderList() {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice, Discount from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where status != 5 order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
            }
        } catch (Exception e) {
            System.out.println("getOrderList: " + e.getMessage());
        }
        return data;
    }

    //Used for displaying the list of recent orders within the General tab
    public List<Orders> getOrderListLimitted() {
        List<Orders> data = new ArrayList<Orders>();
        try {
            int count = 0;
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice, Discount from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where status != 5 order by PurchaseDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next() & count <= 6) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
                count++;
            }
        } catch (Exception e) {
            System.out.println("getOrderList: " + e.getMessage());
        }
        return data;
    }

    //Used for getting the details of a specific order
    public List<Orders> getOrderDetails(int id) {
        List<Orders> data = new ArrayList<Orders>();
        int subtotal = 0, tax;
        String discountS = "N/A", taxS = "", subtotalS = "";
        try {
            String strSelect = "select distinct Customer.CustomerName, PhoneNumber, PurchaseDate, Email, [Order].[Address], [Order].OrderID,Product.ProductName, \n"
                    + "count(OrderDetail.ProductSeries), OrderDetail.Price, TotalPrice, Note, Product.Price, [Order].Discount from OrderDetail join [Order] on OrderDetail.OrderID = [Order].OrderID\n"
                    + "join Customer on Customer.CustomerID=[Order].CustomerID \n"
                    + "join Product on Product.ProductID = OrderDetail.ProductID\n"
                    + "join ProductSeries on ProductSeries.ProductSeries = OrderDetail.ProductSeries\n"
                    + "group by [Order].OrderID, Customer.CustomerName, PhoneNumber, PurchaseDate, Email, [Order].[Address], [Order].OrderID,Product.ProductName, OrderDetail.Quantity,\n"
                    + "OrderDetail.Price, TotalPrice, Note, Product.Price, [Order].OrderID, [Order].Discount\n"
                    + "having [Order].OrderID = '" + id + "'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String cName = rs.getString(1);
                String phone = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
                    purchaseDate = f.format(rs.getDate(3));
                }
                String email = rs.getString(4);
                String address = rs.getString(5);
                int orderID = rs.getInt(6);
                String productName = rs.getString(7);
                int quantity = rs.getInt(8);
                double price = rs.getDouble(9);
                double totalPrice = rs.getDouble(10);
                String note = rs.getString(11);
                int productPrice = rs.getInt(12);
                int discount = 0;
                if (rs.getInt(13) != 0) {
                    discount = Integer.parseInt(rs.getString(13));
                    discountS = moneyconfig(discount) + " VND";
                }

                price = (int) productPrice * quantity;
                subtotal += price;
                tax = (subtotal - discount) / 10;
                totalPrice = (subtotal - discount) + (subtotal - discount) / 10;
                taxS = moneyconfig(tax);
                subtotalS = moneyconfig(subtotal);
                String cprice = moneyconfig((int) price);
                String tprice = moneyconfig((int) totalPrice);
                String productPriceConfig = moneyconfig(productPrice);
                data.add(new Orders(orderID, quantity, purchaseDate, note, cprice, tprice, cName, phone, address, email, productName, productPriceConfig, subtotalS, discountS, taxS));
            }
            System.out.println("subtotal: " + subtotal);
        } catch (Exception e) {
            System.out.println("getOrderDetails: " + e.getMessage());
        }
        return data;
    }

    public int todaySale() {
        int sale = 0;
        try {
            String strSelect = "select TotalPrice, PurchaseDate from [Order] where status=0";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                double price = rs.getDouble(1);
                String purchaseDate = "";
                if (rs.getDate(2) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(2));
                }
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                if (date.equals(LocalDate.now())) {
                    sale += price;
                }
            }
        } catch (Exception e) {
            System.out.println("getTodaySale: " + e.getMessage());
        }
        return sale;
    }

    public int monthlySale() {
        int sale = 0;
        LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue();
        try {
            String strSelect = "select TotalPrice, PurchaseDate from [Order] where status=0";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                double totalPrice = rs.getDouble(1);
                String purchaseDate = "";
                if (rs.getDate(2) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(2));
                }
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                int month = date.getMonthValue();
                if (month == currentMonth) {
                    sale += totalPrice;
                }
            }
        } catch (Exception e) {
            System.out.println("getTodaySale: " + e.getMessage());
        }
        return sale;
    }

    public int lastYearSale() {
        int sale = 0;
        LocalDate currentDate = LocalDate.now();
        int lastYear = currentDate.getYear() - 1;
        try {
            String strSelect = "select TotalPrice, PurchaseDate from [Order] where status=0";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                double price = rs.getDouble(1);
                String purchaseDate = "";
                if (rs.getDate(2) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(2));
                }
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                int year = date.getYear();
                if (year == lastYear) {
                    sale += price;
                }
            }
        } catch (Exception e) {
            System.out.println("getTodaySale: " + e.getMessage());
        }
        return sale;
    }

    public int yearSale() {
        int sale = 0;
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select TotalPrice, PurchaseDate from [Order] where status=0";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                double price = rs.getDouble(1);
                String purchaseDate = "";
                if (rs.getDate(2) != null) {
                    java.sql.Date sqlDate = rs.getDate(2);
                    java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                    purchaseDate = new SimpleDateFormat("dd-MM-yyyy").format(utilDate);
                }
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                int year = date.getYear();
                if (year == currentYear) {
                    sale += price;
                }
            }
        } catch (Exception e) {
            System.out.println("getTodaySale: " + e.getMessage());
        }
        return sale;
    }

    public List<Orders> getTodayOrderList() {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, TotalPrice, Discount from [Order] \n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                if (date.equals(LocalDate.now())) {
                    data.add(new Orders(orderID, customerName, purchaseDate, tprice));
                }
            }
        } catch (Exception e) {
            System.out.println("getTodayOrder: " + e.getMessage());
        }
        return data;
    }

    public List<Orders> getMonthOrderList() {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, TotalPrice, Discount from [Order] \n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                int month = date.getMonthValue();
                if (month == currentMonth) {
                    data.add(new Orders(orderID, customerName, purchaseDate, tprice));
                }
            }
        } catch (Exception e) {
            System.out.println("getMonthOrder: " + e.getMessage());
        }
        return data;
    }

    public List<Orders> getLastYearOrderList() {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int lastYear = currentDate.getYear() - 1;
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, TotalPrice, Discount from [Order] \n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                int year = date.getYear();
                if (year == lastYear) {
                    data.add(new Orders(orderID, customerName, purchaseDate, tprice));
                }
            }
        } catch (Exception e) {
            System.out.println("getMonthOrder: " + e.getMessage());
        }
        return data;
    }

    public List<Orders> getYearOrderList() {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, TotalPrice, Discount from [Order] \n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
//                totalPrice = (totalPrice-discount) + (totalPrice-discount)/10;
                String tprice = moneyconfig((int) totalPrice);
                LocalDate date = LocalDate.parse(purchaseDate, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                int year = date.getYear();
                if (year == currentYear) {
                    data.add(new Orders(orderID, customerName, purchaseDate, tprice));
                }
            }
        } catch (Exception e) {
            System.out.println("getMonthOrder: " + e.getMessage());
        }
        return data;
    }

    //For Order Management
    public List<Orders> getOrderManagement(int index) {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, [status] from [Order]\n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc OFFSET ? ROWS FETCH FIRST 15 ROWS ONLY";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, (index - 1) * 15);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                String customerName = rs.getString(2);
                String purchaseDate = "";
                if (rs.getDate(3) != null) {
                    SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
                    purchaseDate = f.format(rs.getDate(3));
                }
                int temp = rs.getInt(4);
                String status = "";
                switch (temp) {
                    case 0:
                        status = "Order has been delivered & paid";
                        break;
                    case 1:
                        status = "Order has been placed";
                        break;
                    case 2:
                        status = "Order has been received";
                        break;
                    case 3:
                        status = "Order has been shipped";
                        break;
                    case 4:
                        status = "Order cancellation requested";
                        break;
                    case 5:
                        status = "Order cancelled";
                        break;
                }
                data.add(new Orders(customerName, purchaseDate, status, orderID));
            }
        } catch (Exception e) {
            System.out.println("getOrderManagement: " + e.getMessage());
        }
        return data;
    }

    public List<Orders> getOrderManagement() {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, [status] from [Order]\n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc";
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
                int temp = rs.getInt(4);
                String status = "";
                switch (temp) {
                    case 0:
                        status = "Order has been delivered & paid";
                        break;
                    case 1:
                        status = "Order has been placed";
                        break;
                    case 2:
                        status = "Order has been received";
                        break;
                    case 3:
                        status = "Order has been shipped";
                        break;
                    case 4:
                        status = "Order cancellation requested";
                        break;
                    case 5:
                        status = "Order cancelled";
                        break;
                }
                data.add(new Orders(customerName, purchaseDate, status, orderID));
            }
        } catch (Exception e) {
            System.out.println("getOrderManagement: " + e.getMessage());
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

    public void updateStatus() {
        try {
            String strUpdate = "update [Order] set Status=? where OrderId=?";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setInt(1, Integer.parseInt(this.status));
            pstm.setInt(2, this.orderID);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("UpdateOrderStatus: " + e.getMessage());
        }
    }

    public List<Orders> getOrderManagement2() {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, [status], productSeriId from [Order]\n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID order by PurchaseDate desc";
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
                int temp = rs.getInt(4);
                String status = "";
                switch (temp) {
                    case 0:
                        status = "Order has been delivered & paid";
                        break;
                    case 1:
                        status = "Order has been placed";
                        break;
                    case 2:
                        status = "Order has been received";
                        break;
                    case 3:
                        status = "Order has been shipped";
                        break;
                    case 4:
                        status = "Order cancellation requested";
                        break;
                    case 5:
                        status = "Order cancelled";
                        break;
                }
                data.add(new Orders(customerName, purchaseDate, status, orderID));
            }
        } catch (Exception e) {
            System.out.println("getOrderManagement: " + e.getMessage());
        }
        return data;
    }

    //1. Search for showAllSales.jsp
    //a. Search by customer name
    public List<Orders> getOrderByCustomerName(String search) {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where CustomerName like '%" + search + "%' order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
            }
        } catch (Exception e) {
            System.out.println("getOrderListByName: " + e.getMessage());
        }
        return data;
    }

    //b. Search by order id
    public List<Orders> getOrderByOrderId(String search) {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where OrderID ='" + search + "' order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
            }
        } catch (Exception e) {
            System.out.println("getOrderListByOrderId: " + e.getMessage());
        }
        return data;
    }

    //c. search by phone number
    public List<Orders> getOrderByPhone(String search) {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where PhoneNumber like '%" + search + "%' order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
            }
        } catch (Exception e) {
            System.out.println("getOrderListByPhone: " + e.getMessage());
        }
        return data;
    }

    //2. Search for orderManagement.jsp
    //a. Search by Customer Name
    public List<Orders> getOrderManagementByCustomerName(String search) {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, [status] from [Order]\n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID where CustomerName like '%" + search + "%' order by PurchaseDate desc";
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
                int temp = rs.getInt(4);
                String status = "";
                switch (temp) {
                    case 0:
                        status = "Order has been delivered & paid";
                        break;
                    case 1:
                        status = "Order has been placed";
                        break;
                    case 2:
                        status = "Order has been received";
                        break;
                    case 3:
                        status = "Order has been shipped";
                        break;
                    case 4:
                        status = "Order cancellation requested";
                        break;
                    case 5:
                        status = "Order cancelled";
                        break;
                }
                data.add(new Orders(customerName, purchaseDate, status, orderID));
            }
        } catch (Exception e) {
            System.out.println("getOrderManagement: " + e.getMessage());
        }
        return data;
    }

    // b. Search by order id
    public List<Orders> getOrderManagementByOrderId(String search) {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, [status] from [Order]\n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID where OrderID = '" + search + "' order by PurchaseDate desc";
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
                int temp = rs.getInt(4);
                String status = "";
                switch (temp) {
                    case 0:
                        status = "Order has been delivered & paid";
                        break;
                    case 1:
                        status = "Order has been placed";
                        break;
                    case 2:
                        status = "Order has been received";
                        break;
                    case 3:
                        status = "Order has been shipped";
                        break;
                    case 4:
                        status = "Order cancellation requested";
                        break;
                    case 5:
                        status = "Order cancelled";
                        break;
                }
                data.add(new Orders(customerName, purchaseDate, status, orderID));
            }
        } catch (Exception e) {
            System.out.println("getOrderManagement: " + e.getMessage());
        }
        return data;
    }

    // c. Search by phone number
    public List<Orders> getOrderManagementByPhone(String search) {
        List<Orders> data = new ArrayList<Orders>();
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        try {
            String strSelect = "select OrderID, customerName, PurchaseDate, [status] from [Order]\n"
                    + "join Customer on [order].CustomerID = Customer.CustomerID where PhoneNumber like '%" + search + "%' order by PurchaseDate desc";
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
                int temp = rs.getInt(4);
                String status = "";
                switch (temp) {
                    case 0:
                        status = "Order has been delivered & paid";
                        break;
                    case 1:
                        status = "Order has been placed";
                        break;
                    case 2:
                        status = "Order has been received";
                        break;
                    case 3:
                        status = "Order has been shipped";
                        break;
                    case 4:
                        status = "Order cancellation requested";
                        break;
                    case 5:
                        status = "Order cancelled";
                        break;
                }
                data.add(new Orders(customerName, purchaseDate, status, orderID));
            }
        } catch (Exception e) {
            System.out.println("getOrderManagement: " + e.getMessage());
        }
        return data;
    }

    public int getNumberPage() {
        String strSelect = "select count(*) from [Order]";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total % 15 == 0 ? total / 15 : (total / 15 + 1);
                return countPage;
            }
        } catch (Exception e) {
            System.out.println("getNumberPageEmployee(): " + e.getMessage());
        }
        return 0;
    }

    public int getCustomerIDByOrder(int orderId) {
        String strSelect = "select CustomerID from [Order] where orderID = '" + orderId + "' ";
        int id = 0;
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getCustomerIDByOrder(): " + e.getMessage());
        }
        return id;
    }

    public void addOrder(double total, double discount, int couponid, String name, String phone, String address, Cart productbuy, String CusID, boolean paymentmethod) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String strInsert = "INSERT [dbo].[Order] ([CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) "
                + "VALUES ( ?, ?, ?, ?, 0, 0, ?, ?, ?, ?, ?, ?)";
        try {
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, CusID.trim());
            pstm.setString(2, dtf.format(LocalDateTime.now()));
            pstm.setInt(3, (int) total);
            pstm.setBoolean(4, paymentmethod);
            if (couponid == 0) {
                pstm.setNull(5, java.sql.Types.INTEGER);
            } else {
                pstm.setInt(5, couponid);
            }
            pstm.setString(6, "");
            pstm.setString(7, name.trim());
            pstm.setString(8, phone.trim());
            pstm.setString(9, address.trim());
            pstm.setInt(10, (int) discount);
            pstm.execute();
            cnn.close();
        } catch (Exception e) {
            System.out.println("addOrder: " + e.getMessage());
        }
        int orderid = getLastID();
        for (Item product : productbuy.getItems()) {
            addOrderDetail(orderid, product, product.getQuantity());
        }

        Coupon c = new Coupon();
        c.promoteCouponUsed(CusID, couponid);
    }

    private int getLastID() {
        connect();
        try {
            String strSelect = "select [OrderID] from [Order] order by [OrderID] desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                System.out.println(id);
                return id;
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getLastID(): " + e.getMessage());
        }
        return -1;
    }

    private void addOrderDetail(int id, Item product, int quantity) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String strInsert = "INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) "
                + "VALUES (?, ?, ?, 1, ?, ?, 0)";
        int[] pseries = getProductSeries(product.getProduct().getProductID(), quantity);
        System.out.println("price: " + product.getPrice());
        for (int psery : pseries) {
            try {
                pstm = cnn.prepareStatement(strInsert);
                pstm.setInt(1, id);
                pstm.setInt(2, product.getProduct().getProductID());
                pstm.setInt(3, psery);
                pstm.setFloat(4, (float) product.getPrice());
                pstm.setString(5, dtf.format(LocalDateTime.now().plusYears(1)));
                pstm.execute();

            } catch (Exception e) {
                System.out.println("addOrderDetail: " + psery + " :" + e.getMessage());
            }
        }
    }

    private int[] getProductSeries(int productID, int quantity) {
        int[] data = new int[quantity];
        int count = 0;
        String strSelect = "select top " + quantity + " ProductSeries from ProductSeries where ProductID = " + productID + " and sold = 0";
        try {
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                data[count] = rs.getInt(1);
                count++;
            }
        } catch (Exception e) {
            System.out.println("getProductSeries: " + e.getMessage());
        }
        connect();
        for (int i : data) {
            String strUpdate = "update ProductSeries set sold = 1 where ProductSeries = ?";
//            System.out.println("product number:" + i);
            try {
                pstm = cnn.prepareStatement(strUpdate);
                pstm.setInt(1, i);
                pstm.execute();
            } catch (Exception e) {
                System.out.println("setProductSerie: " + e.getMessage());
            }
        }
        return data;
    }

    public int getOrderSize() {
        String strSelect = "select count(*) from [Order]";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println("getOrderNumber(): " + e.getMessage());
        }
        return 0;
    }

    public int[] getAllOrderID(int orderSize) {
        int orderTotal[] = new int[orderSize];
        String strSelect = "select OrderID from [Order] order by PurchaseDate desc";
        int count = 0;
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            System.out.print("ID: ");
            while (rs.next()) {
                int id = rs.getInt(1);
                orderTotal[count]=id;
                count++;
            }for (int i = 0; i < orderSize; i++) {
                System.out.print(orderTotal[i] + " ");
            }
        } catch (Exception e) {
            System.out.println("getOrderNumber(): " + e.getMessage());
        }
        return orderTotal;
    }

    public List<Orders> getListOrderBycID(String CusID) {
        List<Orders> data = new ArrayList<Orders>();
        try {
            String strSelect = "select OrderID, CustomerName, PurchaseDate, TotalPrice, Discount from [Order]\n"
                    + "join Customer on [Order].CustomerID = Customer.CustomerID where [order].customerId='"+CusID+"' order by PurchaseDate desc";
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
                double totalPrice = rs.getDouble(4);
                int discount = rs.getInt(5);
                String tprice = moneyconfig((int) totalPrice);
                data.add(new Orders(orderID, customerName, purchaseDate, tprice));
            }
        } catch (Exception e) {
            System.out.println("getOrderList: " + e.getMessage());
        }
        return data;
    }
}
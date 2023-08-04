/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Peanut
 */
public class Product {

    private int productID;
    private String productName;
    private int categoryID;
    private double productPrice;
    private int quantity;
    private String warranttyPeriod;
    private String createdDate;
    private String modifiedDate;
    private int createdBy;
    private int modifiedBy;
    private String categoryName;
    private String detail;
    private int status;
    public String money;
    public String smallImg;
    private String createdByName;
    private String modifiedByName;
    private String multiImg;
    private int numberOfWarranty;

    public Product() {
        connect();
    }

    public Product(String multiImg) {
        this.multiImg = multiImg;
        connect();
    }

    public Product(int categoryID) {
        this.categoryID = categoryID;
        connect();
    }

    public Product(int productID, String productName) {
        this.productID = productID;
        this.productName = productName;
        connect();
    }

    public Product(int productID, int categoryID) {
        this.productID = productID;
        this.categoryID = categoryID;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String createdDate) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.createdDate = createdDate;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String createdDate, String categoryName, String smallImg) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.categoryName = categoryName;
        this.smallImg = smallImg;
        connect();
    }

    public Product(int productID, String productName, double productPrice, int quantity, String createdDate, String categoryName) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.categoryName = categoryName;
        connect();
    }

    private Product(int productID, String productName, int categoryID, int quantity, String warrantyPeriod, String categoryName, String detail, double price, String smallImg) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.warranttyPeriod = warrantyPeriod;
        this.categoryName = categoryName;
        this.detail = detail;
        this.productPrice = price;
        this.smallImg = smallImg;
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail, int status) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        this.status = status;
        connect();
    }

    public Product(int productID, String productName, double productPrice, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String detail) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.detail = detail;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        connect();
    }

    public Product(int productID, String productName, int quantity, String createdDate, String categoryName, String money) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.categoryName = categoryName;
        this.money = money;
        connect();
    }

    public Product(int productID, String productName, int categoryID, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail, String money) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        this.money = money;
        connect();
    }

    public Product(int productID, String productName, int categoryID, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail, String money, String smallImg, String createdByName) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        this.money = money;
        this.smallImg = smallImg;
        this.createdByName = createdByName;
        connect();
    }

    public Product(int productID, String productName, int categoryID, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int modifiedBy, String categoryName, String detail, String money, String smallImg, String createdByName) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        this.money = money;
        this.smallImg = smallImg;
        this.createdByName = createdByName;
        connect();
    }

    public Product(int productID, String productName, int categoryID, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, String categoryName, String detail, String money, String smallImg, String createdByName, String modifiedByName) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.categoryName = categoryName;
        this.detail = detail;
        this.money = money;
        this.smallImg = smallImg;
        this.createdByName = createdByName;
        this.modifiedByName = modifiedByName;
        connect();
    }

    public Product(int productID, String productName, int categoryID, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail, String money, String smallImg) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        this.money = money;
        this.smallImg = smallImg;
        connect();
    }

    public Product(int productID, String productName, int categoryID, double productPrice, int quantity, String warranttyPeriod, String createdDate, String modifiedDate, int createdBy, int modifiedBy, String categoryName, String detail, int status, String money, String smallImg) {
        this.productID = productID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.warranttyPeriod = warranttyPeriod;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.categoryName = categoryName;
        this.detail = detail;
        this.status = status;
        this.money = money;
        this.smallImg = smallImg;
        connect();
    }

    public Product(int productID, String productName, int quantity, String createdDate, String categoryName, String money, String smallImg) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.categoryName = categoryName;
        this.money = money;
        this.smallImg = smallImg;
        connect();
    }

    public Product(int productID, String productName, int quantity, String createdDate, String categoryName, String money, String smallImg, int categoryID, int numberOfWarranty) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.categoryName = categoryName;
        this.money = money;
        this.smallImg = smallImg;
        this.categoryID = categoryID;
        this.numberOfWarranty = numberOfWarranty;
        connect();
    }

    public Product(int productID, String productName, int quantity, String createdDate, String categoryName, String money, String smallImg, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.categoryName = categoryName;
        this.money = money;
        this.smallImg = smallImg;
        this.categoryID = categoryID;
        connect();
    }

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getWarranttyPeriod() {
        return warranttyPeriod;
    }

    public void setWarranttyPeriod(String warranttyPeriod) {
        this.warranttyPeriod = warranttyPeriod;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
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

    public String getMultiImg() {
        return multiImg;
    }

    public void setMultiImg(String multiImg) {
        this.multiImg = multiImg;
    }

    public int getNumberOfWarranty() {
        return numberOfWarranty;
    }

    public void setNumberOfWarranty(int numberOfWarranty) {
        this.numberOfWarranty = numberOfWarranty;
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

    public List<Product> getListProductAtStart() {
        List<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "SELECT CategoryName, Product.ProductID, ProductName, Price, Quantity, Product.CreatedDate, Product.[Status], smallImg, Category.CategoryID\n"
                    + "FROM Product JOIN Category ON Product.CategoryID = Category.CategoryID";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();

            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String smallImg = rs.getString(8);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    int categoryID = rs.getInt(7);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));

                }
            }
        } catch (Exception e) {
            System.out.println("getListProductAtStart(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> getListProductWithCategory() {
        List<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select CategoryName, Product.ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Category.CategoryID \n"
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Category.CategoryID = ?";

            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, categoryID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = rs.getString(6);
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));

                }

            }
        } catch (Exception e) {
            System.out.println("getListProductWithCategory(): " + e.getMessage());
        }
        return data;
    }

    public void deleteProduct(int productID) {
        try {
            String strUpdate = "UPDATE Product SET Status = 0 WHERE ProductID = ?";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setInt(1, productID);
            pstm.execute();
            System.out.println("Product Deleted!!");
        } catch (Exception e) {
            System.out.println("deleteProduct(): " + e.getMessage());
        }
    }

    public void getUpdateProduct(int pID) {
        try {
            String strSelect = "select Product.ProductID, ProductName, Product.CategoryID, Price, Quantity, WarrantyPeriod, \n"
                    + "Product.CreatedDate, Product.ModifiedDate, Product.CreatedBy, Product.ModifiedBy, DetailProduct, SmallImg, CategoryName \n"
                    + "from Product join Category on Product.CategoryID = Category.CategoryID \n"
                    + "where Product.ProductID = ?";

            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                productID = rs.getInt(1);
                productName = rs.getString(2);
                categoryID = rs.getInt(3);
                productPrice = rs.getDouble(4);
                quantity = rs.getInt(5);
                warranttyPeriod = rs.getString(6);
                createdDate = rs.getString(7);
                modifiedDate = ConvertFormateDate(rs.getString(8));
                createdBy = rs.getInt(9);
                modifiedBy = rs.getInt(10);
                detail = rs.getString(11);
                smallImg = rs.getString(12);
                categoryName = rs.getString(13);

            }
        } catch (Exception e) {
            System.out.println("getUpdateProduct(): " + e.getMessage());
        }
    }

    public void update(int pID, String pName, int cID, double pPrice, int pQuantity, String pWarranty, String modifiedDate, int pModifiedBy, String pDetail, String imageUrl) {
        try {
            String strUpdate = "update Product "
                    + "set ProductName=?, "
                    + "CategoryID=?, "
                    + "Price=?, "
                    + "Quantity=?, "
                    + "WarrantyPeriod=?, "
                    + "ModifiedDate=?, "
                    + "ModifiedBy=?, "
                    + "DetailProduct=?, "
                    + "smallImg=? "
                    + "where ProductID=?";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, pName);
            pstm.setInt(2, cID);
            pstm.setDouble(3, pPrice);
            pstm.setInt(4, pQuantity);
            pstm.setString(5, pWarranty);
            pstm.setString(6, modifiedDate);
            pstm.setInt(7, pModifiedBy);
            pstm.setString(8, pDetail);
            pstm.setString(9, imageUrl);
            pstm.setInt(10, pID);
            pstm.execute();
            System.out.println("Product Updated!!!");
        } catch (Exception e) {
            System.out.println("update(): " + e.getMessage());
        }
    }

    public boolean checkProductExist(String pName) {
        try {
            String strSelect = "select ProductID from Product "
                    + "where ProductName=? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, pName);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkProductExist():" + e.getMessage());
        }
        return false;
    }

    public void insertProduct(String pName, int cID, double pPrice, int pQuantity, String pWarranty, String pCreatedDate, int pCreatedBy, String pDetail, String imageName) {
        try {
            String strInsert = "insert into Product ([ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate],  [CreatedBy], [DetailProduct], smallImg)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, pName);
            pstm.setInt(2, cID);
            pstm.setDouble(3, pPrice);
            pstm.setInt(4, pQuantity);
            pstm.setString(5, pWarranty);
            pstm.setString(6, pCreatedDate);
            pstm.setInt(7, pCreatedBy);
            pstm.setString(8, pDetail);
            pstm.setString(9, imageName);
            pstm.execute();
            System.out.println("Product Added!!");
        } catch (Exception e) {
            System.out.println("insertProduct(): " + e.getMessage());
        }
    }

    public List<Product> getProductDetail(int pID) {
        List<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select Product.CategoryID, CategoryName, Product.ProductID, ProductName, Price, Quantity, WarrantyPeriod, Product.CreatedDate, \n"
                    + "Product.ModifiedDate, AdminName as CreatedBy, AdminName as ModifiedBy, DetailProduct, smallImg \n"
                    + "from Product join Category on Product.CategoryID = Category.CategoryID join [Admin] \n"
                    + "on [Admin].AdminID = Product.CreatedBy\n"
                    + "where Product.ProductID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();

            while (rs.next()) {
                int categoryID = rs.getInt(1);
                String categoryName = rs.getString(2);
                int productID = rs.getInt(3);
                String productName = rs.getString(4);
                double productPrice = rs.getDouble(5);
                String price = moneyconfig((int) productPrice);
                int quantity = rs.getInt(6);
                String warrantyPeriod = rs.getString(7);
                String createdDate = ConvertFormateDate(rs.getString(8));
                String modifiedDate = ConvertFormateDate(rs.getString(9));
                String createdByName = rs.getString(10);
                String modifiedByName = rs.getString(11);
                //int modifiedBy = rs.getInt(11);
                String detail = rs.getString(12);
                String smallImg = rs.getString(13);
                data.add(new Product(productID, productName, categoryID, quantity, warrantyPeriod, createdDate, modifiedDate, categoryName, detail, price, smallImg, createdByName, modifiedByName));

            }
        } catch (Exception e) {
            System.out.println("getProductDetail(): " + e.getMessage());
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

    public List searchProduct(String categories, String content) {
        connect();
        List<Product> data = new ArrayList<>();
        String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, status, smallImg \n"
                + "from Product join Category on Product.CategoryID = Category.CategoryID where";
        if (!categories.equals("")) {
            strSelect += " Product.CategoryID = ? AND ";
        }
        if (!content.equals("")) {
            strSelect += " [ProductName] LIKE ? AND ";
        }
        strSelect = strSelect.substring(0, strSelect.length() - 5) + "";
        try {
            System.out.println(strSelect);
            int count = 1;
            pstm = cnn.prepareStatement(strSelect);
            if (!categories.equals("")) {
                pstm.setString(count, categories);
                count++;
            }
            if (!content.equals("")) {
                pstm.setString(count, "%" + content + "%");
                count++;
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    String smallImg = rs.getString(8);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg));
                }

            }
            cnn.close();
            System.out.println("Product Searched!!");
        } catch (SQLException ex) {
            System.out.println("Product Search: " + ex.getMessage());
        }
        return data;
    }

    public List<Product> getDataPage(int page, List<Product> p, int npp) {
        //npp: number of coupons per page 
        List<Product> list = new ArrayList<>();
        for (int i = 0; i < p.size(); i++) {
            if (i / npp == page - 1) {
                list.add(p.get(i));
            }
        }
        return list;
    }

    public Product getProductByID(int pID) {
        try {
            String strSelect = "select Product.CategoryID, CategoryName, ProductID, ProductName, Price, Quantity, WarrantyPeriod, Product.CreatedDate, Product.ModifiedDate, Product.CreatedBy, Product.ModifiedBy, DetailProduct, smallImg "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.ProductID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();

            while (rs.next()) {
                int categoryID = rs.getInt(1);
                String categoryName = rs.getString(2);
                int productID = rs.getInt(3);
                String productName = rs.getString(4);
                double productPrice = rs.getDouble(5);
                String price = moneyconfig((int) productPrice);
                int quantity = rs.getInt(6);
                String warrantyPeriod = rs.getString(7);
                String createdDate = "", modifiedDate = "";
                createdDate = rs.getString(8);
                if (createdDate != null) {
                    createdDate = ConvertFormateDate(createdDate);
                }
                modifiedDate = rs.getString(9);
                if (modifiedDate != null) {
                    modifiedDate = ConvertFormateDate(modifiedDate);
                }

                int createdBy = rs.getInt(10);
                int modifiedBy = rs.getInt(11);
                String detail = rs.getString(12);
                String smallImg = rs.getString(13);
                return new Product(productID, productName, categoryID, quantity, warrantyPeriod, createdDate, modifiedDate, createdBy, modifiedBy, categoryName, detail, price, smallImg);

            }
        } catch (Exception e) {
            System.out.println("getProductDetail(): " + e.getMessage());
        }
        return null;
    }

    public Product getProductDetailClientSite(int pID) {
        Product data = new Product();
        try {
            String strSelect = "select Product.CategoryID, CategoryName, ProductID, ProductName, Price, Quantity, WarrantyPeriod, Product.CreatedDate, Product.ModifiedDate, Product.CreatedBy, Product.ModifiedBy, DetailProduct, smallImg "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.ProductID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();

            while (rs.next()) {
                int categoryID = rs.getInt(1);
                String categoryName = rs.getString(2);
                int productID = rs.getInt(3);
                String productName = rs.getString(4);
                double productPrice = rs.getDouble(5);
                String price = moneyconfig((int) productPrice);
                int quantity = rs.getInt(6);
                String warrantyPeriod = rs.getString(7);
                String createdDate = ConvertFormateDate(rs.getString(8));
                String modifiedDate = ConvertFormateDate(rs.getString(9));
                int createdBy = rs.getInt(10);
                int modifiedBy = rs.getInt(11);
                String detail = rs.getString(12);
                String smallImg = rs.getString(13);
                data = new Product(productID, productName, categoryID, quantity, warrantyPeriod, createdDate, modifiedDate, createdBy, modifiedBy, categoryName, detail, price, smallImg);

            }
        } catch (Exception e) {
            System.out.println("getProductDetailClientSite(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Product> getListProductWithCategory1(int cID) {
        ArrayList<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, status, smallImg, Product.CategoryID "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.CategoryID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = rs.getString(6);
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductWithCategory1(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Product> getListProductWithCategory2(int cID) {
        ArrayList<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, status, smallImg, Product.CategoryID "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.CategoryID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = rs.getString(6);
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductWithCategory2(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Product> getListProductWithCategory3(int cID) {
        ArrayList<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, status, smallImg, Product.CategoryID "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.CategoryID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = rs.getString(6);
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductWithCategory3(): " + e.getMessage());
        }
        return data;
    }

    public int getTotalQuantityWithCategory1(int cID) {
        int result = 0;
        try {
            String strSelect = "SELECT SUM(Quantity) AS TotalQuantity FROM [dbo].[Product] WHERE CategoryID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getTotalQuantityWithCategory1():" + e.getMessage());
        }
        return result;
    }

    public int getTotalQuantityWithCategory2(int cID) {
        int result = 0;
        try {
            String strSelect = "SELECT SUM(Quantity) AS TotalQuantity FROM [dbo].[Product] WHERE CategoryID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getTotalQuantityWithCategory2():" + e.getMessage());
        }
        return result;
    }

    public int getTotalQuantityWithCategory3(int cID) {
        int result = 0;
        try {
            String strSelect = "SELECT SUM(Quantity) AS TotalQuantity FROM [dbo].[Product] WHERE CategoryID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getTotalQuantityWithCategory3():" + e.getMessage());
        }
        return result;
    }

    public List<Product> getRelatedProduct() {
        List<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, status, smallImg, Product.CategoryID "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.CategoryID = ? AND ProductID <> ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, categoryID);
            pstm.setInt(2, productID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = rs.getString(6);
                    int categoryID = rs.getInt(9);
                    String smallImg = rs.getString(8);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getRelatedProduct(): " + e.getMessage());
        }
        return data;
    }

    public int getTotalPage(int cID) {
        try {
            String strSelect = "";
            if (cID == 0) {
                strSelect = "SELECT count(*) from Product where [Status] = 1";
                pstm = cnn.prepareStatement(strSelect);
            } else {
                strSelect = "SELECT count(*) from Product where [Status] = 1 and CategoryID = ?";

                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(1, cID);
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total % 6 == 0 ? total / 6 : (total / 6 + 1);
                return countPage;
            }
        } catch (Exception e) {
            System.out.println("getTotalPage():" + e.getMessage());
        }
        return 0;
    }

    public List<Product> getListProduct() {
        ArrayList<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                    + "from Product join Category on Product.CategoryID = Category.CategoryID";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();

            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    int quantity = rs.getInt(5);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, categoryID, productPrice, quantity, createdDate, categoryName, smallImg));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductAtStart(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> getListProductAtStart(int page, int cID) {
        List<Product> data = new ArrayList<>();

        try {
            if (cID == 0) {
                String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.Status = 1 "
                        + "order by Product.ProductID OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(1, (page - 1) * 6);
            } else {
                String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.Status = 1 and Product.CategoryID = ? "
                        + "order by Product.ProductID OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(2, (page - 1) * 6);
                pstm.setInt(1, cID);
            }
            rs = pstm.executeQuery();

            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductAtStart(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> getMultiImg(int pID) {
        List<Product> data = new ArrayList<Product>();
        try {
            String strSelect = "select Img from ProductImg join Product on Product.ProductID = ProductImg.ProductID where Product.ProductID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pID);
            rs = pstm.executeQuery();

            while (rs.next()) {
                String multiImg = rs.getString(1);
                data.add(new Product(multiImg));
            }
        } catch (Exception e) {
            System.out.println("getMultiImg(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> searchProductAjax(String txtSearch, int categoryId) {
        List<Product> data = new ArrayList<Product>();
        String strSelect = "";
        try {
            if (categoryId == 0) {
                strSelect = "select CategoryName, Product.ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Category.CategoryID \n"
                        + "from Product join Category on Product.CategoryID = Category.CategoryID  where Product.ProductName like ?";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setString(1, "%" + txtSearch + "%");
            } else {
                strSelect = "select CategoryName, Product.ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Category.CategoryID \n"
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.ProductName like ? and Category.CategoryID = ?";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setString(1, "%" + txtSearch + "%");
                pstm.setString(2, String.valueOf(categoryId));

            }
            rs = pstm.executeQuery();

            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String smallImg = rs.getString(8);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    int categoryID = rs.getInt(7);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));

                }
            }
        } catch (Exception e) {
            System.out.println("searchProductAjax(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> getListProductLowToHighPrice(int page, int cID) {
        List<Product> data = new ArrayList<>();
        try {
            if (cID == 0) {
                String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.Status = 1 "
                        + "order by Price OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(1, (page - 1) * 6);
            } else {
                String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.Status = 1 and Product.CategoryID = ? "
                        + "order by Price OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(2, (page - 1) * 6);
                pstm.setInt(1, cID);
            }
            rs = pstm.executeQuery();

            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductHighToLowPrice(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> getListProductHighToHighLow(int page, int cID) {
        List<Product> data = new ArrayList<>();
        try {
            if (cID == 0) {
                String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.Status = 1 "
                        + "order by Price desc OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(1, (page - 1) * 6);
            } else {
                String strSelect = "select CategoryName, ProductID, ProductName, Price, Quantity, Product.CreatedDate, Status, smallImg, Product.CategoryID "
                        + "from Product join Category on Product.CategoryID = Category.CategoryID where Product.Status = 1 and Product.CategoryID = ? "
                        + "order by Price desc OFFSET ? ROWS FETCH FIRST 6 ROWS ONLY";
                pstm = cnn.prepareStatement(strSelect);
                pstm.setInt(2, (page - 1) * 6);
                pstm.setInt(1, cID);
            }
            rs = pstm.executeQuery();

            while (rs.next()) {
                int status = rs.getInt(7);
                if (status == 1) {
                    String categoryName = rs.getString(1);
                    int productID = rs.getInt(2);
                    String productName = rs.getString(3);
                    double productPrice = rs.getDouble(4);
                    String price = moneyconfig((int) productPrice);
                    int quantity = rs.getInt(5);
                    String createdDate = ConvertFormateDate(rs.getString(6));
                    String smallImg = rs.getString(8);
                    int categoryID = rs.getInt(9);
                    data.add(new Product(productID, productName, quantity, createdDate, categoryName, price, smallImg, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println("getListProductHighToLowPrice(): " + e.getMessage());
        }
        return data;
    }

    public List<Product> getProductListOrder() {
        List<Product> data = new ArrayList<>();
        try {
            String strSelect = "select productId, productName from product";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                data.add(new Product(id, name));
            }
        } catch (Exception e) {
            System.out.println("getProductListOrder(): " + e.getMessage());
        }
        return data;
    }

    public int getPriceById(int productId) {
        int price = 0;
        try {
            String strSelect = "select price from product where productID= '" + productId + "'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                price = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getProductPrice(): " + e.getMessage());
        }
        return price;
    }

}

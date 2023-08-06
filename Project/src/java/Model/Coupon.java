/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.google.gson.annotations.Expose;
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
import java.util.Date;

/**
 *
 * @author CAT PHUONG
 */
public class Coupon {


    @Expose
    private String name;

    @Expose
    private int id;

    @Expose
    private String message;

    @Expose
    private Date valid_from;

    @Expose
    private Date valid_to;

    @Expose
    private String createdDate;

    @Expose
    private String modifiedDate;

    @Expose
    private String createdBy;

    @Expose
    private String modifiedBy;

    @Expose
    private boolean free_check;

    @Expose
    private boolean type;

    @Expose
    private List<Product> productDiscounted;

    @Expose
    private List<Product> productRequired;

    @Expose
    private int status;

    @Expose
    private String bill_condition;

    @Expose
    private String max_value;

    @Expose
    private String value;

    @Expose
    private double discount_value;

    @Expose
    private int quantity;

    @Expose
    private String avatar;
    
    @Expose
    private int progress;
    private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
    

    public Coupon() {
    }

    public Coupon(String name, int id, String message, Date valid_from, Date valid_to, String createdDate, String modifiedDate, String createdBy, String modifiedBy, boolean free_check, boolean type, List<Product> productDiscounted, List<Product> productRequired, String bill_condition, String max_value, int status, String value, int quantity, String avatar) {
        this.name = name;
        this.id = id;
        this.message = message;
        this.valid_from = valid_from;
        this.valid_to = valid_to;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.free_check = free_check;
        this.type = type;
        this.productDiscounted = productDiscounted;
        this.productRequired = productRequired;
        this.bill_condition = bill_condition;
        this.max_value = max_value;
        this.status = status;
        this.value = value;
        this.quantity = quantity;
        this.avatar = avatar;
    }

    public int getProgress() {
        
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscount_value() {
        if(this.progress == 100) return 0;
        else return discount_value;
    }

    public void setDiscount_value(double discount_value) {
        this.discount_value = discount_value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getValid_fromString() {
        return format.format(valid_from);
    }

    public Date getValid_from() {
        return valid_from;
    }

    public void setValid_from(Date valid_from) {
        this.valid_from = valid_from;
    }

    public String getValid_toString() {
        return format.format(valid_to);
    }

    public Date getValid_to() {
        return valid_to;
    }

    public void setValid_to(Date valid_to) {
        this.valid_to = valid_to;
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

    public boolean isFree_check() {
        return free_check;
    }

    public void setFree_check(boolean free_check) {
        this.free_check = free_check;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public List<Product> getProductDiscounted() {
        return productDiscounted;
    }

    public void setProductDiscounted(List<Product> productDiscounted) {
        this.productDiscounted = productDiscounted;
    }

    public List<Product> getProductRequired() {
        return productRequired;
    }

    public void setProductRequired(List<Product> productRequired) {
        this.productRequired = productRequired;
    }

    public String getBill_condition() {
        return bill_condition;
    }

    public void setBill_condition(String bill_condition) {
        this.bill_condition = bill_condition;
    }

    public String getMax_value() {
        return max_value;
    }

    public void setMax_value(String max_value) {
        this.max_value = max_value;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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
    
    public int getCouponProgress(int couID){
        connect();
        try {
            String strSelect = "select count(CouponID) from [Order] where CouponID="+couID;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1)*100;
            }
        }catch(Exception e){
            System.out.println("getCouponProgress");
            e.printStackTrace();
        }
        return 0;
    }

    public List<Coupon> getAllCoupon() {
        connect();
        Date now = new Date();
        List<Coupon> data = new ArrayList<>();
        try {
            String strSelect = "SELECT [CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [CreatedDate],"
                    + " [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Quantity], [Avatar] "
                    + "from Coupon order by CreatedDate desc, ModifiedDate desc";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);

                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);
                }

                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = rs.getInt(12);
                int maxvalue = rs.getInt(13);
                String bill_condition = moneyconfig((int) billcondition);
                String max_value = moneyconfig((int) maxvalue);
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                String avatar = rs.getString(16);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;
                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                }
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;

                Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
//                System.out.println(id + ": quantity:" + quantity);
                data.add(c);
                
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getAllCoupon(): " + e.getMessage());
        }

        for (Coupon coupon : data) {
            coupon.progress = getCouponProgress(coupon.id)/coupon.quantity; 
            coupon.productDiscounted = getCouponDetailByID(coupon.id, "Product_discounted");
            coupon.productRequired = getCouponDetailByID(coupon.id, "Product_required");
            if (coupon.productDiscounted.isEmpty()) {
                coupon.type = true;
            }
        }
        return data;
    }

    public int addCoupon(String name, String message, LocalDate valid_from, LocalDate valid_to, String value,
            int bill_condition, int max_value, int free_check, int adminID, int quantity, String avatar) {
        connect();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        try {
            String strInsert = "INSERT [dbo].[Coupon] ([Name], [Message], [valid_from], [valid_to], [free_check],"
                    + " [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Quantity], [Avatar])  "
                    + "VALUES (? , ?, ?, ?, ?, ?, ?, ?, null, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, name);
            pstm.setString(2, message);
            pstm.setString(3, valid_from.toString());
            pstm.setString(4, valid_to.toString());
            pstm.setInt(5, free_check);
            pstm.setString(6, dtf.format(LocalDateTime.now()));
            pstm.setString(7, null);
            pstm.setInt(8, adminID);
            pstm.setString(9, value);
            pstm.setInt(10, bill_condition);
            pstm.setInt(11, max_value);
            pstm.setInt(12, quantity);
            if (avatar.isEmpty()) {
                pstm.setString(13, "VoucherDefault.jpg");
            } else {
                pstm.setString(13, avatar);
            }
            pstm.execute();
            cnn.close();
        } catch (Exception e) {
            System.out.println("addCoupon(): " + e.getMessage());
        }

        return getLastID();
    }

    public void updateCoupon(int id, String name, String message, LocalDate valid_from, LocalDate valid_to, String value, String bill_condition,
            String max_value, String[] productRequired, String[] productDiscounted, int free_check, int adminID, int quantity, String avatar) {
        connect();
        deleteCouponDetail(id);
        addCouponDetail(id, productRequired, productDiscounted);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        try {
            String strUpdate = "UPDATE Coupon\n"
                    + "SET Name = ?, Message = ?, valid_from = ?,valid_to = ?,[ModifiedDate] = ?, [free_check] = ?, [ModifiedBy] = ?, [Quantity] = ? ";
            if (!avatar.isEmpty()) {
                strUpdate += ", [Avatar] = ? \n"
                        + "WHERE CouponID =? ";
            } else {
                strUpdate += "\n WHERE CouponID =? ";
            }
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, name);
            pstm.setString(2, message);
            pstm.setString(3, valid_from.toString());
            pstm.setString(4, valid_to.toString());
            pstm.setString(5, dtf.format(LocalDate.now()));
            pstm.setInt(6, free_check);
            pstm.setInt(8, quantity);
            pstm.setInt(7, adminID);
            if (!avatar.isEmpty()) {
                System.out.println("Have avatar!");
                pstm.setString(9, avatar);
                pstm.setInt(10, id);
            } else {
                pstm.setInt(9, id);
            }
            pstm.execute();
            cnn.close();
            System.out.println("Coupon Update!!");
        } catch (Exception e) {
            System.out.println("updateCoupon(): " + e.getMessage());
        }
    }

    private int getLastID() {
        connect();
        try {
            String strSelect = "select CouponID from Coupon order by CouponID desc";
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

    public List<Coupon> getDataPage(int page, List<Coupon> p, int npp) {
        //npp: number of coupons per page 
        List<Coupon> list = new ArrayList<>();
        for (int i = 0; i < p.size(); i++) {
            if (i / npp == page - 1) {
                list.add(p.get(i));
            }
        }
        return list;
    }

    public void deleteCouponDetail(int id) {
        connect();
        try {
            String strDelete = "DELETE FROM CouponDetail WHERE CouponID = ? ";
            pstm = cnn.prepareStatement(strDelete);
            pstm.setInt(1, id);
            pstm.execute();
            cnn.close();
            System.out.println("CouponDetail Deleted!!");
        } catch (Exception e) {
            System.out.println("deleteCouponDetail(): " + e.getMessage());
        }
    }

    public void addCouponDetail(int id, String[] productRequired, String[] productDiscounted) {
        connect();
        int count = 0;
        for (String pd : productDiscounted) {
            for (String pr : productRequired) {
                try {
                    count++;
                    String strInsert = "INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], "
                            + "[Product_required]) "
                            + "VALUES (?, ?, ?) ";
                    pstm = cnn.prepareStatement(strInsert);
                    pstm.setInt(1, id);
                    pstm.setInt(2, Integer.parseInt(pd));
                    pstm.setInt(3, Integer.parseInt(pr));
                    pstm.execute();
                } catch (Exception e) {
                    System.out.println("Attempt: " + count + " pd = " + pd + " pr = " + pr);
                    System.out.println("addCouponDetail(): " + e.getMessage());
                }
            }
        }

    }

    //related to Product
    private List<Product> getCouponDetailByID(int id, String productType) {
        connect();
        List<Product> dataDetail = new ArrayList<>();
        try {
            String strSelect = "select distinct CategoryName, ProductID, ProductName, Price, p.Quantity, p.CreatedDate, Status from CouponDetail cd "
                    + "join Product p on cd." + productType + " = p.ProductID "
                    + "join Category on p.CategoryID = Category.CategoryID "
                    + "where CouponID = ? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, id);
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
                    dataDetail.add(new Product(productID, productName, quantity, createdDate, categoryName, price));
                }
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getCouponDetailByID(): " + e.getMessage());
        }
        return dataDetail;
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

    public void changeStatus(int id) {
        connect();
        int status = 0;
        try {
            String strSelect = "Select Status from Coupon where CouponID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                status = rs.getInt(1);
            }
            cnn.close();
            System.out.println("Coupon Update!!");
        } catch (Exception e) {
            System.out.println("updateCoupon(): " + e.getMessage());
        }

        connect();
        try {
            String strUpdate = "UPDATE Coupon\n"
                    + "SET Status = ? \n"
                    + "WHERE CouponID =? ";
            pstm = cnn.prepareStatement(strUpdate);
            if (status == 0) {
                pstm.setInt(1, 1);
            } else if (status == 1) {
                pstm.setInt(1, 0);
            }
            pstm.setInt(2, id);
            pstm.execute();
            cnn.close();
            System.out.println("Status Update!!");
        } catch (Exception e) {
            System.out.println("changeStatus(): " + e.getMessage());
        }
    }

    public List searchCoupon(String startDate, String endDate, String content, int s) {
        connect();
        Date now = new Date();
        List<Coupon> data = new ArrayList<>();
        String strSelect = "SELECT [CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [CreatedDate],"
                + " [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Quantity], [Avatar] "
                + "FROM [SWP391_SE1706_G4].[dbo].[Coupon] WHERE";
        if (!startDate.equals("")) {
            strSelect += " [valid_from] >= ? AND ";
        }
        if (!endDate.equals("")) {
            strSelect += " [valid_from] <= ? AND ";
        }
        if (!content.equals("")) {
            strSelect += " [Message] LIKE ? OR [Name] LIKE ? AND ";
        }
        strSelect = strSelect.substring(0, strSelect.length() - 5) + " ORDER BY CreatedDate desc, ModifiedDate desc";
        try {
            System.out.println(strSelect);
            int count = 1;
            pstm = cnn.prepareStatement(strSelect);
            if (!startDate.equals("")) {
                pstm.setString(count, startDate);
                count++;
            }
            if (!endDate.equals("")) {
                pstm.setString(count, endDate);
                count++;
            }
            if (!content.equals("")) {
                pstm.setString(count, "%" + content + "%");
                count++;
                pstm.setString(count, "%" + content + "%");
                count++;
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);

                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);

                }

                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = rs.getInt(12);
                int maxvalue = rs.getInt(13);
                String bill_condition = moneyconfig((int) billcondition);
                String max_value = moneyconfig((int) maxvalue);
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                String avatar = rs.getString(16);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;
                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                }
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;
                if (status == s) {
                    Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
                    
                    data.add(c);
                } else if (s == -1) {
                    Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
                    
                    data.add(c);
                }
            }
            cnn.close();
            System.out.println("Coupon Searched!!");
        } catch (Exception e) {
            System.out.println("searchCoupon(): " + e.getMessage());
        }
        for (Coupon coupon : data) {
            coupon.progress = getCouponProgress(coupon.id)/coupon.quantity; 
            coupon.productDiscounted = getCouponDetailByID(coupon.id, "Product_discounted");
            coupon.productRequired = getCouponDetailByID(coupon.id, "Product_required");
            if (coupon.productDiscounted.isEmpty()) {
                coupon.type = true;
            }
        }
        return data;
    }

    public String ConvertFormateDate(String Redate) {
        String desiredFormat = "dd-MM-yyyy";

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

    public void addPromotion(int customerID, String id, int adminId) {
        connect();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        try {

            String strInsert = "INSERT [dbo].[Customers_Promotions] ([CouponID], [CustomerID], [CreatedDate], [CreatedBy])"
                    + "VALUES (?, ?, ?, ?) ";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, id);
            pstm.setInt(2, customerID);
            pstm.setString(3, dtf.format(LocalDateTime.now()));
            pstm.setInt(4, adminId);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("addPromotion(): " + e.getMessage());
        }
    }

    public List<Coupon> getAvailableCoupon(int pid) {
        connect();
        List<Coupon> data = new ArrayList<>();
        Date now = new Date();
        try {
            String strSelect = "select distinct c.[CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [CreatedDate],"
                    + "[ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Quantity], [Avatar] "
                    + "from Coupon c join CouponDetail cd on c.CouponID = cd.CouponID "
                    + "where c.free_check = 1 and (cd.Product_discounted = ? or cd.Product_discounted = 0) and c.Status = 1";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, pid);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);

                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);

                }

                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = 0, maxvalue = 0;
                billcondition = rs.getInt(12);
                maxvalue = rs.getInt(13);
                String bill_condition = moneyconfig((int) billcondition);
                String max_value = moneyconfig((int) maxvalue);
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                String avatar = rs.getString(16);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;
                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                }
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;

                Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
                
                data.add(c);
            }
        } catch (Exception e) {
            System.out.println("getAvailavleCoupon(): " + e.getMessage());
        }

        for (Coupon coupon : data) {
            coupon.progress = getCouponProgress(coupon.id)/coupon.quantity; 
            coupon.productDiscounted = getCouponDetailByID(coupon.id, "Product_discounted");
            coupon.productRequired = getCouponDetailByID(coupon.id, "Product_required");
            if (coupon.productDiscounted.isEmpty()) {
                coupon.type = true;
            }
        }

        return data;
    }

    public List<Coupon> getAvailableBillCoupon() {
        connect();
        List<Coupon> data = new ArrayList<>();
        List<Coupon> result = new ArrayList<>();
        Date now = new Date();
        try {
            String strSelect = "select distinct c.[CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [CreatedDate],"
                    + "[ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Quantity], [Avatar] "
                    + "from Coupon c join CouponDetail cd on c.CouponID = cd.CouponID "
                    + "where (cd.Product_discounted = 0 or cd.Product_discounted is null) ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);

                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);

                }

                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = 0, maxvalue = 0;
                billcondition = rs.getInt(12);
                maxvalue = rs.getInt(13);
                String bill_condition = Integer.toString(billcondition);
                String max_value = Integer.toString(maxvalue);
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                String avatar = rs.getString(16);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;
                            Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);                            
                            data.add(c);
                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                }

            }
        } catch (Exception e) {
            System.out.println("getAvailableBillCoupon(): " + e.getMessage());
        }

        for (Coupon coupon : data) {
            coupon.progress = getCouponProgress(coupon.id)/coupon.quantity; 
            coupon.productDiscounted = getCouponDetailByID(coupon.id, "Product_discounted");
            coupon.productRequired = getCouponDetailByID(coupon.id, "Product_required");
            if (coupon.productDiscounted.isEmpty()) {
                coupon.type = true;
                result.add(coupon);
            }
        }

        return result;
    }

    public List<Coupon> getPromotionCoupon(String uid) {
        connect();
        List<Coupon> data = new ArrayList<>();
        Date now = new Date();
        try {
            String strSelect = "select distinct c.[CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], c.[CreatedDate],"
                    + "c.[ModifiedDate], c.[CreatedBy], c.[ModifiedBy], [value], [bill_condition], [max_value], c.[Status], c.[Quantity], c.[Avatar] "
                    + "from Coupon c join CouponDetail cd on c.CouponID = cd.CouponID join Customers_Promotions cu on cu.CouponID = c.CouponID "
                    + "where cu.CustomerID = ? order by CreatedDate desc, ModifiedDate desc ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, uid);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);

                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);

                }

                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = 0, maxvalue = 0;
                billcondition = rs.getInt(12);
                maxvalue = rs.getInt(13);
                String bill_condition = Integer.toString(billcondition);
                String max_value = Integer.toString(maxvalue);
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                String avatar = rs.getString(16);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                            continue;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;

                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                    continue;
                }
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;

                Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
                
                data.add(c);
            }
        } catch (Exception e) {
            System.out.println("getPromotionCoupon(): " + e.getMessage());
        }

        for (Coupon coupon : data) {
            coupon.progress = getCouponProgress(coupon.id)/coupon.quantity; 
            coupon.productDiscounted = getCouponDetailByID(coupon.id, "Product_discounted");
            coupon.productRequired = getCouponDetailByID(coupon.id, "Product_required");
            if (coupon.productDiscounted.isEmpty()) {
                coupon.type = true;
            }
        }
        return data;
    }

    public List<Coupon> getAvailableProductCoupon() {
        connect();
        List<Coupon> data = new ArrayList<>();
        List<Coupon> result = new ArrayList<>();
        Date now = new Date();
        try {
            String strSelect = "select distinct c.[CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [CreatedDate],"
                    + "[ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Quantity], c.[Avatar] "
                    + "from Coupon c join CouponDetail cd on c.CouponID = cd.CouponID "
                    + "where (cd.Product_discounted != 0 )";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);

                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);

                }

                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = 0, maxvalue = 0;
                billcondition = rs.getInt(12);
                maxvalue = rs.getInt(13);
                String bill_condition = Integer.toString(billcondition);
                String max_value = Integer.toString(maxvalue);
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                String avatar = rs.getString(16);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;
                            Coupon c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
                            
                            data.add(c);
                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                }

            }
        } catch (Exception e) {
            System.out.println("getAvailableProductCoupon(): " + e.getMessage());
        }

        for (Coupon coupon : data) {
            coupon.progress = getCouponProgress(coupon.id)/coupon.quantity; 
            coupon.productDiscounted = getCouponDetailByID(coupon.id, "Product_discounted");
            coupon.productRequired = getCouponDetailByID(coupon.id, "Product_required");
            if (coupon.productDiscounted.isEmpty()) {
                coupon.type = true;
            } else {
                result.add(coupon);
            }
        }

        return result;
    }

    Coupon getCouponById(int cid) {
        connect();
        Date now = new Date();
        Coupon c = new Coupon();
        String strSelect = "select distinct c.[CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [CreatedDate],"
                + "[ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Quantity], c.[Avatar] "
                + "from Coupon c where CouponID = " + cid;
        try {
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String message = rs.getString(3);
                Date valid_from = this.format.parse(this.format.format(rs.getDate(4)));
                Date valid_to = this.format.parse(this.format.format(rs.getDate(5)));
                boolean free_check = rs.getBoolean(6);
                Date createdDate = rs.getDate(7);
                Date modifiedDate = new Date(0, 1, 1);
                String modifiedBy = "";
                if (rs.getDate(8) != null) {
                    modifiedDate = rs.getDate(8);
                    String modifiedD = format.format(modifiedDate);
                }
                String createdBy = rs.getString(9);
                if (rs.getString(10) != null) {
                    modifiedBy = rs.getString(10);
                }
                createdDate = (Date) format.parse(format.format(createdDate));
                String value = rs.getString(11);
                int billcondition = 0, maxvalue = 0;
                billcondition = rs.getInt(12);
                maxvalue = rs.getInt(13);
                String bill_condition = Integer.toString(billcondition);
                String max_value = Integer.toString(maxvalue);
                List<Product> productDiscounted = new ArrayList<>();
                List<Product> productRequired = new ArrayList<>();
                boolean type = false;
                int status = rs.getInt(14);
                int quantity = rs.getInt(15);
                if (status == 0) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 3;
                        }
                    }
                } else if (status == 1) {
                    if (valid_from.before(now)) {
                        if (valid_to.after(now)) {
                            status = 2;
                        }
                    }
                }
                if (valid_to.before(now)) {
                    status = 4;
                }
                c = new Coupon(name, id, message, valid_from, valid_to, createdDate.toString(), modifiedDate.toString(), createdBy, modifiedBy, free_check, type, productDiscounted, productRequired, bill_condition, max_value, status, value, quantity, avatar);
                
                break;
            }
            cnn.close();
            System.out.println("Coupon Searched!!");
        } catch (Exception e) {
            System.out.println("getCouponById(): " + e.getMessage());
        }
        c.progress = getCouponProgress(c.id)/c.quantity;
        c.productDiscounted = getCouponDetailByID(c.id, "Product_discounted");
        c.productRequired = getCouponDetailByID(c.id, "Product_required");
        if (c.productDiscounted.isEmpty()) {
            c.type = true;
        }

        return c;
    }
    
    
    public void promoteCouponUsed(String cusId, int couponid) {
        connect();
        try {
            String strUpdate = "update Customers_Promotions set Status = 1 where CustomerID = " + cusId + " and CouponID = "+ couponid;            
            pstm = cnn.prepareStatement(strUpdate);
            pstm.execute();
            cnn.close();
            System.out.println("promoteCouponUsed Update!!");
        } catch (Exception e) {
            System.out.println("promoteCouponUsed(): " + e.getMessage());
            e.printStackTrace();
        }
    }

}

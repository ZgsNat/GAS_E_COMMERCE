/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Peanut
 */
public class Customer {

    private int CustomerID;
    private String CustomerName;
    private String PhoneNumber;
    private String Email;
    private String Password;
    private String Address;
    private String RegistrationDate;
    private String DOB;
    private boolean Display;
    private String Avatar;

    public Customer() {
        connect();
    }

    public Customer(String Email, String Password) {
        this.Email = Email;
        this.Password = Password;
        connect();
    }

    public Customer(String CustomerName, String Email, String Password, String RegistrationDate, boolean Display) {
        this.CustomerName = CustomerName;
        this.Email = Email;
        this.Password = Password;
        this.RegistrationDate = RegistrationDate;
        this.Display = Display;
        connect();
    }

    public Customer(String CustomerName, String Email, String Password, String RegistrationDate, boolean Display, String Avatar) {
        this.CustomerName = CustomerName;
        this.Email = Email;
        this.Password = Password;
        this.RegistrationDate = RegistrationDate;
        this.Display = Display;
        this.Avatar = Avatar;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Password, String Address, String RegistrationDate, String DOB, boolean Display) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        this.DOB = DOB;
        this.Display = Display;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Address, String DOB, String RegistrationDate, boolean Display) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        this.DOB = DOB;
        this.Display = Display;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Address, String DOB, String RegistrationDate, boolean Display, String Avatar) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        this.DOB = DOB;
        this.Display = Display;
        this.Avatar = Avatar;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Address, String RegistrationDate, boolean Display) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        this.Display = Display;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Address, String dob, String RegistrationDate) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.DOB = dob;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Address, String dob, String RegistrationDate, String Avatar) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.DOB = dob;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        this.Avatar = Avatar;
        connect();
    }

    public Customer(String CustomerName, String PhoneNumber, String Email, String Password, String Address) {
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Address) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Address = Address;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Password, String Address) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        connect();
    }

    public Customer(int CustomerID, String CustomerName, String PhoneNumber, String Email, String Password, String Address, String RegistrationDate, String DOB, boolean Display, String Avatar) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        this.RegistrationDate = RegistrationDate;
        this.DOB = DOB;
        this.Display = Display;
        this.Avatar = Avatar;
        connect();
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setAvatar(String Avatar) {
        this.Avatar = Avatar;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getRegistrationDate() {
        return RegistrationDate;
    }

    public void setRegistrationDate(String RegistrationDate) {
        this.RegistrationDate = RegistrationDate;
    }

    public boolean isDisplay() {
        return Display;
    }

    public void setDisplay(boolean Display) {
        this.Display = Display;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
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

    public ArrayList<Customer> getListCustomer() {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate FROM Customer where Display = '1'";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
        } catch (Exception e) {
            System.out.println("getListCustomerByName(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Customer> getListCustomerbyName(String name) {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate FROM Customer where CustomerName LIKE N'%" + name + "%' and Display = '1'";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
        } catch (Exception e) {
            System.out.println("getListCustomer(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Customer> getListOrderAtoZ() {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate FROM Customer where Display = '1' order by CustomerName";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
        } catch (Exception e) {
            System.out.println("getListCustomerByName(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Customer> getListOrderZtoA() {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate FROM Customer where Display = '1' order by CustomerName desc";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
        } catch (Exception e) {
            System.out.println("getListCustomerByName(): " + e.getMessage());
        }
        return data;
    }

    public boolean checkCustomerExist() {
        try {
            String strSelect = "select * from Customer "
                    + "where CustomerName=? "
                    + "and PhoneNumber=? "
                    + "and Email=? "
                    + "and Password=? "
                    + "and Address=? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, CustomerName);
            pstm.setString(2, PhoneNumber);
            pstm.setString(3, Email);
            pstm.setString(4, Password);
            pstm.setString(5, Address);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkCustomerExist():" + e.getMessage());
        }
        return false;
    }

    public void register(String name, String email, String password, String dob, String phone, String address, String registrationDate) {
        try {
            String strInsert = "insert into Customer ([CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate]) values (?, ?, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, password);
            pstm.setString(5, address);
            pstm.setString(6, dob);
            pstm.setString(7, registrationDate);
            pstm.execute();
            System.out.println("Account Added!!");
        } catch (Exception e) {
            System.out.println("register(): " + e.getMessage());
        }
    }

    public ArrayList<Customer> getListOrderOldCustomer() {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate FROM Customer where Display = '1' order by RegistrationDate desc";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
        } catch (Exception e) {
            System.out.println("getListSortOldCustomer(): " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Customer> getListOrderNewCustomer() {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address], [DOB], RegistrationDate FROM Customer where Display = '1' order by RegistrationDate";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
        } catch (Exception e) {
            System.out.println("getListSortNewCustomer(): " + e.getMessage());
        }
        return data;
    }

    public void deleteThisCustomerId(String ID) {
        try {
            String str = "UPDATE Customer SET Display = '0' WHERE CustomerID = '" + ID + "'";
            pstm = cnn.prepareStatement(str);
            //pstm.setString(1, ID);
            //pstm.setInt(5, CategoryID);
            //pstm.setBoolean(5, Discontinued);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("DELETE:" + e.getMessage());
        }
    }

    public Customer getCustomerByID(String ID) {
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate,Display,[Avatar] FROM Customer where CustomerID = '" + ID + "'";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                String avatar = rs.getString(9);
                boolean display = rs.getBoolean(8);
                return new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate, display, avatar);
            }
        } catch (Exception e) {
            System.out.println("getCustomerByID: " + e.getMessage());
        }
        return null;
    }

//    public boolean update(String id, String name, String phone, String email, String adress, String redate) {
//        try {
//            String strUpdate = "update Customer set CustomerName = ?, PhoneNumber = ?, Email = ?, [Address] = ?, [RegistrationDate] = ? where CustomerID = ?";
//            pstm = cnn.prepareStatement(strUpdate);
//            pstm.setString(1, name);
//            pstm.setString(2, phone);
//            pstm.setString(3, email);
//            pstm.setString(4, adress);
//            pstm.setString(5, redate);
//            pstm.setString(6, id);
//            pstm.execute();
//            System.out.println("updatesuccess");
//            return true;
//        } catch (Exception e) {
//            System.out.println("Updatefail:" + e.getMessage());
//        }
//        return false;
//    }
    public boolean update(String id, String name, String phone, String email, String adress, String dob, String redate) {
        try {
            String strUpdate = "update Customer set CustomerName = ?, PhoneNumber = ?, Email = ?, [Address] = ?, [RegistrationDate] = ?, [DOB] = ? where CustomerID = ?";
            dob = ConvertDateInput(dob);
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, adress);
            pstm.setString(5, ConvertFormateDateInput(redate));
            pstm.setString(6, dob);
            pstm.setString(7, id);
            pstm.execute();
            System.out.println("updatesuccess");
            return true;
        } catch (Exception e) {
            System.out.println("Updatefail:" + e.getMessage());
        }
        return false;
    }

    public String ConvertFormateDate(String Redate) {
        String desiredFormat = "dd-MM-yyyy HH:mm:ss";

        SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat desiredDateFormat = new SimpleDateFormat(desiredFormat);
        String formattedDateTime = "";
        try {
            Date date = sqlFormat.parse(Redate);
            formattedDateTime = desiredDateFormat.format(date);
            System.out.println(formattedDateTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formattedDateTime;
    }

    public String ConvertFormateDateInput(String Redate) {
        String desiredFormat = "yyyy-MM-dd HH:mm:ss";

        SimpleDateFormat sqlFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        SimpleDateFormat desiredDateFormat = new SimpleDateFormat(desiredFormat);
        String formattedDateTime = "";
        try {
            Date date = sqlFormat.parse(Redate);
            formattedDateTime = desiredDateFormat.format(date);
            System.out.println(formattedDateTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formattedDateTime;
    }

    public String ConvertFormateDOB(String dob) {
        String desiredFormat = "dd-MM-yyyy";

        SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat desiredDateFormat = new SimpleDateFormat(desiredFormat);
        String formattedDateTime = "";
        try {
            Date date = sqlFormat.parse(dob);
            formattedDateTime = desiredDateFormat.format(date);
            System.out.println(formattedDateTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formattedDateTime;
    }

    public String ConvertDateInput(String dob) {
        String desiredFormat = "MM-dd-yyyy";

        SimpleDateFormat sqlFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat desiredDateFormat = new SimpleDateFormat(desiredFormat);
        String formattedDateTime = "";
        try {
            Date date = sqlFormat.parse(dob);
            formattedDateTime = desiredDateFormat.format(date);
            System.out.println(formattedDateTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formattedDateTime;
    }

    public boolean checkCustomer() {
        try {
            String strSelect = "Select * from Customer where email=? and Password=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, this.Email);
            pstm.setString(2, this.Password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                this.setCustomerID(id);
                return true;
            }
        } catch (Exception e) {
            System.out.println("CustomerLogin: " + e.getMessage());
        }
        return false;
    }

    public Customer getCustomer() {
        try {
            String str = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address],[DOB],RegistrationDate,[Avatar] FROM Customer where Email = '" + Email + "'";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(str);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                String avatar = rs.getString(8);
                return new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate, avatar);
            }
        } catch (Exception e) {
            System.out.println("getCustomerByName(): " + e.getMessage());
        }
        return null;
    }

    public boolean checkCustomerExist(String email) {
        try {
            String strSelect = "select * from Customer "
                    + "where Email=? ";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkCustomerExist():" + e.getMessage());
        }
        return false;
    }

    public void register(String name, String email, String encryptedPassword, String format) {
        try {
            String strInsert = "insert into Customer ([CustomerName], [Email], [Password], [RegistrationDate]) values (?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, encryptedPassword);
            pstm.setString(4, format);
            pstm.execute();
            System.out.println("Account Added!!");
        } catch (Exception e) {
            System.out.println("RegisterByGoogle(): " + e.getMessage());
        }
    }

    public List<String> getAllAddress(int cid) {
        List<String> data = new ArrayList<>();
        try {
            String strSelect = "SELECT distinct  o.[Name]\n"
                    + "      ,o.[Phone]\n"
                    + "      ,o.[Address]\n"
                    + "FROM [Order] o where o.CustomerID=?\n"
                    + "except\n"
                    + "SELECT distinct  o.[Name]\n"
                    + "      ,o.[Phone]\n"
                    + "      ,o.[Address]\n"
                    + "FROM [Order] o join Customer c on o.[Name] = c.CustomerName and o.[Phone]= c.PhoneNumber and o.[Address] = c.[Address] where o.CustomerID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, cid);
            pstm.setInt(2, cid);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String phone = rs.getString(2);
                String address = rs.getString(3);
                data.add(name + "; " + phone + "; " + address);
            }
        } catch (Exception e) {
            System.out.println("getAllAddress: " + e.getMessage());
        }
        return data;
    }

    public boolean update(String id, String name, String phone, String email, String address, String dob, String redate, String avatar) {
        try {
            String strUpdate = "update Customer set CustomerName = ?, PhoneNumber = ?, Email = ?, [Address] = ?, [RegistrationDate] = ?, [DOB] = ?, [Avatar] = ? where CustomerID = ?";
            dob = ConvertDateInput(dob);
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, address);
            pstm.setString(5, ConvertFormateDateInput(redate));
            pstm.setString(6, dob);
            pstm.setString(7, avatar);
            pstm.setString(8, id);
            pstm.execute();
            System.out.println("updatesuccess");
            return true;
        } catch (Exception e) {
            System.out.println("Updatefail:" + e.getMessage());
        }
        return false;
    }

    public void register(String name, String email, String encryptedPassword, String format, String picture) {
        try {
            String strInsert = "insert into Customer ([CustomerName], [Email], [Password], [RegistrationDate], [Avatar]) values (?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, encryptedPassword);
            pstm.setString(4, format);
            pstm.setString(5, picture);
            pstm.execute();
            System.out.println("Account Added!!");
        } catch (Exception e) {
            System.out.println("RegisterByGoogle(): " + e.getMessage());
        }
    }

    public List searchCustomer(int choice, String content) {
        connect();
        List<Customer> data = new ArrayList<>();
        String strSelect = "SELECT CustomerID,CustomerName,PhoneNumber,Email,[Address], [DOB], RegistrationDate "
                + "FROM Customer where Display = '1'     ";

        if (!content.equals("")) {
            strSelect += " and [CustomerName] LIKE ? AND ";
        }
        strSelect = strSelect.substring(0, strSelect.length() - 5);
        switch (choice) {
            case 1:
                strSelect += " ORDER BY CustomerName asc";
                break;
            case 2:
                strSelect += " ORDER BY CustomerName desc";
                break;
            case 3:
                strSelect += " ORDER BY RegistrationDate asc";
                break;
            case 4:
                strSelect += " ORDER BY RegistrationDate desc";
                break;
            default:
                break;
        }
        try {
            System.out.println(strSelect);
            int count = 1;
            pstm = cnn.prepareStatement(strSelect);
            if (!content.equals("")) {
                pstm.setString(count, "%" + content + "%");
                count++;
            }

            rs = pstm.executeQuery();
            while (rs.next()) {
                int customerID = rs.getInt(1);
                System.out.println(customerID);
                String customerName = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String dob = rs.getString(6);
                String converdob = ConvertFormateDOB(dob);
                String registrationdate = rs.getString(7);
                String convertdate = ConvertFormateDate(registrationdate);
                data.add(new Customer(customerID, customerName, phoneNumber, email, address, converdob, convertdate));
            }
            cnn.close();
            System.out.println("Customer Searched!!");
        } catch (SQLException ex) {
            System.out.println("Customer Search: " + ex.getMessage());
        }
        return data;
    }

    public List<Customer> getDataPage(int page, ArrayList<Customer> p, int npp) {
        List<Customer> list = new ArrayList<>();
        for (int i = 0; i < p.size(); i++) {
            if (i / npp == page - 1) {
                list.add(p.get(i));
            }
        }
        return list;
    }
    public Customer updateNewPassword(String newPassword, String email) {
        try {

            String strSQL = "update Customer\n"
                    + "set Password = ?\n"
                    + "Where Email = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, newPassword);
            pstm.setString(2, email);
            pstm.execute();
            System.out.println("Update success new password!");
            return new Customer(email, newPassword);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}

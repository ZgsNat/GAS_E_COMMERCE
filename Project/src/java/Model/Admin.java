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
import java.util.List;

/**
 *
 * @author minhn
 */
public class Admin {

    int id;
    String name, email, password, address, phone, avatar;
    String[] roles;
    String[] totalRoles = {"General Page", "ProductInfo Page", "CustomerList Page", "Coupon Page", "News Page", "Employees Page"};

    public Admin() {
        connect();
    }

    public Admin(int id, String phone, String name, String email, String password, String address) {
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        connect();
    }

    public Admin(int id, String phone, String name, String email, String password, String address, String avatar) {
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.avatar = avatar;
        connect();
    }

    public Admin(String email, String password) {
        this.email = email;
        this.password = password;
        connect();
    }

    public Admin(int id, String phone, String name, String email, String address, String[] roles) {
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.email = email;
        this.address = address;
        this.roles = roles;
        connect();
    }

    public Admin(int id, String phone, String name, String email, String address, String[] roles, String avatar) {
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.email = email;
        this.address = address;
        this.roles = roles;
        this.avatar = avatar;
        connect();
    }

    public Admin(String name, String email, String address, String phone) {
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        connect();
    }

    public String[] getTotalRoles() {
        return totalRoles;
    }

    public String[] getRoles() {
        return roles;
    }

    public void setRoles(String[] roles) {
        this.roles = roles;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    //Used for displaying the list of all of the orders in the history
    public boolean checkAdmin() {
        try {
            String strSelect = "Select adminId from Admin where email=? and Password=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, email);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                this.setId(id);
                return true;
            }
        } catch (Exception e) {
            System.out.println("AdminLogin: " + e.getMessage());
        }
        return false;
    }

    public String getAdminName() {
        try {
            String strSelect = "select AdminName from admin where AdminID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, this.id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (Exception e) {
            System.out.println("getAdminName: " + e.getMessage());
        }
        return null;
    }

    public String getRole() {
        try {
            String strSelect = "select role from admin where AdminID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, this.id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String role = rs.getString(1);
                return role;
            }
        } catch (Exception e) {
            System.out.println("getAdminRole: " + e.getMessage());
        }
        return null;
    }

    public List<Admin> getEmployeeList() {
        List<Admin> data = new ArrayList<Admin>();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Role, Avatar from [Admin] where status=1";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                String avatar = rs.getString(7);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                data.add(new Admin(id, phone, name, email, address, roleList, avatar));
                roleList = new String[roleList.length];
            }
        } catch (Exception e) {
            System.out.println("getEmployeeList: " + e.getMessage());
        }
        return data;
    }

    public Admin getInfo(String AdminID) {
        connect();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName,PhoneNumber, Email, [Address], Role, Avatar  from [Admin] where AdminID = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, AdminID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                String avatar = rs.getString(7);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                Admin a = new Admin(id, phone, name, email, address, roleList, avatar);
                System.out.println("getinfo=" + a);
                return a;
            }
        } catch (Exception e) {
            System.out.println("getInfo: " + e.getMessage());
        }
        return null;
    }

    @Override
    public String toString() {
        return "Admin{" + "id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", address=" + address + ", phone=" + phone + ", roles=" + roles + ", avatar= " + avatar + '}';
    }

    public String getAdminName(int id) {
        try {
            String strSelect = "select AdminName from admin where AdminID=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (Exception e) {
            System.out.println("getAdminName: " + e.getMessage());
        }
        return "";
    }

    public int getCreatedByAdminID(String pCreatedByName) {
        int adminID = 1;
        try {
            String strSelect = "select AdminID from [Admin] where AdminName=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, pCreatedByName);
            rs = pstm.executeQuery();

            while (rs.next()) {
                adminID = rs.getInt(1);
                return adminID;
            }
        } catch (Exception e) {
            System.out.println("getCreatedByAdminID(): " + e.getMessage());
        }
        return adminID;
    }

    public int getMidifiedByAdminID(String pModifiedByName) {
        int adminID = 1;
        try {
            String strSelect = "select AdminID from [Admin] where AdminName=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, pModifiedByName);
            rs = pstm.executeQuery();

            while (rs.next()) {
                adminID = rs.getInt(1);
                return adminID;
            }
        } catch (Exception e) {
            System.out.println("getMidifiedByAdminID(): " + e.getMessage());
        }
        return adminID;
    }

        public Admin updateThisAdmin(String id, String name, String phone, String email, String adress) {
        System.out.println(id + ";" + name + ";" + phone + ";" + email + ";" + adress + ";");

        try {
            String str = "update Admin set AdminName = ?, PhoneNumber = ?, Email = ?, [Address] = ? where AdminID = ?";
            pstm = cnn.prepareStatement(str);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, adress);
            pstm.setString(5, id);
            pstm.execute();
            System.out.println("updatesuccess");
            Admin a = new Admin(name, email, adress, phone);
            System.out.println(a);
            return a;
        } catch (Exception e) {
            System.out.println("Updatefail:" + e.getMessage());
        }
        return null;
    }

    public Admin updateThisAdmin(String id, String name, String phone, String email, String adress, String avatar) {
        try {
            String str = "update Admin set AdminName = ?, PhoneNumber = ?, Email = ?, [Address] = ?, [Avatar] = ? where AdminID = ?";
            pstm = cnn.prepareStatement(str);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, adress);
            pstm.setString(6, id);
            pstm.setString(5, avatar);
            pstm.execute();
//            System.out.println("updatesuccess");
            return new Admin(name, email, adress, phone);
        } catch (Exception e) {
            System.out.println("Updatefail:" + e.getMessage());
        }
        return null;
    }

    public void updateRole(String role) {
        try {
            int roleId = Integer.parseInt(role);
            String strUpdate = "update [Admin] set Role=? where AdminID=?";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setInt(1, roleId);
            pstm.setInt(2, this.id);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("UpdateAdminRole: " + e.getMessage());
        }
    }

    public Admin getAdminByNumber(String phoneNumber) {
        Admin result = null;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Avatar from Admin where [PhoneNumber]=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, phoneNumber);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String avatar = rs.getString(6);
                result = new Admin(id, phone, name, email, "", address, avatar);
            }
        } catch (Exception e) {
            System.out.println("getAdminByNumber: " + e.getMessage());
        }
        return result;
    }

    public void changePassword(String pass, String id) {
        try {
            String strUpdate = "UPDATE Admin\n"
                    + "SET [Password] = ? \n"
                    + "WHERE [AdminID] =? ";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, pass);
            pstm.setString(2, id);
            pstm.execute();
            cnn.close();
            System.out.println("Pass Update!!");
        } catch (Exception e) {
            System.out.println("changePassword(): " + e.getMessage());
        }
    }

    public void createNewAdmin(String name, String phone, String email, String address, String avatar, String role, String password) {
        try {
            String str = "INSERT [dbo].[Admin] ([AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [Avatar]) VALUES (?,?,?,?,?,?,1,?)";
            pstm = cnn.prepareStatement(str);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, password);
            pstm.setString(5, address);
            pstm.setString(6, role);
            pstm.setString(7, avatar);
            pstm.execute();
//            System.out.println("updatesuccess");
        } catch (Exception e) {
            System.out.println("CreateAdmin1:" + e.getMessage());
        }
    }

    public void createNewAdmin(String name, String phone, String email, String address, String role, String password) {
        try {
            String str = "INSERT [dbo].[Admin] ([AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status]) VALUES (?,?,?,?,?,?,1)";
            pstm = cnn.prepareStatement(str);
            pstm.setString(1, name);
            pstm.setString(2, phone);
            pstm.setString(3, email);
            pstm.setString(4, password);
            pstm.setString(5, address);
            pstm.setString(6, role);
            pstm.execute();
//            System.out.println("updatesuccess");
        } catch (Exception e) {
            System.out.println("CreateAdmin2:" + e.getMessage());
        }
    }

    public void deleteAdmin(int id) {
        try {
            String strUpdate = "UPDATE Admin\n"
                    + "SET [status] = ? \n"
                    + "WHERE [AdminID] =? ";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setInt(1, 0);
            pstm.setInt(2, id);
            pstm.execute();
            cnn.close();
            System.out.println("Employee Removed");
        } catch (Exception e) {
            System.out.println("Employee remove: " + e.getMessage());
        }
    }

    public List<Admin> getEmployeeById(int id) {
        List<Admin> data = new ArrayList<Admin>();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Role from [Admin] where status = 1 and AdminID = '" + id + "' ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                data.add(new Admin(id, phone, name, email, address, roleList));
                roleList = new String[roleList.length];
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getEmployeeListById: " + e.getMessage());
        }
        return data;
    }

    public List<Admin> getEmpployeebyName(String search) {
        List<Admin> data = new ArrayList<Admin>();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Role from [Admin] where status = 1 and AdminName like '%" + search + "%'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                data.add(new Admin(id, phone, name, email, address, roleList));
                roleList = new String[roleList.length];
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getEmployeeListByName: " + e.getMessage());
        }
        return data;
    }

    public List<Admin> getEmpployeebyPhone(String search) {
        List<Admin> data = new ArrayList<Admin>();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Role from [Admin] where status = 1 and PhoneNumber = '" + search + "'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                data.add(new Admin(id, phone, name, email, address, roleList));
                roleList = new String[roleList.length];
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getEmployeeListByPhone: " + e.getMessage());
        }
        return data;
    }
    public List<Admin> getEmployeeList(int index) {
        List<Admin> data = new ArrayList<Admin>();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Role, Avatar from [Admin] where status =1 order by AdminID OFFSET ? ROWS FETCH FIRST 5 ROWS ONLY";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setInt(1, (index - 1) * 5);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                String avatar = rs.getString(7);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                data.add(new Admin(id, phone, name, email, address, roleList, avatar));
                roleList = new String[roleList.length];
            }
        } catch (Exception e) {
            System.out.println("getEmployeeList: " + e.getMessage());
        }
        return data;
    }
    public int getNumberPage() {
        String strSelect = "select count(*) from [Admin]";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total % 5 == 0 ? total / 5 : (total / 5 + 1);
                return countPage;
            }
        } catch (Exception e) {
            System.out.println("getNumberPageEmployee(): " + e.getMessage());
        }
        return 0;
    }


    public List<Admin> getEmpployeebyEmail(String search) {
        List<Admin> data = new ArrayList<Admin>();
        String[] roleList;
        try {
            String strSelect = "select AdminID, AdminName, PhoneNumber, Email, Address, Role from [Admin] where status = 1 and Email like '%" + search + "%' ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);
                String role = rs.getString(6);
                if (role.equals("0")) {
                    roleList = this.totalRoles;
                } else {
                    roleList = new String[role.length()];
                    for (int i = 0; i < role.length(); i++) {
                        if (role.charAt(i) == '1') {
                            roleList[i] = "General Page";
                        } else if (role.charAt(i) == '2') {
                            roleList[i] = "ProductInfo Page";
                        } else if (role.charAt(i) == '3') {
                            roleList[i] = "CustomerList Page";
                        } else if (role.charAt(i) == '4') {
                            roleList[i] = "Coupon Page";
                        } else if (role.charAt(i) == '5') {
                            roleList[i] = "News Page";
                        } else if (role.charAt(i) == '6') {
                            roleList[i] = "Employee Pages";
                        }
                    }
                }
                this.setRoles(roleList);
                data.add(new Admin(id, phone, name, email, address, roleList));
                roleList = new String[roleList.length];
            }
            cnn.close();
        } catch (Exception e) {
            System.out.println("getEmployeeListByEmail: " + e.getMessage());
        }
        return data;
    }

    public int getAdminSize() {
        String strSelect = "select count(*) from [Admin] where status=1";
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
            System.out.println("getEmployeeNumber(): " + e.getMessage());
        }
        return 0;
    }

    public int[] getAllAdminID(int a) {
        int adminTotal[] = new int[a];
        String strSelect = "select AdminID from [Admin] where status=1";
        int count = 0;
        try {
            cnn = (new DBContext()).connection;
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                adminTotal[count]=id;
                count++;
            }
        } catch (Exception e) {
            System.out.println("getEmployeeNumber(): " + e.getMessage());
        }
        return adminTotal;
    }

}